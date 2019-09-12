<?
/**[N]**
 * JIBAS Education Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 18.0 (August 01, 2019)
 * @notes: JIBAS Education Community will be managed by Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
 * 
 * Copyright (C) 2009 Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?
require_once('../include/config.php');
$db_name = "jbsperpus";
require_once('../include/db_functions.php');
require_once('../include/common.php');
require_once('../include/rupiah.php');
$replid=$_REQUEST[replid];
$sender=$_REQUEST[sender];
OpenDb();
$sql = "SELECT * FROM pustaka WHERE replid='$replid'";
$result = QueryDb($sql);
$row = @mysql_fetch_array($result);
$judul = $row[judul];
$harga = $row[harga];
$katalog = $row[katalog];
$penerbit = $row[penerbit];
$penulis = $row[penulis];
$tahun = $row[tahun];
$format = $row[format];
$keyword = $row[keyword];
$keteranganfisik = $row[keteranganfisik];
$abstraksi = $row[abstraksi];
?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Detail Pustaka</title>
<link href="../style/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../scr/tools.js"></script>
<script language="javascript" src="pustaka.daftar.js"></script>
<style type="text/css">
<!--
.style1 {
	color: #666666;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<div id="title" align="right">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td  align="left">
			<? if($sender!='opac'){ ?>
            <a href="javascript:cetak(<?=$replid?>)"><img src="../images/ico/print.png" width="16" height="16" border="0" />&nbsp;Cetak</a>&nbsp;&nbsp;
            <? } ?>
			<!--<a href="javascript:cetak_nomor(<?=$replid?>)"><img src="../img/ico/print1.png" width="16" height="16" border="0" />&nbsp;Cetak&nbsp;Label</a>&nbsp;&nbsp;-->
			<a href="javascript:window.close()"><img src="../images/ico/hapus.png" border="0" />&nbsp;Tutup</a>		</td>
        <td  align="right">
       	  <font style="color:#FF9900; font-size:30px;"><strong>.:</strong></font>
    		<font style="font-size:18px; color:#999999">Detail Pustaka</font><br />
   		  <br /><br />
        </td>
      </tr>
    </table>
</div>
<table width="100%" border="0" cellspacing="5" cellpadding="5">
  <tr>
    <td width="8%" align="right" valign="top"><span class="style1">Judul</span></td>
    <td colspan="2"><?=$judul?>    </td>
  </tr>
  <tr>
    <td align="right" valign="top"><? if($sender!='opac'){ ?><span class="style1">Harga&nbsp;Satuan</span><? } ?></td>
    <td width="92%"><? if($sender!='opac'){ ?><?=FormatRupiah($harga)?><? } ?></td>
    <td width="92%" rowspan="7" valign="top">
    	<div style="margin-left:10px">
            <table width="125" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="125" align="center" valign="middle" bgcolor="#CCCCCC"><img alt='Cover' src="gambar.php?replid=<?=$replid?>&table=pustaka" /></td>
              </tr>
            </table>
   	    </div>    </td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong class="style1">Katalog</strong></td>
    <td>
	<? 
		$sql = "SELECT kode,nama FROM katalog WHERE replid='$katalog'";
		$result = QueryDb($sql);
		$row = @mysql_fetch_row($result);
		echo $row[0]." - ".$row[1];
	?>    </td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong class="style1">Penerbit</strong></td>
    <td>
	<? 
		$sql = "SELECT kode,nama FROM penerbit WHERE replid='$penerbit'";
		$result = QueryDb($sql);
		$row = @mysql_fetch_row($result);
		echo $row[0]." - ".$row[1];
	?>    </td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong class="style1">Penulis</strong></td>
    <td>
	<? 
		$sql = "SELECT kode,nama FROM penulis WHERE replid='$penulis'";
		$result = QueryDb($sql);
		$row = @mysql_fetch_row($result);
		echo $row[0]." - ".$row[1];
	?>    </td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong class="style1">Tahun&nbsp;Terbit</strong></td>
    <td><?=$tahun?></td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong class="style1">Format</strong></td>
    <td>
	<? 
		$sql = "SELECT kode,nama FROM format WHERE replid='$format'";
		$result = QueryDb($sql);
		$row = @mysql_fetch_row($result);
		echo $row[0]." - ".$row[1];
	?>    </td>
  </tr>
  <tr>
    <td align="right" valign="top" class="style1">Keyword</td>
    <td><?=$keyword?></td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong class="style1">Keterangan&nbsp;Fisik</strong></td>
    <td colspan="2"><?=$keteranganfisik?></td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong class="style1">Abstraksi</strong></td>
    <td colspan="2"><?=chg_p_to_div($abstraksi)?></td>
  </tr>
  <tr>
    <td align="right" valign="top"><strong class="style1">Alokasi&nbsp;Jumlah</strong></td>
<td>
        <?
		$sql = "SELECT p.nama,COUNT(d.replid) FROM daftarpustaka d, perpustakaan p WHERE d.pustaka='$replid' AND d.perpustakaan=p.replid GROUP BY d.perpustakaan ORDER BY p.nama";
		$result = QueryDb($sql);
		$num = @mysql_num_rows($result);
		if ($num>0){
		?>
        <table width="100%" border="1" cellspacing="0" cellpadding="0" class="tab">
          <tr>
            <td height="25" align="center" class="header">Perpustakaan</td>
            <td height="25" align="center" class="header">Jumlah</td>
          </tr>
          <?
		  while ($row = @mysql_fetch_row($result)){
		  ?>
          <tr>
            <td height="20" align="center"><?=$row[0]?></td>
            <td height="20" align="center"><?=$row[1]?></td>
          </tr>
          <?
		  }
		  ?>
      </table>
        <?
		}
		?>    </td>
    <td>&nbsp;</td>
  </tr>
</table>

</body>
</html>