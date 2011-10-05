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
require_once('../../sessionchecker.php');
require_once('../../include/common.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/config.php');
require_once('../../include/db_functions.php');
OpenDb();
$sql="SELECT * FROM jbsvcr.galerifoto WHERE idguru='".SI_USER_ID()."'";
$result=QueryDb($sql);
$num=@mysql_num_rows($result);
$cnt=1;
while ($row=@mysql_fetch_array($result)){
	$gbr[$cnt]="../../library/gambar.php?replid=".$row[replid]."&table=jbsvcr.galerifoto";
	$gbrkcl[$cnt]="../../library/gambar.php?replid=".$row[replid]."&table=jbsvcr.galerifoto";
	$ket[$cnt]=$row[keterangan];
	$fn[$cnt]=$row[filename];
	$rep[$cnt]=$row[replid];
$cnt++;
}
CloseDb();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<? if ($num>0){ ?>
    <ul id="slideshow">
    <? for ($i=1;$i<=$num;$i++){ ?>
        <li>
            <h3><?=$fn[$i]?></h3>
            <span><?=$WEB_GALLERY_DIR?>photos/<?=$fn[$i]?></span>
            <p><?=$ket[$i]?></p>
            <a href="#"><img src="<?=$WEB_GALLERY_DIR?>thumbnails/<?=$fn[$i]?>" alt="" /></a>
        </li>
    <? } ?>
    </ul>
    <div id="wrapper">
        <div id="fullsize">
            <div id="imgprev" class="imgnav" title="Previous Image"></div>
            <div id="imglink"></div>
            <div id="imgnext" class="imgnav" title="Next Image"></div>
            <div id="image"></div>
            <div id="information">
                <h3></h3>
                <p></p>
            </div>
        </div>
        <div id="thumbnails">
            <div id="slideleft" title="Slide Left"></div>
            <div id="slidearea">
                <div id="slider"></div>
            </div>
            <div id="slideright" title="Slide Right"></div>
        </div>
    </div>
<? } else { ?>
    <table width="100%" border="0" cellspacing="0" align="center">
        <tr>
            <td>
                <div align="center"><em>Tidak ada foto</em></div>
            </td>
        </tr>
    </table>
<? } ?>
</body>
</html>