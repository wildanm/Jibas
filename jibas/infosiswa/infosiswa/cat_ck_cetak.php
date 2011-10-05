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
require_once('../include/db_functions.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/getheader.php');
$nis = "";
if (isset($_REQUEST['nis']))
	$nis = $_REQUEST['nis'];
$bulan = "";
if (isset($_REQUEST['bulan']))
	$bulan = $_REQUEST['bulan'];
$tahun = "";
if (isset($_REQUEST['tahun']))
	$tahun = $_REQUEST['tahun'];
OpenDb();
$sql = "SELECT departemen FROM tahunajaran t, kelas k, siswa s WHERE s.nis='$nis' AND s.idkelas=k.replid AND k.idtahunajaran=t.replid";
$result = QueryDb($sql);
$row = @mysql_fetch_row($result);
$departemen = $row[0];

$sql="SELECT c.replid as replid,c.judul as judul, c.catatan as catatan, c.nip as nip, p.nama as nama, c.tanggal as tanggal ".
  	   "FROM jbsvcr.catatansiswa c, jbssdm.pegawai p ".
	   "WHERE c.nis='$nis' AND MONTH(c.tanggal)='$bulan' AND YEAR(c.tanggal)='$tahun' AND p.nip=c.nip ";
  //echo $sql;
  //exit;
$result=QueryDb($sql);
$num=@mysql_num_rows($result);
if ($num>0){		
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS INFOGURU [Cetak Catatan Kejadian]</title>
<script src="../script/SpryValidationTextField.js" type="text/javascript"></script>
<link href="../script/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" type="text/css" href="../style/tooltips.css">
<script language="javascript" src="../script/tables.js"></script>
</head>
<body >
<table border="0" cellpadding="10" cellpadding="5" width="780" align="left">
<tr>
	<td align="left" valign="top" colspan="2">
<? getHeader($departemen) ?>
	
<center>
  <font size="4"><strong>Catatan Kejadian</strong></font><br />
 </center><br /><br />
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="7%"><strong>Siswa</strong></td>
    <td width="93%">
	  <strong>
	  <?
	OpenDb();
	$r=QueryDb("SELECT nis,nama FROM jbsakad.siswa WHERE nis='$nis'");
	$row=@mysql_fetch_array($r);
	echo "[".$row[nis]."] ".$row[nama];
	CloseDb();
    ?>
	  </strong> </td>
  </tr>
  <tr>
    <td><strong>Bulan</strong></td>
    <td>
      <strong><?=$bulan_pjg[$bulan]?> <?=$tahun?></strong></td>
  </tr>
</table>
<br /> 
<? } ?>
<table width="100%" border="1" cellspacing="0" class="tab">
  <tr>
    <td height="30" width="43" class="header"><div align="center">No</div></td>
    <td height="30" width="900" class="header">Tanggal/Guru</td>
  </tr>
  <?
 
  if ($num>0){
  	$cnt=1;
	while ($row=@mysql_fetch_array($result)){
	$a="";
	if ($cnt%2==0)
		$a="style='background-color:#FFFFCC'";
  ?>
  <tr <?=$a?>>
    <td height="25" valign="top" rowspan="2"><div align="center">
      <?=$cnt?>
    </div></td>
    <td height="25" valign="top"><?=ShortDateFormat($row[tanggal])?><br /><?=$row[nip]?>-<?=$row[nama]?></td>
  </tr>
  <tr <?=$a?>><td height="25"><font face="Verdana, Arial, Helvetica, sans-serif" color="#999999">[<?=$row[judul]?>]</font><br /><?=$row[catatan]?></td>
  <? $cnt++;
  	}
  } else { ?>
  <tr>
    <td height="25" colspan="4"><div align="center"><em>Tidak ada catatan Kejadian Siswa untuk NIS : 
      <?=$nis?>
    </em></div></td>
  </tr>
  <? } ?>
</table>
</td>
</tr>    
</table>
</body>
<script language="javascript">
window.print();
</script>