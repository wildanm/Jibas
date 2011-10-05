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
require_once('../inc/config.php');
require_once('../inc/getheader.php');
require_once('../inc/common.php');
require_once('../inc/db_functions.php');

$departemen = $_REQUEST[departemen];
$tahunajaran = $_REQUEST[tahunajaran];
$tingkat = $_REQUEST[tingkat];
$semester = $_REQUEST[semester];
$pelajaran = $_REQUEST[pelajaran];
$dasarpenilaian = $_REQUEST[dasarpenilaian];
$rentang = $_REQUEST[rentang];
$i = $_REQUEST[i];
$xxx = split("_",$rentang);
if (count($xxx)==2){
	$filter = "AND n.nilaiangka >= $xxx[0] AND n.nilaiangka < $xxx[1]";
} else {
	//if ($i=='0')
	$filter = "AND n.nilaiangka >= $xxx[0]";	
}
$sql	=	"SELECT n.nis ".
			"FROM nap n, aturannhb a, infonap i, kelas k ".
			"WHERE n.idaturan = a.replid ".
			"AND a.idtingkat = $tingkat ".
			"AND a.idpelajaran = $pelajaran ".
			"AND a.dasarpenilaian = '$dasarpenilaian' ".
			"AND n.idinfo = i.replid ".
			"AND i.idpelajaran = $pelajaran ".
			"AND i.idsemester = $semester ".
			"AND i.idkelas = k.replid ".
			"AND k.idtahunajaran = $tahunajaran ".
			"AND k.idtingkat = $tingkat ".
			$filter;
			//"AND k.replid = s.idkelas ".
			//"AND s.nis = n.nis ".
			//"AND n.nilaiangka >= $rentang ";	
//echo $sql;
//IF(nilaiangka>=$rentang[1] AND nilaiangka<$rentang[0],1,0))
?>
<link href="../style/style.css" rel="stylesheet" type="text/css">

<table width="90%" border="1" class="tab" align="left">
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
  $query = "SELECT replid, nis, nama FROM siswa WHERE nis = '$row[0]'";
  $res = QueryDb($query);
  $sis = @mysql_fetch_row($res);
  ?>
  <tr>
    <td width="25" align="center"><?=$cnt?></td>
    <td align="center"><?=$row[0]?></td>
    <td>&nbsp;&nbsp;<?=$sis[2]?></td>
    <td align="center"><a href="javascript:lihat_siswa('<?=$sis[0]?>')"><img src="../img/lihat.png" width="16" height="16" border="0"></a></td>
  </tr>
  <?
  $cnt++;
  }
  ?>
</table>