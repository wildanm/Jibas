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
require_once('../../include/common.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/config.php');
require_once('../../include/getheader.php');
require_once('../../include/db_functions.php');
$replid="";
if (isset($_REQUEST['replid']))
	$replid=$_REQUEST['replid'];
OpenDb();
$sql="SELECT idpesan FROM jbsvcr.tujuanpesan WHERE replid=$replid";
//echo $sql;
//exit;
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);
$idpesan=$row[idpesan];
//echo $idpesan;
//exit;
$sql2="SELECT DATE_FORMAT(pg.tanggalpesan, '%Y-%m-%j') as tanggal, pg.judul as judul, pg.pesan as pesan, pg.nis as nis FROM jbsvcr.pesan pg WHERE pg.replid=$idpesan";
$result2=QueryDb($sql2);
$row2=@mysql_fetch_array($result2);
$sql_nama="SELECT nama FROM jbsakad.siswa WHERE nis='$row2[nis]'";
$result_nama=QueryDb($sql_nama);
$row_nama=@mysql_fetch_array($result_nama);
$nama=$row_nama[nama];
$sql3="SELECT * FROM jbsvcr.lampiranpesan WHERE idpesan=$idpesan";
$result3=QueryDb($sql3);
CloseDb();	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="../../script/tools.js"></script>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {font-weight: bold}
.style4 {
	color: #666666;
	font-weight: bold;
	font-size: 14px;
}
.style5 {color: #006633}
.style6 {color: #006666}
-->
</style>
</head>

<body>
 <table width="75%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <th height="39" colspan="3" scope="row"><input class="but" type="button" name="kembali" id="kembali" onclick="window.self.history.back();" value="Kembali" /></th>
   </tr>
  <tr>
    <th height="39" style="background-image:url(../../images_slice/buat_berita_01.jpg); background-repeat:no-repeat;" scope="row">&nbsp;</th>
    <td style="background-image:url(../../images_slice/buat_berita_03.jpg); background-repeat:repeat-x;"><div align="center" class="style4">Pesan Siswa</div></td>
    <td width="21" style="background-image:url(../../images_slice/buat_berita_05.jpg); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
  <tr>
    <th width="23" scope="row" style="background-image:url(../../images_slice/buat_berita_06.jpg); background-repeat:repeat-y;">&nbsp;</th>
    <td bgcolor="#F1F1F1"><span class="style1">
      <span class="style5">Dari :</span> 
      <?=$nama?><br /><br /><hr style="color:#006633" />
      <span class="style6">Judul :</span> 
      <?=$row2[judul]?><br />
      <hr style="color:#006633" />
      <span class="style5">Pesan :</span> 
      <?=$row2[pesan]?><br />
      <hr style="color:#006633" />
      <? if (@mysql_num_rows($result3)>0) { ?>
      <span class="style5">Lampiran :</span> <br />
	  <?
	  while ($row3=@mysql_fetch_array($result3)){
	 echo "<a title='Buka lampiran ini!' href=\"#\" onclick=newWindow('".$row3[direktori].$row3[namafile]."','View',640,480,'resizable=1'); ><img border='0' src='../../images/ico/titik.png' width='5' heiht='5'/> ".$row3['namafile']."</a><br>";
	  }
	  }
	  ?>
      </span>      </td>
    <td style="background-image:url(../../images_slice/buat_berita_08.jpg); background-repeat:repeat-y;">&nbsp;</td>
  </tr>
  <tr>
    <td height="16" style="background-image:url(../../images_slice/buat_berita_11.jpg); background-repeat:no-repeat;" scope="row">&nbsp;</td>
    <td style="background-image:url(../../images_slice/buat_berita_12.jpg); background-repeat:repeat-x;">&nbsp;</td>
    <td style="background-image:url(../../images_slice/buat_berita_14.jpg); background-repeat:no-repeat">&nbsp;</td>
  </tr>
</table>
</body>
</html>