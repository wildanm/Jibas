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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
$nis=$_REQUEST[nis];
$tahun=$_REQUEST[tahun];
OpenDb();
$sql_year="SELECT DISTINCT YEAR(tanggal) as tahun FROM jbsvcr.catatansiswa WHERE nis='$nis'";
//echo $sql_year;
$res_year=QueryDb($sql_year);
?>
Tahun
      <select name="tahun" id="tahun" onChange="chg_thn_ck('<?=$nis?>')">
        <?
	if (@mysql_num_rows($res_year)>0){
	while ($row_year=@mysql_fetch_array($res_year)){
	if ($tahun=="")
		$tahun=$row_year[tahun];
	?>
        <option value="<?=$row_year[tahun]?>" <?=StringIsSelected($tahun,$row_year[tahun])?>>
          <?=$row_year[tahun]?>
        </option>
        <?
	}
	} else {
	?>
        <option value="">Tidak ada data</option>
        <?
	}
	?>
    </select>