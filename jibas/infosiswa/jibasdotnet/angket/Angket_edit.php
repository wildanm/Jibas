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
require_once('../../include/errorhandler.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/common.php');
require_once('../../include/config.php');
require_once('../../include/getheader.php');
require_once('../../include/db_functions.php');

$replid = $_REQUEST['replid'];
$id= $replid;
OpenDb();
$sql = "SELECT p.judul, p.tglmulai, p.tglakhir, p.jenis FROM jbsvcr.angket p WHERE p.replid='".$replid."'";
$result = QueryDb($sql);
$row = mysql_fetch_array($result);

$judul = $row['judul'];
$mulai = $row['tglmulai'];
$akhir = $row['tglakhir'];
$jenisa = $row['jenis'];
$judula = $_REQUEST['judul'];

$tglmulai = explode("-",$mulai);
$mulaiAwal =$tglmulai[2]."-".$tglmulai[1]."-".$tglmulai[0];
$tglakhir = explode("-",$akhir);
$mulaiAkhir =$tglakhir[2]."-".$tglakhir[1]."-".$tglakhir[0];




	$judula=$_REQUEST['judulnya'];
	$jenis=$_REQUEST['jenis'];
	$tgl=explode("-",$_REQUEST['tglawal']);
	$tgl2=explode("-",$_REQUEST['tglselesai']);
	$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
	$tanggal2=$tgl2[2]."-".$tgl2[1]."-".$tgl2[0];
$sender=$_REQUEST['sender'];
if ($sender=="ubah"){
	OpenDb();

	//KAlo dari ubah berita guru================================================================================================================================
	$judula=$_REQUEST['judulnya'];
	$jenis=$_REQUEST['jenis'];
	$tgl=explode("-",$_REQUEST['tglawal']);
	$tgl2=explode("-",$_REQUEST['tglselesai']);
	$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
	$tanggal2=$tgl2[2]."-".$tgl2[1]."-".$tgl2[0];
	?>
		<script language="javascript">
			//alert ('Mau ngupdate beritanya');
		</script>
	<?
	$sql18="UPDATE jbsvcr.angket SET judul='".$judula."', tglmulai='".$tanggal."', tglakhir='".$tanggal2."', jenis='".$jenis."' WHERE replid='$replid'";
	$result18=QueryDb($sql18);
	echo $sql18;
	?>
	<script language="javascript">
	//var sq = document.getElementById('sql8').value;
    	//alert('Mau Edit Data yach'+$sq);
    </script>
	<?
	if ($result18){
		$sql1 = "SELECT LAST_INSERT_ID(replid) FROM jbsvcr.angket ORDER BY replid DESC ";
		$result1 = QueryDb($sql1);
		$row1 = mysql_fetch_row($result1); 
?>
<script language="javascript">
	parent.opener.refresh('<?=$row1[0]?>');				
	window.close();
</script>
<?
 }
} elseif ($sender=="tambah"){

}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../../style/calendar-win2k-1.css">
<link rel="stylesheet" type="text/css" href="../../style/style.css">
<link rel="stylesheet" type="text/css" href="../../style/tooltips.css">
<link href="../../script/SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS INFOSISWA [ Edit ANGKET ]</title>
<script type="text/javascript" src="../../script/calendar.js"></script>
<script type="text/javascript" src="../../script/lang/calendar-en.js"></script>
<script type="text/javascript" src="../../script/calendar-setup.js"></script>

<script language="javascript" src="../../script/tables.js"></script>
<script language="javascript" src="../script/tools.js"></script>
<script language="javascript" src="../../script/validasi.js"></script>
<script src="../../SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
<script language="javascript">
function validate() {
	var judulnya=document.getElementById('judulnya').value;
	if (judulnya.length==0){
		alert ('Anda harus mengisikan data untuk Judul Angket');
		document.getElementById('judulnya').focus();
		return false;
	}
	if (judulnya.length>=255){
		alert ('Karakter maksimal untuk Judul Angket adalah 255 karakter !');
		document.getElementById('judulnya').focus();
		return false;
	}
	return true;
}
function refresh() {	
	document.location.reload();
}
</script>
<link href="../../SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {
	color: #990000;
	font-style: italic;
	font-weight: bold;
}
-->
</style>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="background-color:#FFFFFF" onLoad="document.getElementById('judul').focus();">
<form name="angket" id="angket" onSubmit="return validate()" method="post" action="Angket_edit.php">
<input type="hidden" name="sender" id="sender" value="ubah" />
<input type="hidden" name="replid" id="replid" value="<?=$replid ?>" />
<table border="0" width="95%" cellpadding="2" cellspacing="2" align="center">
<!-- TABLE CONTENT -->
<tr height="25">
<td class="header" colspan="2"><div align="center">Edit  Angket</div></td>
</tr>
<tr>
  <td valign="top"><strong>Judul</strong></td>
  <td>
    <textarea name="judulnya" id="judulnya" cols="26" rows="5" onKeyPress="return focusNext('jenis', event)"><?=$judul ?></textarea>
  </td>
</tr>
<tr>
  <td valign="top"><strong>Tanggal Mulai</strong></td>
  <td>
  <div align="left">
      <input title="Klik untuk membuka kalender !" type="text" name="tglawal" id="tglawal" size="25" readonly="readonly" class="disabled" value="<?=$mulaiAwal; ?>" />
    <img title="Klik untuk membuka kalender !" src="../../images/ico/calendar_1.png" name="btntglmulai" width="16" height="16" border="0" id="btntglmulai"/>&nbsp;&nbsp;</div>
  </td>
</tr>
<tr>
	<td width="120" valign="top"><strong>Tanggal Akhir</strong></td>
	<td><div align="left">
      <input title="Klik untuk membuka kalender !" type="text" name="tglselesai" id="tglselesai" size="25" readonly="readonly" class="disabled" value="<?=$mulaiAkhir; ?>" />
    <img title="Klik untuk membuka kalender !" src="../../images/ico/calendar_1.png" name="btntglakhir" width="16" height="16" border="0" id="btntglakhir"/></div>    </td>
</tr>
<tr>
	<td width="120" valign="top"><strong>Pertanyaan</strong> </td>
    <td>
      <input type="radio" id="jenis" value="1" name="jenis" <? if($jenisa==1)  {  ?> checked="checked" <? } ?> />&nbsp;Guru&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" id="jenis" value="2" name="jenis" <? if($jenisa==2)  {  ?> checked="checked" <? } ?> />&nbsp;Umum
    </td>
</tr>
<tr>
  <td colspan="2" align="center">&nbsp;
    <input type="submit" name="Simpan" id="Simpan" value="Simpan" class="but" title="Simpan Angket Ini"/>&nbsp;
    <input type="button" name="Tutup" id="Tutup" value="Tutup" class="but" onClick="window.close()" />  </td>
</tr>
<!-- END OF TABLE CONTENT -->
</table>
</form>
   
<!-- Tamplikan error jika ada -->
<? if (strlen($ERROR_MSG) > 0) { ?>
<script language="javascript">
alert('<?=$ERROR_MSG?>');
var sprytextarea1 = new Spry.Widget.ValidationTextarea("judulnya");
</script>
<? } ?>

<!-- Pilih inputan pertama -->
</body>
<script type="text/javascript">
  Calendar.setup(
    {
	  inputField  : "tglawal",         
      ifFormat    : "%d-%m-%Y",  
      button      : "btntglmulai"    
    }
   );
   Calendar.setup(
    {
	  inputField  : "tglselesai",      
      ifFormat    : "%d-%m-%Y",   
      button      : "btntglakhir"     
    }
   );
  
</script>
</html>