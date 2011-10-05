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
require_once("../include/sessioninfo.php");
require_once("../include/db_functions.php");
require_once("../include/config.php");
require_once("../include/common.php");
require_once("../sessionchecker.php");
OpenDb();
$sql_num="SELECT * FROM jbsvcr.chat ORDER BY replid";
	$result_num=QueryDb($sql_num);
	$num=@mysql_num_rows($result_num);
	$num=(int)$num-10;
$sql="SELECT * FROM jbsvcr.chat ORDER BY replid ASC LIMIT ".$num.",10";
$result=QueryDb($sql);
while ($row=@mysql_fetch_array($result)){
$warna="";
?>
<font color="<?=$warna?>" size="1">
<?=$row[id]?><br />
<?=$row[pesan]?><br /><br />
</font>
<?
}
?>Ajaxna...