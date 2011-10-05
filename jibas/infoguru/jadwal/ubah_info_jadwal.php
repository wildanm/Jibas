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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/rupiah.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../library/departemen.php');
OpenDb();

if (isset($_REQUEST['replid']))
	$replid=$_REQUEST['replid'];
		
$sql_get="SELECT * FROM jbsakad.infojadwal WHERE replid='$replid'";  
$result_get=QueryDb($sql_get);
$row_get=@mysql_fetch_array($result_get);
$deskripsi=$_REQUEST['deskripsi'];
$tglmulai=$_REQUEST['tglmulai'];
$tglakhir=$_REQUEST['tglakhir'];
$tglmulaisimpan = TglDb($tglmulai);
$tglakhirsimpan = TglDb($tglakhir);

if (isset($_REQUEST['op']))
	$op=$_REQUEST['op'];

if ($op=="simpan"){

$sql_simpan_cek="SELECT * FROM jbsakad.infojadwal WHERE deskripsi='$deskripsi' AND replid<>'$replid'";  
$result_simpan_cek=QueryDb($sql_simpan_cek);
if ($row_simpan_cek=@mysql_num_rows($result_simpan_cek)){
	?>
		<SCRIPT type="text/javascript" language="javascript">
			alert ('Duplikasi Data, data sudah digunakan !');
			document.location.href="ubah_info_jadwal.php?op=simpan&deskripsi="+deskripsi+"&tglmulai="+tglmulai+"&tglakhir="+tglakhir;
		</SCRIPT>
	<?
} else {
$sql_simpan="UPDATE jbsakad.infojadwal SET deskripsi='$deskripsi',tglmulai='$tglmulaisimpan',tglakhir='$tglakhirsimpan' WHERE replid='$replid'";  
$result_simpan=QueryDb($sql_simpan);
if ($result_simpan){
	?>
	<SCRIPT type="text/javascript" language="javascript">
		parent.opener.refresh_setelah_add(<?=$replid?>);
		window.close();
	</SCRIPT>
	<?
}
}
CloseDb();
}
?>
<html>
<head>
	<title>Tambah Info Jadwal</title>
	<link rel="stylesheet" type="text/css" href="../style/style.css">
	<SCRIPT type="text/javascript" language="JavaScript" src="../script/tables.js"></SCRIPT>
	<SCRIPT type="text/javascript" language="javascript" src="../script/common.js"></script>
	<SCRIPT type="text/javascript" language="javascript" src="../script/ajax.js"></script>
	<SCRIPT type="text/javascript" language="javascript" src="../script/tools.js"></script>
	<SCRIPT type="text/javascript" language="javascript" src="../script/validasi.js"></script>
    <SCRIPT type="text/javascript" language="javascript" src="../script/cal2.js"></script>
	<SCRIPT type="text/javascript" language="javascript" src="../script/cal_conf2.js"></script>
	<style type="text/css">
		.box {
			background-color:white;
			border-top: solid black 1px;
			border-bottom: solid black 1px;
			border-left: solid black 1px;
			border-right: solid black 1px;
		}
	</style>
	<SCRIPT type="text/javascript" language="javascript">
	function simpan(){
	var replid=document.main.replid.value;
	var tglmulai=document.main.tglmulai.value;
	var tglakhir=document.main.tglakhir.value;
	var deskripsi=document.main.deskripsi.value;
	if (deskripsi==""){
		alert ('Informasi jadwal tidak boleh kosong !');
		document.main.deskipsi.focus();
		return false;
	}
	if (tglmulai==""){
		alert ('Tanggal mulai tidak boleh kosong !');
		document.main.tglmulai.focus();
		return false;
	}
	if (tglakhir==""){
		alert ('Tanggal selesai tidak boleh kosong !');
		document.main.tglakhir.focus();
		return false;
	}
	
	document.location.href="ubah_info_jadwal.php?op=simpan&deskripsi="+deskripsi+"&tglmulai="+tglmulai+"&tglakhir="+tglakhir+"&replid="+replid;
	
	}
	</script>
</head>
<body>
<table width="100%" height="100%" border="0" background="../images/disable_background.png"><tr><td valign="middle" align="center">
	<form name="main" id="main" action="tambah_info_jadwal.php">
	<table width="350px" style="border: 1px solid black; background-color:white ">
		<tr>
		  <td colspan="2" class="header"><div align="center">Input Info Jadwal</div></td>
		</tr>
		<tr>
			<td>Informasi Jadwal</td>
			<td><input type="text" name="deskripsi" id="deskripsi" style="width:200px " value="<?=$row_get['deskripsi']?>">
			<input type="hidden" name="replid" id="replid" value="<?=$replid?>"></td>
		</tr>
		
		<tr>
			<td>Periode</td>
			<td>
				<input type="text" name="tglmulai" id="tglmulai" style="width:80px" value="<?=TglText($row_get['tglmulai'])?>">
				<a href="javascript:showCal('Calendartglmulai')"><img src="../images/calendar.jpg" border="0"></a>
				S/D
				<input type="text" name="tglakhir"  id="tglakhir" style="width:80px" value="<?=TglText($row_get['tglakhir'])?>">
				<a href="javascript:showCal('Calendartglakhir')"><img src="../images/calendar.jpg" border="0"></a>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" name="Simpan" value="Simpan" class="but" onClick="simpan()">
				<input type="button" name="Tutup" value="Tutup" class="but" onClick="window.close()">
			</td>
		</tr>
	</table>
	</form>
</td></tr></table>
</body>
</html>