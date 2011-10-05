<?
/**[N]**
 * JIBAS Road To Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 2.5.0 (Juni 20, 2011)
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
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../include/common.php');

$nis_awal = $_REQUEST['nis_awal'];
$departemen = 0;
if (isset($_REQUEST['departemen']))
	$departemen = $_REQUEST['departemen'];

OpenDb();
$sql = "SELECT replid, departemen, nislama FROM riwayatdeptsiswa WHERE nis = '$nis_awal'";

$result = QueryDb($sql);
$row = @mysql_fetch_array($result);
$dep[0] = array($row['departemen'], $nis_awal);
//$no[1] = $row['nislama'];
if ($row['nislama'] <> "") {
	$sql1 = "SELECT replid, departemen, nislama FROM riwayatdeptsiswa WHERE nis = '$row[nislama]'";
	$result1 = QueryDb($sql1);
	$row1 = @mysql_fetch_array($result1);	
	$dep[1] = array($row1['departemen'], $row['nislama']);
	//$no[2] = $row1['nislama'];	
	if ($row1['nislama'] <> "") {				
		$sql2 = "SELECT replid, departemen, nislama FROM riwayatdeptsiswa WHERE nis = '$row1[nislama]'";
		$result2 = QueryDb($sql2);
		$row2 = @mysql_fetch_array($result2);					
		$dep[2] = array($row2['departemen'],$row1['nislama']) ;
	}	
}		

$nis = $dep[$departemen][1];

$sql_ajaran = "SELECT DISTINCT(t.replid), t.tahunajaran FROM riwayatkelassiswa r, kelas k, tahunajaran t WHERE r.nis = '$nis' AND r.idkelas = k.replid AND k.idtahunajaran = t.replid ORDER BY t.aktif DESC";
$result_ajaran = QueryDb($sql_ajaran);
$k = 0;
while ($row_ajaran = @mysql_fetch_array($result_ajaran)) {
	$ajaran[$k] = array($row_ajaran['replid'],$row_ajaran['tahunajaran']);
	$k++;
}

$sql_kls = "SELECT DISTINCT(r.idkelas), k.kelas, t.tingkat, k.idtahunajaran FROM riwayatkelassiswa r, kelas k, tingkat t WHERE r.nis = '$nis' AND r.idkelas = k.replid AND k.idtingkat = t.replid";
$result_kls = QueryDb($sql_kls);
$j = 0;
while ($row_kls = @mysql_fetch_array($result_kls)) {
	$kls[$j] = array($row_kls['idkelas'],$row_kls['kelas'],$row_kls['tingkat'],$row_kls['idtahunajaran']);
	$j++;
}

$depart = $dep[$departemen][0];
$sql_sem = "SELECT * FROM semester WHERE departemen = '$depart'";
$result_sem = QueryDb($sql_sem);
$l = 0;
while ($row_sem = @mysql_fetch_array($result_sem)) {
	$sem[$l] = array($row_sem['replid'],$row_sem['semester']);
	$l++;
}

$tahunajaran = $ajaran[0][0];
if (isset($_REQUEST['tahunajaran']))
	$tahunajaran = $_REQUEST['tahunajaran'];
$kelas = $kls[0][0];
if (isset($_REQUEST['kelas']))
	$kelas = $_REQUEST['kelas'];
$pelajaran = "";
if (isset($_REQUEST['pelajaran']))
	$pelajaran = $_REQUEST['pelajaran'];
?>
<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<input type="hidden" name="nis" id="nis" value="<?=$nis?>">
<input type="hidden" name="nis_awal" id="nis_awal" value="<?=$nis_awal?>">
<table width="100%" cellpadding="0" cellspacing="0">    
<tr>
	<td width="0">
    <!-- CONTENT GOES HERE //--->	
    <table border="0" cellpadding="2"cellspacing="2" width="100%" style="color:#000000">
    <tr>
    	<td width="15%"><strong>Departemen</strong></td>
        <td width="*"> 
    	<select name="departemen" id="departemen" onChange="change_dep()" style="width:150px">
		<? for ($i=0;$i<sizeof($dep);$i++) { ?>        	
            <option value="<?=$i ?>" <?=IntIsSelected($i, $departemen) ?> > <?=$dep[$i][0] ?> </option>
		<? } ?>
		</select>
    	</td>
        <? 
        
		
  		?>
        <td><strong>Riwayat Kelas</strong></td>
        <td>
        <select name="kelas" id="kelas" onChange="change()" style="width:200px">
   		<? for ($j=0;$j<sizeof($kls);$j++) {
				if ($kls[$j][3] == $tahunajaran) {
		?>
			<option value="<?=$kls[$j][0] ?>" <?=IntIsSelected($kls[$j][0], $kelas) ?> > <?=$kls[$j][2]." - ".$kls[$j][1] ?> </option>
		<? 		}
			} ?>
    	</select>    
		</td>
  	</tr>
    <tr>
        <td><strong>Tahun Ajaran</strong></td>
        <td>
        <select name="tahunajaran" id="tahunajaran" onChange="change()" style="width:150px">
   		<? for($k=0;$k<sizeof($ajaran);$k++) {?>
			<option value="<?=$ajaran[$k][0] ?>" <?=IntIsSelected($ajaran[$k][0], $tahunajaran) ?> > 
			<?=$ajaran[$k][1]?> </option>
		<? } ?>
    	</select>    
		</td>
        <td><strong>Pelajaran </strong></td>
        <td>
        <select name="pelajaran" id="pelajaran" onChange="change_pel()" style="width:200px">
        <? $sql = "SELECT DISTINCT p.replid, p.nama FROM ujian u, pelajaran p, nilaiujian n WHERE u.idpelajaran = p.replid AND u.idkelas = $kelas AND u.replid = n.idujian AND n.nis = '$nis' ORDER BY p.nama";
			//echo '<br> sql '.$sql;
			$result = QueryDb($sql); 				
			while ($row = @mysql_fetch_array($result)) {
			if ($pelajaran == "") 
				$pelajaran = $row['replid'];		
		?>
			<option value="<?=$row['replid']?>" <?=IntIsSelected($row['replid'], $pelajaran) ?> > 
			<?=$row['nama']?> </option>
		<? 	} ?>
    	</select>    
		</td>
    </tr>
    
    <tr height="500">
    	<td width="100%" valign="top" colspan="4">
        <br />
     
       
        <div id="TabbedPanels2" class="TabbedPanels">
        
		<ul class="TabbedPanelsTabGroup">
			<? for($k=0;$k<sizeof($sem);$k++) {?>
            <li class="TabbedPanelsTab" tabindex="0"><font size="1">Semester <?=$sem[$k][1]?></font></li>
           	<input type="hidden" name="semester" id="semester" value="<?=$sem[$k][0]?>">
            <? } ?>		   
            <!--<li class="TabbedPanelsTab" tabindex="0"><font size="1">Semester <?=$sem[0][1]?></font></li>
            <input type="hidden" name="semester" id="semester" value="<?=$sem[0][0]?>">
            <li class="TabbedPanelsTab" tabindex="0"><font size="1">Semester <?=$sem[1][1]?></font></li>-->
		</ul>
       
		<div class="TabbedPanelsContentGroup">
            <!--<div class="TabbedPanelsContent" id="panel5"></div>-->		    
           	<? //for($k=0;$k<sizeof($sem);$k++) {?>
	    	<div class="TabbedPanelsContent" id="panel<?=$k?>">
            <? for($k=0;$k<sizeof($sem);$k++) {?>            
	    	<div class="TabbedPanelsContent" id="panel<?=$k?>">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
                <td valign="top" background="" style="background-repeat:no-repeat; background-attachment:fixed">
                <table width="100%" border="0" height="100%">
                <tr>
                    <td valign="top" colspan="2">
                    <? 	OpenDb();
						$sql = "SELECT * FROM pelajaran WHERE replid = $pelajaran";
						$result = QueryDb($sql);
						CloseDb();
						$row = mysql_fetch_array($result);
						
					?>	
                    <font size="2" color="#000000"><b>Pelajaran <?=$row['nama']?></b></font></td>      	
                </tr>
                <tr>
                    <td valign="right"></td>
                </tr>
                <tr>
                    <td valign="top" align="right"> 
                    <a href="JavaScript:cetak('<?=$sem[$k][0]?>')"><img src="../images/ico/print.png" border="0" onMouseOver="showhint('Cetak!', this, event, '50px')"/>&nbsp;Cetak</a>&nbsp;&nbsp; 
                    </td>
                </tr>
		<?	OpenDb();
			$sql = "SELECT j.replid, j.jenisujian FROM jenisujian j, ujian u WHERE j.idpelajaran = $pelajaran AND u.idjenis = j.replid GROUP BY j.jenisujian";
			
            $result = QueryDb($sql);
            while($row = @mysql_fetch_array($result)){			
        ?>
                <tr>
                    <td colspan="2">
                    <br /><strong> <?=$row['jenisujian']?> </strong>
                    <br /><br />		
                    <table border="1" width="100%" id="table" class="tab">
                    <tr>		
                        <td width="5" height="30" align="center" class="header">No</td>
                        <td width="250" class="header" align="center" height="30">Tanggal</td>
                        <td width="10" height="30" align="center" class="header">Nilai</td>
                        <td width="400" class="header" align="center" height="30">Keterangan</td>
                    </tr>
			<? 	OpenDb();		
                $sql1 = "SELECT u.tanggal, n.nilaiujian, n.keterangan FROM ujian u, pelajaran p, nilaiujian n WHERE u.idpelajaran = p.replid AND u.idkelas = $kelas AND u.idpelajaran = $pelajaran AND u.idsemester = ".$sem[$k][0]." AND u.idjenis = $row[replid] AND u.replid = n.idujian AND n.nis = '$nis' ORDER BY u.tanggal";
                $result1 = QueryDb($sql1);
                $sql2 = "SELECT AVG(n.nilaiujian) as rata FROM ujian u, pelajaran p, nilaiujian n WHERE u.idpelajaran = p.replid AND u.idkelas = $kelas AND u.idpelajaran = $pelajaran AND u.idsemester = ".$sem[$k][0]." AND u.idjenis = $row[replid] AND u.replid = n.idujian AND n.nis = '$nis' ";
                $result2 = QueryDb($sql2);
                $row2 = @mysql_fetch_array($result2);
                $rata = $row2[rata];
              
                $cnt = 1;
                if (@mysql_num_rows($result1)>0){
                    while($row1 = @mysql_fetch_array($result1)){			
             ?>
                    <tr>        			
                        <td width="5" height="25" align="center"><?=$cnt?></td>
                        <td width="250" height="25"><?=format_tgl($row1[0])?></td>
                        <td width="10" height="25" align="center"><?=$row1[1]?></td>
                        <td height="25"><?=$row1[2]?></td>            
                    </tr>	
			<?		$cnt++;
                	} ?>
                    <tr>        			
                        <td colspan="2" height="25" align="center"><strong>Nilai rata rata</strong></td>
                        <td width="10" height="25" align="center"><?=round($rata,2)?></td>
                        <td height="25">&nbsp;</td>            
                    </tr>                    
			<? } else { ?>
                    <tr>        			
                        <td colspan="4" height="25" align="center">Tidak ada nilai</td>
                    </tr>
           	<? } ?>
                    </table>
                   <!-- <script language="javascript">
                        Tables('table', 1, 0);
                    </script>-->
                    </td>	
                </tr>
		<? } ?>
                </table>
                </td>
            </tr>
            </table>
            
            </div>
           <!-- <input type="hidden" name="panel" id="panel" value="<?=$k?>">-->       
		<? } ?>
		</div>
        </td>
    </tr>
    </table>
     <!-- END OF CONTENT //--->
	</td>
</tr>
</table>