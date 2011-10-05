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
//require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/theme.php');
require_once('../include/config.php');
require_once('../include/getheader.php');
require_once('../include/db_functions.php');

if (isset($_REQUEST['replid']))
	$replid = $_REQUEST['replid'];
	
OpenDb();
$sql = "SELECT *, k.kelas, p.nama, t.replid AS tahun, t.tahunajaran FROM jadwal j, jbssdm.pegawai p, jbsakad.tahunajaran t, kelas k WHERE j.replid = $replid AND j.nipguru = p.nip AND k.replid = j.idkelas AND k.idtahunajaran = t.replid";
$result = QueryDb($sql);
CloseDb();
$row = mysql_fetch_array($result);
$pelajaran = $row['idpelajaran'];
$departemen = $row['departemen'];
$info = $row['infojadwal'];
$hari = $row['hari'];
$kelas = $row['idkelas'];
$nipguru = $row['nipguru'];
$tahun = $row['tahunajaran'];
$tahunajaran = $row['tahun'];
$kls = $row['kelas'];
$nama = $row['nama'];
$jam = $row['jamke'];
$jam2 = $row['njam']+$jam-1;
$jum = $jam2 - $jam + 1;
$status = $row['status'];

$keterangan = $row['keterangan'];
	
	
if (isset($_REQUEST['departemen']))
	$departemen = $_REQUEST['departemen'];
if (isset($_REQUEST['kelas']))
	$kelas = $_REQUEST['kelas'];
if (isset($_REQUEST['info']))
	$info = $_REQUEST['info'];
if (isset($_REQUEST['maxJam']))
	$maxJam = (int)$_REQUEST['maxJam'];
if (isset($_REQUEST['jam']))
	$jam = $_REQUEST['jam'];
if (isset($_REQUEST['hari']))
	$hari = $_REQUEST['hari'];

if (isset($_REQUEST['pelajaran']))
	$pelajaran = $_REQUEST['pelajaran'];	
if (isset($_REQUEST['keterangan']))
	$keterangan = $_REQUEST['keterangan'];	
if (isset($_REQUEST['jam2']))
	$jam2 = (int)$_REQUEST['jam2'];	
if (isset($_REQUEST['nipguru']))
	$nipguru = $_REQUEST['nipguru'];	
if (isset($_REQUEST['status']))
	$status = $_REQUEST['status'];	


$ERROR_MSG = "";
if (isset($_REQUEST['Simpan'])) {		
	
	OpenDb();
	$sql1 = "SELECT replid, TIME_FORMAT(jam1, '%H:%i') AS jam1 FROM jam WHERE departemen = '$departemen' AND jamke = $jam";
	$result1 = QueryDb($sql1);
	$row1 = mysql_fetch_array($result1);
	$rep1 = $row1['replid'];
	$jm1 = $row1['jam1'];
	
	$sql2 = "SELECT replid, TIME_FORMAT(jam2, '%H:%i') AS jam2 FROM jam WHERE departemen = '$departemen' AND jamke = $jam2";
	$result2 = QueryDb($sql2);
	$row2 = mysql_fetch_array($result2);
	$rep2 = $row2['replid'];
	$jm2 = $row2['jam2'];
	
	$jum = $jam2 - $jam + 1;
   
	$sql3 = "SELECT * FROM jadwal WHERE idkelas = '$kelas' AND hari = $hari AND jam1 < '$jm2' AND replid <> $replid";
	$result3 = QueryDb($sql3);
	
	$sql4 = "SELECT * FROM jadwal WHERE departemen = '$departemen' AND hari = $hari AND nipguru = '$nipguru' AND jam2 > '$jm1' AND replid <> $replid";
	if (mysql_num_rows($result3) > 0) {
		CloseDb();		
		$ERROR_MSG = "Ada jadwal yang bentrok!";
	} else if (mysql_num_rows($result4) > 0) {
		CloseDb();		
		$ERROR_MSG = "Ada jadwal guru mengajar di kelas lain yang bentrok!";	
	} else {
		$sql = "UPDATE jadwal SET idkelas=$kelas, nipguru='$nipguru', idpelajaran = $pelajaran, departemen = '$departemen', infojadwal = $info, hari = $hari, jamke = $jam, njam = $jum, sifat = 1, status = $status, keterangan='$keterangan', jam1 = '$jm1', jam2 = '$jm2', idjam1 = $rep1, idjam2 = $rep2 WHERE replid = $replid";
		$result = QueryDb($sql);
		CloseDb();
	
		if ($result) { ?>
			<script language="javascript">
				opener.parent.footer.refresh();
				window.close();
			</script> 
<?		}
	}
}



?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" type="text/css" href="../style/tooltips.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS SIMAKA [Ubah Jadwal Kelas]</title>
<script src="../script/SpryValidationTextField.js" type="text/javascript"></script>
<link href="../script/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<script src="../script/SpryValidationTextarea.js" type="text/javascript"></script>
<link href="../script/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
<script src="../script/SpryValidationSelect.js" type="text/javascript"></script>
<link href="../script/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../script/tooltips.js"></script>
<script language="javascript" src="../script/tables.js"></script>
<script language="javascript" src="../script/tools.js"></script>
<script language="javascript" src="../script/validasi.js"></script>
<script language="javascript">

function pegawai() {
	var departemen = document.getElementById('departemen').value;
	var pelajaran = document.getElementById('pelajaran').value;
	newWindow('../library/guru.php?flag=0&departemen='+departemen+'&pelajaran='+pelajaran, 'Guru','600','600','resizable=1,scrollbars=1,status=0,toolbar=0');
}


function acceptPegawai(nip, nama, flag, dep, pel) {
	sendRequestText("getpelajaran.php", showPelajaran, "departemen=<?=$departemen?>&pelajaran="+pel);

	document.getElementById('nip').value = nip;
	document.getElementById('nipguru').value = nip;
	document.getElementById('nama').value = nama;
}

function showPelajaran(x) {
	document.getElementById("InfoPelajaran").innerHTML = x;
}

function validate() {
	var nip = document.getElementById('nip').value; 	
	var jam2 = document.getElementById('jam2').value; 
	var jam1 = document.getElementById('jam1').value; 
	var maxJam = document.getElementById('maxJam').value; 
	var ket = document.getElementById('keterangan').value; 
	
	if (nip.length == 0) {
		alert("NIP guru harus dimasukkan");
		return false;
	} else if (jam2.length == 0) {
		alert("Jam akhir harus dimasukkan");
		document.getElementById('jam2').focus();
		return false;
	} else if (ket.length > 255) {
		alert("Panjang keterangan tidak boleh dari 255 karakter");		
		document.getElementById('keterangan').focus();
		return false;
	} else if (isNaN(jam2)) {
		alert ('Data isian anak ke harus berupa bilangan');
		document.getElementById('jam2').focus();
		return false;
	} else if (parseInt(jam1) > parseInt(jam2)) {
		alert ('Jam akhir tidak boleh kurang dari jam awal');
		document.getElementById('jam2').focus();
		return false;
	} else if (parseInt(jam2) > parseInt(maxJam)) {
		alert ('Jam akhir tidak boleh lebih dari jumlah jam jadwal kelas');
		document.getElementById('jam2').focus();
		return false;
	}
	return true;
	
}

function focusNext(elemName, evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode :
        ((evt.which) ? evt.which : evt.keyCode);
    if (charCode == 13) {
		document.getElementById(elemName).focus();
        return false;
    }
    return true;
}

</script>
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="background-color:#FFFFFF" onLoad="document.getElementById('jam2').focus();">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr height="58">
	<td width="28" background="../<?=GetThemeDir() ?>bgpop_01.jpg">&nbsp;</td>
    <td width="*" background="../<?=GetThemeDir() ?>bgpop_02a.jpg">&nbsp;</td>
    <td width="28" background="../<?=GetThemeDir() ?>bgpop_03.jpg">&nbsp;</td>
</tr>
<tr height="150">
	<td width="28" background="../<?=GetThemeDir() ?>bgpop_04a.jpg">&nbsp;</td>
    <td width="0" style="background-color:#FFFFFF">
<form name="main" onSubmit="return validate()">
<input type="hidden" name="departemen" id="departemen" value="<?=$departemen ?>"/>
<input type="hidden" name="info" id="info" value="<?=$info ?>"/>
<input type="hidden" name="hari" id="hari" value="<?=$hari ?>"/>
<input type="hidden" name="kelas" id="kelas" value="<?=$kelas ?>"/>
<input type="hidden" name="maxJam" id="maxJam" value="<?=$maxJam ?>"/>
<input type="hidden" name="replid" id="replid" value="<?=$replid ?>"/>
<table border="0" width="95%" cellpadding="2" cellspacing="2" align="center">
<!-- TABLE CONTENT -->
<tr height="25">
	<td class="header" colspan="2"><div align="center">Tambah Jadwal Kelas</div></td>
</tr>
<tr>
	<td><strong>Departemen</strong></td>
    <td width="30%"><input type="text" name="dept" id="dept" size="10" value="<?=$departemen ?>" class="disabled" readonly/>
        <input type="hidden" name="departemen" id="departemen" value="<?=$departemen ?>"/></td>    
</tr>
<tr>
	<td width="100"><strong>Tahun Ajaran</strong></td>
    <td><input type="text" name="tahun" size="10" value="<?=$tahun ?>" readonly class="disabled"/>
    	<input type="hidden" name="tahunajaran" id="tahunajaran" value="<?=$tahunajaran?>">    </td>
       
</tr>
<tr>
	<td width="100"><strong>Kelas</strong></td>
    <td><input type="text" name="kls" size="10" value="<?=$kls ?>" readonly class="disabled"/>
    	<input type="hidden" name="kelas" id="kelas" value="<?=$kelas?>">    </td>
       
</tr>
<tr>
	<td align="left"><strong>Pelajaran</strong></td>
 	<td><div id ="InfoPelajaran">
      	<select name="pelajaran" id="pelajaran" onKeyPress="return focusNext('jam2', event)">
   	<?	OpenDb();
		$sql = "SELECT replid,nama FROM pelajaran WHERE departemen = '$departemen' AND aktif=1 ORDER BY nama";
		$result = QueryDb($sql);
		CloseDb();
		while ($row = @mysql_fetch_array($result)) {
			if ($pelajaran == "") 				
				$pelajaran = $row['replid'];			
		?>
        
    	<option value="<?=urlencode($row['replid'])?>" <?=IntIsSelected($row['replid'], $pelajaran)?> ><?=$row['nama']?></option>
                  
    <?	} ?>
    	</select></div>		</td>  
</tr>
<tr>
	<td><strong>Guru</strong></td>
    <td><strong>
    	<input type="text" name="nip" id="nip" size="10" class="disabled" value="<?=$nipguru ?>" readonly/>
        <input type="hidden" name="nipguru" id="nipguru" value="<?=$nipguru ?>"/>
    	<input type="text" name="nama" id="nama" size="20" class="disabled" value="<?=$nama ?>" readonly/>
		</strong>
        <a href="JavaScript:pegawai()"><img src="../images/ico/cari.png" border="0" /></a></td>
</tr>
<tr>
	<td><strong>Hari </strong></td>
    <td><strong><input type="text" name="namahari" id ="namahari" size="10" readonly class="disabled" value = "<?=NamaHari($hari)?>" /></strong> 
</tr>
<tr>
	<td><strong>Jam ke</strong></td>
    <td>   
    	<input type="text" name="jam1" id ="jam1" size="2" readonly class="disabled" value = "<?=$jam?>" />
        <input type="hidden" name="jam" id="jam" value="<?=$jam ?>"/> s/d 
    	<input type="text" name="jam2" id ="jam2" size="2" value="<?=$jam2 ?>" onKeyPress="return focusNext('status', event)" />
</tr>
<tr>
	<td><strong>Status</strong></td> 
    <td><select name="status" id="status" onkeypress="return focusNext('keterangan', event)">     
     	<option value=0 <?=IntIsSelected(0, $status)?>>Mengajar</option>
        <option value=1 <?=IntIsSelected(1, $status)?>>Asistensi</option>
        <option value=2 <?=IntIsSelected(2, $status)?>>Tambahan</option>
     	</select>
    </td>
</tr>
<tr>
	<td valign="top">Keterangan</td>
	<td>
    	<textarea name="keterangan" id="keterangan" rows="3" cols="40" onKeyPress="return focusNext('Simpan', event)"><?=$keterangan ?></textarea>
    </td>
</tr>
<tr>
	<td colspan="2" align="center">
    <input type="submit" name="Simpan" id="Simpan" value="Simpan" class="but" />&nbsp;
    <input type="button" name="Tutup" id="Tutup" value="Tutup" class="but" onClick="window.close()" />
    </td>
</tr>
<!-- END OF TABLE CONTENT -->
</table>
</form>
</td>
    <td width="28" background="../<?=GetThemeDir() ?>bgpop_06a.jpg">&nbsp;</td>
</tr>
<tr height="28">
	<td width="28" background="../<?=GetThemeDir() ?>bgpop_07.jpg">&nbsp;</td>
    <td width="*" background="../<?=GetThemeDir() ?>bgpop_08a.jpg">&nbsp;</td>
    <td width="28" background="../<?=GetThemeDir() ?>bgpop_09.jpg">&nbsp;</td>
</tr>
</table>

<!-- Tamplikan error jika ada -->
<? if (strlen($ERROR_MSG) > 0) { ?>
<script language="javascript">
	alert('<?=$ERROR_MSG?>');
</script>
<? } ?>

</body>
</html>
<script language="javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("jam2");
var sprytextarea1 = new Spry.Widget.ValidationTextarea("keterangan");
var spryselect1 = new Spry.Widget.ValidationSelect("pelajaran");
var spryselect4 = new Spry.Widget.ValidationSelect("status");
</script>