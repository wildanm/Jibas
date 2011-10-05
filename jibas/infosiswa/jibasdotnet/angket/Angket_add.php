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
$bulan="";
if (isset($_REQUEST['bulan']))
	$bulan=$_REQUEST['bulan'];
$tahun="";
if (isset($_REQUEST['tahun']))
	$tahun=$_REQUEST['tahun'];

$sender=$_REQUEST['Simpan'];
if ($sender=="Simpan"){
OpenDb();
$dir_bln=date(m);
$dir_thn=date(Y);
$dir = $updir . $dir_thn . $dir_bln;

//$jam=date(H).":".date(i).":00";
$judul=$_REQUEST['judul'];
$jenis=$_REQUEST['jenis'];
$tgl=explode("-",$_REQUEST['tglmulai']);
$tgl2=explode("-",$_REQUEST['tglakhir']);
$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
$tanggal2=$tgl[2]."-".$tgl2[1]."-".$tgl2[0];

$sql1="INSERT INTO jbsvcr.angket SET judul='$judul', tglmulai='".$tanggal."', tglakhir='".$tanggal2."', jenis='".$jenis."'";

$result1=QueryDb($sql1);
if ($result1){
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
} elseif ($sender=="ubah"){
	OpenDb();
	$page=(int)$_REQUEST['page'];
	$bulan=$_REQUEST['bulan'];
	$tahun=$_REQUEST['tahun'];
	$updir = $UPLOAD_DIR."lampiranbg\\";
	$dir_bln=date(m);
	$dir_thn=date(Y);
	$dir = $updir . $dir_thn . $dir_bln;

	//KAlo dari ubah berita guru================================================================================================================================
	$judul=$_REQUEST['judul'];
	$jenis=$_REQUEST['jenis'];
	$tgl=explode("-",$_REQUEST['tglmulai']);
	$tgl2=explode("-",$_REQUEST['tglakhir']);
	$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
	$tanggal2=$tgl[2]."-".$tgl2[1]."-".$tgl2[0];
	?>
		<script language="javascript">
		//alert ('Mau ngupdate beritanya');
		</script>
	<?
	$sql18="UPDATE jbsvcr.angket SET angket='$angket', tanggal='$tanggal' WHERE replid='$replid'";
	$result18=QueryDb($sql18);
?>
<script language="javascript">
document.location.href="daftar_angket.php?tahun=<?=$tahun?>";
</script>
<?
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
<title>JIBAS INFOSISWA [ Tambah ANGKET ]</title>
<script type="text/javascript" src="../../script/calendar.js"></script>
<script type="text/javascript" src="../../script/lang/calendar-en.js"></script>
<script type="text/javascript" src="../../script/calendar-setup.js"></script>

<script language="javascript" src="../../script/tables.js"></script>
<script language="javascript" src="../script/tools.js"></script>
<script language="javascript" src="../../script/validasi.js"></script>
<script src="../../SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
<script language="javascript">
function validate() {
	var judul=document.getElementById('judul').value;
	if (judul.length==0){
		alert ('Anda harus mengisikan data untuk Judul Angket');
		document.getElementById('judul').focus();
		return false;
	}
	if (judul.length>=255){
		alert ('Karakter maksimal untuk Judul Angket adalah 255 karakter !');
		document.getElementById('judul').focus();
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
<form name="angket" id="angket" onSubmit="return validate()" method="post" action="Angket_add.php">

<table border="0" width="95%" cellpadding="2" cellspacing="2" align="center">
<!-- TABLE CONTENT -->
<tr height="25">
<td class="header" colspan="2"><div align="center">Tambah  Angket</div></td>
</tr>
<tr>
  <td valign="top"><strong>Judul</strong></td>
  <td>
    <textarea name="judul" id="judul" cols="26" rows="5" onKeyPress="return focusNext('jenis', event)"></textarea>
  </td>
</tr>
<tr>
  <td valign="top"><strong>Tanggal Mulai</strong></td>
  <td>
  <div align="left">
      <input title="Klik untuk membuka kalender !" type="text" name="tglmulai" id="tglmulai" size="25" readonly="readonly" class="disabled" value="<?=date(d)."-".date(m)."-".date(Y); ?>" />
    <img title="Klik untuk membuka kalender !" src="../../images/ico/calendar_1.png" name="btntglmulai" width="16" height="16" border="0" id="btntglmulai"/>&nbsp;&nbsp;</div>
  </td>
</tr>
<tr>
	<td width="120" valign="top"><strong>Tanggal Akhir</strong></td>
	<td><div align="left">
      <input title="Klik untuk membuka kalender !" type="text" name="tglakhir" id="tglakhir" size="25" readonly="readonly" class="disabled" value="<?=date(d)."-".date(m)."-".date(Y); ?>" />
    <img title="Klik untuk membuka kalender !" src="../../images/ico/calendar_1.png" name="btntglakhir" width="16" height="16" border="0" id="btntglakhir"/></div>    </td>
</tr>
<tr>
	<td width="120" valign="top"><strong>Pertanyaan</strong> </td>
    <td>
      <input type="radio" id="jenis" value="1" name="jenis"/>&nbsp;Guru&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" id="jenis" value="2" name="jenis" checked="checked"/>&nbsp;Umum
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
var sprytextarea1 = new Spry.Widget.ValidationTextarea("judul");
</script>
<? } ?>

<!-- Pilih inputan pertama -->
</body>
<script type="text/javascript">
  Calendar.setup(
    {
	  inputField  : "tglmulai",         
      ifFormat    : "%d-%m-%Y",  
      button      : "btntglmulai"    
    }
   );
   Calendar.setup(
    {
	  inputField  : "tglakhir",      
      ifFormat    : "%d-%m-%Y",   
      button      : "btntglakhir"     
    }
   );
  
</script>
</html>