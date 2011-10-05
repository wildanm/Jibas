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
//require_once('../../include/errorhandler.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/common.php');
require_once('../../include/config.php');
require_once('../../include/getheader.php');
require_once('../../include/db_functions.php');

 $op = $_REQUEST['op'];
 if ($op == "xm8r389xemx23xb2378e23") {
	OpenDb();
	$sql = "DELETE FROM jbsvcr.pilihan WHERE idpertanyaan = '$_REQUEST[replid]'";	
	QueryDb($sql);		
	CloseDb();	
 }	

//$tgl=explode("-",$_REQUEST['tanggal']);
//$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
$replid=$_REQUEST['replid'];
$idang=$replid;
$judul = $_REQUEST['judul'];
$tglmulai = explode("-",$_REQUEST['tglmulai']);
$mulai =$tglmulai[2]."-".$tglmulai[1]."-".$tglmulai[0];
$tglakhir = explode("-",$_REQUEST['tglakhir']);
$akhir =$tglakhir[2]."-".$tglakhir[1]."-".$tglakhir[0];
$jenis=$_REQUEST['jenis'];
$jnsangket = "";
if ($jenis==1) {
	$jnsangket ="Guru";
} else {
   $jnsangket ="Umum";
}
   

OpenDb();		
$sql = "SELECT p.replid, p.judul, p.tglmulai, p.tglakhir, p.jenis, p.replid FROM jbsvcr.angket p WHERE replid='".$idang."'";
//echo '<br> sql '.$sql;
$result = QueryDb($sql); 
$row = @mysql_fetch_array($result);
$jdl = $row[1];
$tglmulai = explode("-",$row[2]);
$mulai =$tglmulai[2]."-".$tglmulai[1]."-".$tglmulai[0];
$tglakhir = explode("-",$row[3]);
$akhir =$tglakhir[2]."-".$tglakhir[1]."-".$tglakhir[0];
$jenis=$row[4];
$jnsangket = "";
if ($jenis==1) {
	$jnsangket ="Untuk Guru";
} else {
   $jnsangket ="Untuk Umum";
}
$idnya=$row[0];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" src="../../script/ajax.js"></script>
<script language="javascript" src="../../script/tables.js"></script>
<link rel="stylesheet" type="text/css" href="../../style/style.css">
<style type="text/css">
<!--
.style6 {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
<script language="javascript">
	var win = null;
function newWindow(mypage,myname,w,h,features) {
      var winl = (screen.width-w)/2;
      var wint = (screen.height-h)/2;
      if (winl < 0) winl = 0;
      if (wint < 0) wint = 0;
      var settings = 'height=' + h + ',';
      settings += 'width=' + w + ',';
      settings += 'top=' + wint + ',';
      settings += 'left=' + winl + ',';
      settings += features;
      win = window.open(mypage,myname,settings);
      win.window.focus();
}
function refresh() {	
	document.location.href = "list_angket.php";
}
function hapus(replid) {
	if (confirm("Apakah anda yakin akan menghapus angket ini?"))
		document.location.href = "list_angket.php?op=xm8r389xemx23xb2378e23&replid="+replid;
}
</script>
</head>

<body>
<div align="center">
 <table width="100%" border="0">
   <tr>
     <td width="246" align="left"><strong>Judul</strong></td>
     <td width="15">:</td>
     <td colspan="3" align="left">&nbsp;<?=$jdl ?></td>
   </tr>
   <tr>
     <td align="left"><strong>Rentang waktu</strong></td>
     <td>:</td>
     <td width="145" style="text-align:left">(<?=$mulai ?> )</td>
     <td width="18" style="text-align:center">s/d</td>
     <td width="512" style="text-align:left">( <?=$akhir ?> )</td>
    </tr>
   <tr>
     <td align="left"><strong>Jenis</strong></td>
     <td>:</td>
     <td colspan="3" align="left">&nbsp;<?=$jnsangket ?></td>
   </tr>
   <tr>
     <td colspan="2"></td>
     <td colspan="3" style="text-align:right"><a href="#" onclick="newWindow('tanyaAngket.php?replid=<?=$replid; ?>','','500','340','resizable=1,scrollbars=1,status=0,toolbar=0')" style="text-decoration:none;" title="Tambah Data Angket">
      <img src="../../images/ico/tambah.png" alt="tambah" width="16" height="16" border="0" style="vertical-align:text-top;"/>&nbsp;Tambah</a></td>
   </tr>
 </table>
</div><br />
<table class="tab" id="table" border="0" cellpadding="2" style="border-collapse:collapse" cellspacing="2" width="100%" align="left">
 <tr>
 	<td width="3%" class="header">No</td>
    <td width="72%" class="header">Pertanyaan</td>
    <td width="7%" class="header">Jenis</td>
    <td width="7%" class="header">&nbsp;</td>
 </tr>
 <? 
 OpenDb();
 $sql2="SELECT p.pertanyaan, p.jenis, p.idangket FROM jbsvcr.pertanyaan p WHERE p.idangket='".$idnya."'";
 $result2= QueryDb($sql2);
 if (mysql_num_rows($result2) > 0){
    while($output=mysql_fetch_array($result2)) {
	  $jns ="";
	  $idangket=$output[2];
	  if ($output[1]==1){
	  	$jns="Pilihan";
	  }
	  else{
	  	$jns="Essai";
	  }
 ?>	
   <tr>
      <td rowspan="2"><?=++$cnt?></td>
      <td><span class="style6">
      <em><?=$output[0] ?></em>
      </span></td>
      <td><?=$jns ?></td>
      <td>&nbsp;
      <img src="../../images/ico/ubah.png" alt="ubah" width="16" height="16" title="Ubah Pertanyaan angket" border="0"/>&nbsp;&nbsp;   
      <a href="#" onclick="hapus('<?=$idangket;?>')" style="cursor:pointer;" title="Hapus Angket ini !"><img src="../../images/ico/hapus.png" alt="hapus" width="16" height="16" border="0"/></a></td>
  </tr>
   <tr>
   	  <? 
	     if ($output[1]==1) {
	   		OpenDb();
			$tplPilihan="SELECT p.pilihan FROM jbsvcr.pilihan p WHERE idpertanyaan='$idangket'";
			$hslPilihan=QueryDb($tplPilihan);
			
	  ?> 	
      <td colspan="2">&nbsp;&nbsp;contoh pilihan</td>
      <td></td>
      <? 
	   } else {
	  ?>
      <td colspan="2">&nbsp;&nbsp;contoh Essai</td>
      <td width="1%"></td>
      <? 
	   } 
	  ?>
   </tr>
 <? 
   }
 } else{
 ?>
 <tr>
   <td colspan="4" style="text-align:center">Belum Ada Data untuk Angket</td>
 </tr>
 <?
  }
 ?>
</table>
   	<script language='JavaScript'>
	    Tables('table', 1, 0);
    </script>
</body>
</html>