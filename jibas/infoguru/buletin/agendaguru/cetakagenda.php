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
<?
require_once('../../include/common.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/config.php');
require_once('../../include/db_functions.php');
require_once('../../include/getheader.php');
require_once('../../include/sessionchecker.php');

$bulan = "";
if (isset($_REQUEST['bulan']))
	$bulan = $_REQUEST['bulan'];
	
$tahun = "";
if (isset($_REQUEST['tahun']))
	$tahun = $_REQUEST['tahun'];
	
$namabulan = array("Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","Nopember","Desember");	
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> Cetak Agenda Guru </TITLE>
<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
<link rel="stylesheet" type="text/css" href="../../style/style.css">
</HEAD>

<BODY>
<table border="0" cellpadding="5" width="780" align="left">
<tr><td align="left" valign="top">
  	<? getHeader('yayasan') ?>
<center>
  <font size="4"><strong>DAFTAR AGENDA GURU</strong></font><br />
 </center><br /><br />

<br />
Periode : <?=$namabulan[$bulan-1]?> <?=$tahun?><br>
Guru : <?=SI_USER_NAME()?><br><br>
<table width="100%" border="1" cellspacing="0">
  <tr height='30'>
	<td width='14%' align='center' class="header">Tanggal</td>
    <td width='*' class="header">Agenda</td>
  </tr>
<?
  OpenDb();
  
  $sql = "SELECT tanggal
		    FROM jbsvcr.agenda
		   WHERE idguru = '".SI_USER_ID()."'
		     AND YEAR(tanggal) = '$tahun'
			 AND MONTH(tanggal) = '$bulan'
		   GROUP BY tanggal";
  $result = QueryDb($sql);
  if (@mysql_num_rows($result)>0)
  {
	$cnt = 0;  
	while ($row=@mysql_fetch_array($result))
	{ ?>
	  <tr>
<? 		$sql1 = "SELECT *
			       FROM jbsvcr.agenda
				  WHERE idguru = '".SI_USER_ID()."'
				    AND tanggal = '$row[tanggal]'";
		$result1=QueryDb($sql1);
		$i = 0;
		while ($row1=@mysql_fetch_array($result1))
		{
		  $judul[$i] = $row1['judul'];
		  $komentar[$i] = $row1['komentar'];	
		  $i++;
		} ?>
		<td align='center'><?=LongDateFormat($row['tanggal'])?></td>
		<td height="25" align="left">
<? 	  	for ($x=0;$x<=$i-1;$x++)
		{	?>
			<strong><?=$judul[$x]?></strong><br>
			<?=$komentar[$x]?>
			<hr style='border-color: #666; border-style: dashed;' width='50%' align='left'>
<?	  	}	?>
		</td>
  </tr>
  <? 
  } } else { ?>
  <tr>
    <th height="25" scope="row" colspan="2" align="center">Tidak ada Agenda untuk bulan <?=$namabulan[$bulan-1]?></th>
  </tr>
  <? 
  }
  CloseDb(); ?>
</table>
</td>
<tr>
</table>
</body>
</html>
<script language="javascript">
	window.print();
</script>