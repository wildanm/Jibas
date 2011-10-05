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
require_once('../../include/errorhandler.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/common.php');
require_once('../../include/config.php');
require_once('../../include/getheader.php');
require_once('../../include/db_functions.php');
require_once('../../include/theme.php'); 
if (isset($_REQUEST['iddir']))
	$iddir = $_REQUEST['iddir'];
OpenDb();
$sql = "SELECT dirfullpath FROM jbsvcr.dirshare WHERE idroot=0";
$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$rootname = $row[0];
CloseDb();
OpenDb();
$sql="SELECT * FROM jbsvcr.dirshare WHERE replid=$iddir";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);
$dirfullpath=$row[dirfullpath];
CloseDb();
$fullpath = str_replace($rootname, "", $dirfullpath);
$cek = 0;
$ERROR_MSG = "";
if (isset($_REQUEST['Simpan'])) {
	echo "Masuk";
			$bln=date(m);
			if (strLen($bln)<2){
			$bln="0".$bln;
			}
			$thn=date(Y);
			$tgl=date(j);
			if (strLen($tgl)<2){
			$tgl="0".$tgl;
			}
			$jam=date(H).":".date(i).":00";

	$foto=$_FILES["file"];
  	$uploadedfile = $foto['tmp_name'];
	$uploadedtypefile = $foto['type'];
  	$uploadedsizefile = $foto['size'];
	$dir = $_REQUEST['dir'];//dirfullpath ada httpnya
	$iddir = $_REQUEST['iddir'];//fullpath
	$dest = str_replace($WEB_UPLOAD_DIR, $UPLOAD_DIR, $dir);
	$destinationdir = str_replace("/", "\\", $dest);
	move_uploaded_file($uploadedfile, $destinationdir.$foto['name']);
	OpenDb();
	$sql = "INSERT INTO jbsvcr.fileshare SET iddir=$iddir,filename='".$foto['name']."', filetime='".$thn."-".$bln."-".$tgl." ".$jam."',filesize=".$uploadedsizefile;
	$result = QueryDb($sql);
	if ($result) { ?>
		<script language="javascript">				
			opener.get_fresh();
			window.close();
		</script> 
<?	}
	CloseDb();
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../../style/style.css">
<link rel="stylesheet" type="text/css" href="../../style/tooltips.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS INFOGURU [Tambah File]</title>
<script language="JavaScript" src="../../script/tooltips.js"></script>

<script language="javascript" src="../../script/tables.js"></script>
<script language="javascript" src="../../script/tools.js"></script>
<script language="javascript" src="../../script/validasi.js"></script>
<script language="javascript">
function validate(){
var f = document.getElementById("file").value;
if (f.length==0){
	alert ("Anda harus mengisikan file yang hendak di Upload !");
	return false;
}
return true;
}
</script>
<style type="text/css">
<!--
.style1 {color: #0000FF}
-->
</style>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="background-color:#FFFFFF" >
<form name="main" method="POST" enctype="multipart/form-data" onsubmit="return validate()">
<table border="0" width="95%" cellpadding="2" cellspacing="2" align="center">
<!-- TABLE CONTENT -->
<tr height="25">
<td colspan="2" align="center" class="header">Tambah File</td>
</tr>
<tr>
  <td width="12%" align="left" bgcolor="#CCCCCC"><strong>Folder&nbsp;Tujuan&nbsp;:&nbsp;</strong></td>
  <td width="88%" align="center" bgcolor="#CCCCCC">
    <div align="left">&nbsp;<strong>(root)/<?=$fullpath?></strong></div></td>
</tr>
<tr>
  <td align="left"><strong>File&nbsp;:&nbsp;</strong></td>
  <td align="center">
    <div align="left">&nbsp;
      <input name="file" id="file" type="file" />
      <input type="hidden" name="fullpath" readonly value="<?=$fullpath?>" >
      <input type="hidden" name="dir" readonly value="<?=$dirfullpath?>" >
      <input type="hidden" name="iddir" readonly value="<?=$iddir?>" >
    </div></td>
</tr>
<tr>
  <td colspan="2" align="left" bgcolor="#CCCCCC"><div align="center"><span class="style1">Ukuran file maksimal yang dapat di-Upload adalah 
    <?=$max_uploaded_file_size?>
  </span></div></td>
  </tr>
<tr>
	<td colspan="2" align="center">
    <input type="submit" name="Simpan" id="Simpan" value="Simpan" class="but" />&nbsp;
    <input type="button" name="Tutup" id="Tutup" value="Tutup" class="but" onClick="window.close()" />    </td>
</tr>
<!-- END OF TABLE CONTENT -->
</table>
</form>
<!-- Tamplikan error jika ada -->
<? if (strlen($ERROR_MSG) > 0) { ?>
<script language="javascript">
	alert('<?=$ERROR_MSG?>');
</script>
<? } ?>

<!-- Pilih inputan pertama -->

<? if ($cek == 1) { ?>
<script language="javascript">
	document.getElementById('urutan').focus();
</script>

<? } ?>
</body>
</html>