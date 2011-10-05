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
$sql="SELECT * FROM jbsvcr.buletin WHERE replid=$_REQUEST[replid]";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="../style/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table width="100%" border="0" cellspacing="0">
 <tr>
    <th height="30" scope="row" align="center"><input class="but" type="button" value="Kembali" onclick="window.self.history.back();" /></th>
  </tr>
  <tr>
    <th scope="row">
<table width="95%" border="1" style="border:dotted; border-color:#999999;" align="center">
  <tr>
    <td>
	  <div align="left"><em><font color="#006666" size="1" face="Verdana, Arial, Helvetica, sans-serif"><?=$row['tempatbuletin']?>, <?=LongDateFormat($row['tanggalbuletin'])?></font></em><br />
      <font color="#0000FF"><u><em><?=$row['judul']?></em></u></font><br /><br />
      <font size="2" face="Arial">
	  <?//=removetag($row['buletin'])."..."?>
	  <?=$row['buletin']?>
	  </font><br /><br />
      </div>
	  
	  </td>
  </tr>
</table></th>
  </tr>
 
</table>
</body>
</html>