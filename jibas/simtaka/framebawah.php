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
require_once('inc/theme.php');
require_once('inc/sessioninfo.php');
require_once('inc/config.php');
require_once('inc/db_functions.php');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" src="scr/clock.js"></script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#7c7f4f" onload="startclock('clock')">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr height="32">
	<td width="10" background="<?=getThemeDir()?>bgmain_01.jpg">&nbsp;</td>
	<td background="<?=getThemeDir()?>bgmain_18.jpg" width="20">&nbsp;</td>
	<td background="<?=getThemeDir()?>bgmain_19.jpg" width="0"><font face="Verdana" size="+1" color="#FFFFFF">Selamat Datang&nbsp;<?=SI_USER_NAME()?></font></td>
	<td width="0" align="right" background="<?=getThemeDir()?>bgmain_19.jpg"><strong><font color="#FFFF00" face="Arial, Helvetica, sans-serif"><div id="clock"></div></font></strong>	  </td>
	<td background="<?=getThemeDir()?>bgmain_20.jpg" width="17">&nbsp;</td>	
    <td width="13" background="<?=getThemeDir()?>bgmain_01.jpg">&nbsp;</td>	
</tr>
</table>
</body>
</html>