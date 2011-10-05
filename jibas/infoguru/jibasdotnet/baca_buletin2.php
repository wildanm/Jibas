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
require_once("../include/sessioninfo.php");
require_once("../include/db_functions.php");
require_once("../include/config.php");
require_once("../include/common.php");
require_once("../sessionchecker.php");
OpenDb();
$sql="SELECT * FROM jbsvcr.buletin WHERE replid=$_REQUEST[replid]";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);

$res_prof=QueryDb("SELECT * FROM jbsvcr.profil WHERE nip='".SI_USER_ID()."'");
$row_prof=@mysql_fetch_array($res_prof);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="JavaScript" src="../script/resizing_background.js"></script>
<title>Untitled Document</title>
<link href="../style/style.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image:url(../library/gambarlatar.php?replid=<?=$row_prof[replid]?>&table=jbsvcr.profil); background-attachment:fixed;" onLoad="rbInit();"  onResize="rbResize()" bgcolor="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<script>
// "true" means "keep the proportions of the original image."
// If you pass "false" the image fills the whole window,
// even if it must be distorted to do so. Experiment.
//rbOpen(true);
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20" colspan="3" >&nbsp;</td>
  </tr>
  <tr>
    <td height="20" colspan="3" >&nbsp;&nbsp;<input name="ubah" type="button" class="but" style="width:100px;" value="My Profile" onClick="document.location.href='profile.php';">
    <!--&nbsp;<input name="tema" type="button" class="header" style="width:100px;" value="Tema Profil">&nbsp;<input name="ngobrol" type="button" class="header" style="width:100px;" value="Ajak Ngobrol">&nbsp;<input name="pesan" type="button" class="header" style="width:100px;" value="Kirim Pesan">--></td>
  </tr>
  <tr>
    <td width="19" height="20" style="background-image:url(../images_slice/bg_profil80_01.png); background-repeat:no-repeat; background-position:right;">&nbsp;</td>
    <td height="20" style="background-image:url(../images_slice/bg_profil80_02.png); background-repeat:repeat-x;"></td>
    <td width="19" height="20" style="background-image:url(../images_slice/bg_profil80_04.png); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
  <tr>
    <td width="19" style="background-image:url(../images_slice/bg_profil80_07.png); background-repeat:repeat-y; background-position:right;">&nbsp;</td>
    <td style="background-image:url(../images_slice/bg_profil80_08.png); background-repeat:repeat;" valign="top">
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
 <td width="19" style="background-image:url(../images_slice/bg_profil80_09.png); background-repeat:repeat-y;">&nbsp;</td>
  </tr>
  <tr>
    <td width="19" height="23" style="background-image:url(../images_slice/bg_profil80_10.png); background-repeat:no-repeat; background-position:right;">&nbsp;</td>
    <td height="23" style="background-image:url(../images_slice/bg_profil80_11.png); background-repeat:repeat-x;">&nbsp;</td>
    <td width="19" height="23" style="background-image:url(../images_slice/bg_profil80_12.png); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
</table>
<script>
	//rbClose("../library/gambarlatar.php?replid=<?=$row_prof[replid]?>&table=jbsvcr.profil");
</script>
</body>
</html>