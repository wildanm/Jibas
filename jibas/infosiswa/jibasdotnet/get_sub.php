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
require_once('../include/common.php');
require_once('../include/sessioninfo.php');
require_once('../include/config.php');
require_once('../include/getheader.php');
require_once('../include/db_functions.php');
$kat=$_REQUEST[kat];
?>
	<select name="subkat" size="1" id="subkat">
    	<? 
		OpenDb();
		$sql="SELECT * FROM jbsvcr.subkategoribuletin WHERE kategori='$kat' ORDER BY subkategori";
		$result=QueryDb($sql);
		if (@mysql_num_rows($result)>0){
		while ($row=@mysql_fetch_array($result)){
		if ($subkat=="")
			$subkat=$row[replid];
		?>
        <option value="<?=$row[replid]?>" <?=StringIsSelected($row[replid],$subkat)?>><?=$row[subkategori]?></option>
        <?
		}
		} else {
		?>
        <option value="">Tidak ada sub kategori</option>
        <?
		}
		CloseDb();
		?>
	</select>