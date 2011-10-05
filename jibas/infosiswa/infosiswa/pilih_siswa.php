<?
/**[N]**
 * JIBAS Road To Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 2.5.2 (October 5, 2011)
 * @notes: JIBAS Education Community will be managed by Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
 * 
 * Copyright (C) 2009 PT.Galileo Mitra Solusitama (http://www.galileoms.com)
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 **[N]**/ ?>
<?
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../include/sessioninfo.php');
require_once('../library/departemen.php');

$flag = 0;
if (isset($_REQUEST['flag']))
	$flag = (int)$_REQUEST['flag'];

$departemen = $_REQUEST['departemen'];
$tahunajaran = $_REQUEST['tahunajaran'];
$tingkat = $_REQUEST['tingkat'];
$kelas = $_REQUEST['kelas'];

$varbaris=10;
if (isset($_REQUEST['varbaris']))
	$varbaris = $_REQUEST['varbaris'];
$page=0;
if (isset($_REQUEST['page']))
	$page = $_REQUEST['page'];
$hal=0;
if (isset($_REQUEST['hal']))
	$hal = $_REQUEST['hal'];
$urut = "s.nama";	
if (isset($_REQUEST['urut']))
	$urut = $_REQUEST['urut'];	
$urutan = "ASC";	
if (isset($_REQUEST['urutan']))
	$urutan = $_REQUEST['urutan'];
OpenDb();
?>
<table border="0" width="100%" cellpadding="1" cellspacing="1" align="center">
<tr>
    <td colspan="2">
    <input type="hidden" name="varbaris" id="varbaris" value="<?=$varbaris ?>" />
	<input type="hidden" name="flag" id="flag" value="<?=$flag ?>" />
    <input type="hidden" name="urut" id="urut" value="<?=$urut ?>" />
    <input type="hidden" name="urutan" id="urutan" value="<?=$urutan ?>" />
    <!--<font size="2" color="#000000"><strong>Daftar Siswa</strong></font><br />-->    </td>
</tr>
<tr>
    <td width="20%"><font color="#000000">Departemen</font></td>
    <td><select name="depart" id="depart" onChange="change_departemen(0)" style="width:100%" onkeypress="return focusNext('tahunajaran', event)">
	<?	$dep = getDepartemen(SI_USER_ACCESS());    
        foreach($dep as $value) {
            if ($departemen == "")
                $departemen = $value; ?>
        <option value="<?=$value ?>" <?=StringIsSelected($value, $departemen) ?> >
        <?=$value ?>
        </option>
        <?	} ?>
  	</select>    </td>
  </tr>
<tr>
    <td><font color="#000000">Tahun&nbsp;Ajaran</font></td>
<td><select name="tahunajaran" id="tahunajaran" onChange="change()" style="width:100%" onkeypress="return focusNext('tingkat', event)">
   		 	<?
			OpenDb();
			$sql = "SELECT replid,tahunajaran,aktif FROM jbsakad.tahunajaran where departemen='$departemen' ORDER BY aktif DESC, replid DESC";
			$result = QueryDb($sql);
			CloseDb();
			while ($row = @mysql_fetch_array($result)) {
				if ($tahunajaran == "") 
					$tahunajaran = $row['replid'];
				if ($row['aktif']) 
					$ada = '(Aktif)';
				else 
					$ada = '';			 
			?>
            
    		<option value="<?=urlencode($row['replid'])?>" <?=IntIsSelected($row['replid'], $tahunajaran)?> ><?=$row['tahunajaran'].' '.$ada?></option>
    		<?
			}
    		?>
    	</select>        </td>
  </tr>
<tr>
  <td><font color="#000000">Tingkat</font></td>
  <td><select name="tingkat" id="tingkat" onchange="change()" style="width:100%" onkeypress="return focusNext('kelas', event)">
    <?
            OpenDb();
			$sql="SELECT * FROM tingkat WHERE departemen='$departemen' AND aktif = 1 ORDER BY urutan";
            $result=QueryDb($sql);
            while ($row=@mysql_fetch_array($result)){
                if ($tingkat=="")
                    $tingkat=$row['replid'];
        ?>
    <option value="<?=$row['replid']?>" <?=IntIsSelected($row['replid'], $tingkat)?>>
      <?=$row['tingkat']?>
      </option>
    <? 	} ?>
  </select></td>
  </tr>
<tr>
  <td><font color="#000000">Kelas</font></td>
  <td><select name="kelas" id="kelas" onchange="change_kelas()" style="width:100%">
    <?	if ($tahunajaran <> "") {
		OpenDb();
		$sql="SELECT k.replid,k.kelas FROM jbsakad.kelas k,jbsakad.tahunajaran ta,jbsakad.tingkat ti WHERE k.idtahunajaran=ta.replid AND k.idtingkat=ti.replid AND ti.departemen='$departemen' AND ta.replid=$tahunajaran AND ti.replid = $tingkat AND k.aktif=1 ORDER BY k.kelas";
    	$result=QueryDb($sql);
		CloseDb();
    	while ($row=@mysql_fetch_array($result)){
            if ($kelas == "")
                $kelas = $row[replid]; 
                ?>
    <option value="<?=$row[replid] ?>" <?=StringIsSelected($row[replid], $kelas) ?> >
    <?=$row[kelas] ?>
    </option>
    <?	} 
	} else {	?>
    <option></option>
    <? } ?>
  </select></td>
  </tr>
<tr>
	<td colspan="2" align="center">
    <br>
<? 
OpenDb();

if ($kelas <> "" && $tingkat <> "" && $tahunajaran <> "") { 
	$sql_tot = "SELECT s.nis, s.nama, k.kelas FROM jbsakad.siswa s,jbsakad.kelas k WHERE s.aktif=1 AND k.replid=s.idkelas AND s.alumni=0 AND k.replid='$kelas' ORDER BY s.nama"; 	
	$result_tot = QueryDb($sql_tot);
	$total = ceil(mysql_num_rows($result_tot)/(int)$varbaris);
	$jumlah = mysql_num_rows($result_tot);
	$akhir = ceil($jumlah/5)*5;
	
	$sql = "SELECT s.nis, s.nama, k.kelas FROM jbsakad.siswa s,jbsakad.kelas k WHERE s.aktif=1 AND k.replid=s.idkelas AND s.alumni=0 AND k.replid='$kelas' ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris";
	$result = QueryDb($sql);
	
	if (mysql_num_rows($result) > 0) {
?>
	<table width="100%" id="table" class="tab" align="center" cellpadding="2" cellspacing="0" border="1" bordercolor="#000000">
	<tr height="30" class="header" align="center">
        <td width="7%" >No</td>
        <td width="15%" onMouseOver="background='../style/formbg2agreen.gif';height=30;" onMouseOut="background='../style/formbg2.gif';height=30;" background="../style/formbg2.gif" style="cursor:pointer;" onClick="change_urut('s.nis','<?=$urutan?>','daftar')">N I S <?=change_urut('s.nis',$urut,$urutan)?></td>
        <td colspan="2" background="../style/formbg2.gif" style="cursor:pointer;" onClick="change_urut('s.nama','<?=$urutan?>','daftar')" onMouseOver="background='../style/formbg2agreen.gif';height=30;" onMouseOut="background='../style/formbg2.gif';height=30;">Nama <?=change_urut('s.nama',$urut,$urutan)?></td>
        <!--<td onMouseOver="background='../style/formbg2agreen.gif';height=30;" onMouseOut="background='../style/formbg2.gif';height=30;" background="../style/formbg2.gif" style="cursor:pointer;" onClick="change_urut('k.kelas','<?=$urutan?>','daftar')">Kelas <?=change_urut('k.kelas',$urut,$urutan)?></td>-->
        </tr>
<?
	if ($page==0)
		$cnt = 1;
	else 
		$cnt = (int)$page*(int)$varbaris+1;
	while($row = mysql_fetch_row($result)) { 
?>
	<tr height="25" onClick="pilih('<?=$row[0]?>','<?=$row[1]?>')" style="cursor:pointer">
		<td align="center" ><?=$cnt ?></td>
		<td align="center"><?=$row[0] ?></td>
		<td align="left"><?=$row[1] ?></td>
		<!--<td align="center"><?=$row[2] ?></td>-->
		<td width="10%" align="center"><img src="../images/ico/panahkanan.png" style="cursor:pointer" onclick="pilih('<?=$row[0]?>','<?=$row[1]?>')" /><!--<input type="button" value="&gt;" onClick="pilih('<?=$row[0]?>','<?=$row[1]?>')"  class="but">--></td>
	</tr>
	<?
	$cnt++;
	}
	CloseDb();	?>
    </table>
    <?  if ($page==0){ 
		$disback="style='visibility:hidden;'";
		$disnext="style='visibility:visible;'";
	}
	if ($page<$total && $page>0){
		$disback="style='visibility:visible;'";
		$disnext="style='visibility:visible;'";
	}
	if ($page==$total-1 && $page>0){
		$disback="style='visibility:visible;'";
		$disnext="style='visibility:hidden;'";
	}
	if ($page==$total-1 && $page==0){
		$disback="style='visibility:hidden;'";
		$disnext="style='visibility:hidden;'";
	}
	?>    </td>
</tr> 
<tr>
    <td colspan="2">
    <table border="0"width="100%" align="center"cellpadding="0" cellspacing="0">	
    <tr>
       	<td align="left"><font color="#000000">Hal
        <select name="hal" id="hal" onChange="change_hal('daftar')">
        <?	for ($m=0; $m<$total; $m++) {?>
             <option value="<?=$m ?>" <?=IntIsSelected($hal,$m) ?>><?=$m+1 ?></option>
        <? } ?>
     	</select>
	  	dari <?=$total?> hal
		
		<? 
     	// Navigasi halaman berikutnya dan sebelumnya
        ?>
        </font>    	</td>
    	</tr>
    </table>
<? } else { ?>
	<table width="100%" align="center" cellpadding="2" cellspacing="0" border="0" id="table">
	<tr height="30" align="center">
		<td>   
   
	<br /><br />	
	<font size = "2" color ="red"><b>Tidak ditemukan adanya data. <br />           
		Tambah data siswa di menu Pendataan Siswa pada bagian Kesiswaan. </b></font>	
	<br /><br />   		</td>
    </tr>
    </table>
<? }
} else {?>
    <table width="100%" align="center" cellpadding="2" cellspacing="0" border="0" id="table">
	<tr height="30" align="center">
		<td>   
   
	<br /><br />	
	<font size = "2" color ="red"><b>Tidak ditemukan adanya data. <br />          
		Tambah data Tahun Ajaran, Tingkat atau Kelas pada bagian Referensi. </b></font>	
	<br /><br />   		</td>
    </tr>
    </table>
<? } ?></td>    
</tr>
</table>