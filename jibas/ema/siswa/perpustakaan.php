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
require_once('../inc/common.php');
require_once('../inc/config.php');
require_once('../inc/getheader.php');
require_once('../inc/db_functions.php');
require_once('../inc/rupiah.php');
OpenDb();
//$idanggota=$_REQUEST[nis];

$nis = $_REQUEST[nis_awal];
//echo $_REQUEST[nis];
$sql = "SELECT pu.judul, p.tglpinjam, pu.replid, p.tglkembali,p.status,p.tglditerima FROM jbsperpus.pinjam p, jbsperpus.daftarpustaka d, jbsperpus.pustaka pu WHERE p.idanggota = '$nis' AND p.kodepustaka=d.kodepustaka AND d.pustaka=pu.replid AND p.status<>'0'";
//echo $sql;
$result = QueryDb($sql);
$cnt=1;
?>
<div style="height:15px">&nbsp;</div>
<table width="100%" border="1" cellspacing="0" cellpadding="0" class="tab">
  <tr>
    <td height="25" align="center" class="header">No</td>
    <td height="25" align="center" class="header">Judul Pustaka</td>
    <td height="25" align="center" class="header">Tgl Pinjam</td>
    <td height="25" align="center" class="header">Tgl Kembali</td>
    <td align="center" class="header">Status</td>
  </tr>
  <? if (@mysql_num_rows($result)>0) { ?>
  <? while ($row = @mysql_fetch_row($result)) { ?>
  <tr>
    <td height="20" align="center"><?=$cnt?></td>
    <td height="20"><div style="padding-left:5px;"><?=$row[0]?></div></td>
    <td height="20" align="center"><?=ShortDateFormat($row[1])?></td>
    <td height="20" align="center"><?=ShortDateFormat($row[3])?></td>
    <td align="center">
	<?
    if ($row[4]=='1')
		echo "Belum dikembalikan";
	elseif ($row[4]=='2')
		echo "Sudah dikembalikan pada<br>".ShortDateFormat($row[5]);		
	?>
    </td>
  </tr>
  <? $cnt++; ?>
  <? } ?>
  <? } else { ?>
  <tr>
    <td colspan="5" height="20" align="center">Belum ada data peminjaman</td>
  </tr>
  <? } ?>
</table>