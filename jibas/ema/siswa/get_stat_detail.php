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
require_once('../inc/config.php');
require_once('../inc/getheader.php');
require_once('../inc/common.php');
require_once('../inc/db_functions.php');

$departemen = $_REQUEST['departemen'];
$angkatan = $_REQUEST['angkatan'];
$kriteria = $_REQUEST['kriteria'];
$kondisi = $_REQUEST['kondisi'];
//echo "DEP=".$departemen." ANG=".$angkatan." KRIT=".$kriteria." KOON=".$kondisi;
$filter = "";
if ($departemen == "-1")
	$filter="AND a.replid=s.idangkatan ";
if ($departemen != "-1" && $angkatan == "")
	$filter="AND a.departemen='$departemen' AND a.replid=s.idangkatan ";
if ($departemen != "-1" && $angkatan != "")
	$filter="AND s.idangkatan=$angkatan AND a.replid=s.idangkatan AND a.departemen='$departemen' ";

$field = array('','s.agama','s.asalsekolah','s.darah','s.kelamin','s.warga','s.kodepossiswa','s.kondisi','s.pekerjaanayah','s.pekerjaanibu','s.pendidikanayah','s.pendidikanibu','','s.aktif','s.status','s.suku','YEAR(s.tgllahir)','');

if ($kriteria == 12){
	$kondisi = str_replace("__","+",$kondisi);
	$filter2 = " AND $kondisi";
} elseif ($kriteria == 17){
	$kondisi = str_replace("__","-",$kondisi);
	$filter2 = " AND $kondisi";
} elseif ($kriteria == 6 || $kriteria == 2 || $kriteria == 9 || $kriteria == 10 || $kriteria == 11 || $kriteria == 8){
	if ($kondisi=="")
		$filter2 = " AND ".$field[$kriteria]." is null ";
	else
		$filter2 = " AND ".$field[$kriteria]."='$kondisi'";
} else {
	$filter2 = " AND ".$field[$kriteria]."='$kondisi'";
}
//if {
	//$filter2 = " AND ".$field[$kriteria]."='$kondisi'";
//}

//FLOOR(DATEDIFF(NOW(), tgllahir) / 365)
$sql = "SELECT s.nis, s.nama, s.replid FROM 
		siswa s, angkatan a 
		WHERE a.aktif=1 AND s.aktif=1 $filter $filter2 ORDER BY s.nama";	
//echo $sql;
?>
<link href="../style/style.css" rel="stylesheet" type="text/css">

<table width="100%" border="1" class="tab" align="left">
  <tr>
    <td width="25" height="25" align="center" class="header">No.</td>
    <td height="25" align="center" class="header">NIS</td>
    <td height="25" align="center" class="header">Nama</td>
    <td height="25" align="center" class="header">&nbsp;</td>
  </tr>
  <?
  OpenDb();
  $result = QueryDb($sql);
  $cnt=1;
  while ($row = @mysql_fetch_row($result)){
  ?>
  <tr>
    <td width="25" align="center"><?=$cnt?></td>
    <td align="center"><?=$row[0]?></td>
    <td>&nbsp;&nbsp;<?=$row[1]?></td>
    <td align="center"><a href="javascript:lihat_siswa('<?=$row[2]?>')"><img src="../img/lihat.png" width="16" height="16" border="0"></a></td>
  </tr>
  <?
  $cnt++;
  }
  ?>
</table>