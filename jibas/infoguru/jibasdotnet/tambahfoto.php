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
require_once('../include/db_functions.php');
$source="";
if (isset($_REQUEST["source"]))
$source = $_REQUEST["source"];
OpenDb();
$sql="SELECT replid FROM jbsvcr.galerifoto WHERE idguru=".SI_USER_ID();
$result=QueryDb($sql);
$jatahfoto=$maxfoto-@mysql_num_rows($result);
CloseDb();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../style/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../style/calendar-win2k-1.css">
<title>Untitled Document</title>
<script type="text/javascript" src="../script/calendar.js"></script>
<script type="text/javascript" src="../script/lang/calendar-en.js"></script>
<script type="text/javascript" src="../script/calendar-setup.js"></script>
<script language="javascript" type="text/javascript" src="../script/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
function chg(y){
	var x=document.getElementById("file"+y).value;
	if (x.length>0){
		document.getElementById("keterangan"+y).style.visibility="visible";
		document.getElementById("jumlah").value="1";
		var result = '';
		var i=0;
		var xxx='';
		while (i <= x.length - 1){
			if (x.charAt(i)=='.'){
				xxx=x.charAt(i);
			}
			if (xxx.length>0){
				result = result + x.charAt(i);
			}
			i++;
		}
	document.getElementById("ext"+y).value = result;
	document.getElementById("tr"+y).style.background = "#FFFFFF" ;
	document.getElementById("keterangan"+y).focus();
	}
}
function validate(){
	var x=document.getElementById("jumlah").value;
	var y=1;
	if (x.length==0){
		alert ('Minimal harus ada 1 gambar yang akan di Upload!');
		return false;
	} else {
		while (y<=3){
		var ext=document.getElementById("ext"+y).value;
		var file=document.getElementById("file"+y).value;
		if (file.length>0){
			if (ext!='.JPG' && ext!='.jpg' && ext!='.Jpg' && ext!='.JPg' && ext!='.JPEG' && ext!='.jpeg'){
				alert ('Format Gambar harus ber-extensi jpg atau JPG !');
				document.getElementById("file"+y).value='';
				document.getElementById("tr"+y).style.background = "#FF8080" ;
				return false;
			} 
		}
		y++;
		}
	}
return true;
}

</script>
<style type="text/css">
<!--
.style1 {color: #FF0000}
.style2 {color: #009933}
-->
</style>
</head>
<body>
<form name="foto" id="foto" <? if ($source=="profil"){ ?> action="simpanfoto.php" <? } else if ($source=="galeri"){ ?> action="../buletin/galerifoto/simpanfoto.php" <? } ?> method="POST" onSubmit="return validate()" enctype="multipart/form-data">
<input name="source" id="source" type="hidden" size="20" value="<?=$source?>" />
<table width="100%" border="0" cellspacing="0" class="tab">
  <tr>
    <th colspan="2" class="header" scope="row">Tambah Foto Baru</th>
  </tr>
  <tr>
    <th align="center" bgcolor="#CCCC99" scope="row">File Gambar</th>
    <th align="center" bgcolor="#CCCC99" scope="row">Keterangan</th>
  </tr>
  <?
  if ($jatahfoto<3){
  $jatahnya=$jatahfoto;
  } else {
  $jatahnya=3;
  }
  if ($jatahnya!=0){
	  for ($i=1;$i<=$jatahnya;$i++){
  ?>
  <tr id="tr<?=$i?>">
    <th scope="row" align="center"><input name="file<?=$i?>" id="file<?=$i?>" type="file" size="20" onChange="chg('<?=$i?>')" /></th>
    <th scope="row" align="center"><div align="left">
      <input type="text" id="keterangan<?=$i?>" name="keterangan<?=$i?>" style="visibility:hidden; " />
	  <input type="hidden" id="ext<?=$i?>" name="ext<?=$i?>"/>
    </div></th>
  </tr>
  <? } } else { ?>
  <tr>
    <th colspan="2" align="center" scope="row"><span class="style1">Maaf, jumlah gambar yang Anda miliki sudah melebihi batas Quota !</span><br>
	  <span class="style2">Silakan hapus bererapa gambar terlebih dahulu !</span></th>
  </tr>
  <? } ?>
  <tr>
    <th colspan="2" align="center" scope="row">* Format Gambar harus jpg atau jpeg</th>
  </tr>
  <tr>
    <th colspan="2" align="center" scope="row"><input title="Simpan foto !" type="submit" class="but" name="simpan" id="simpan" value="Simpan" />&nbsp;&nbsp;
	<input type="hidden" id="jumlah" name="jumlah"/>
    <input title="Tutup !" type="button" class="but" onClick="window.close();" name="tutup" id="tutup" value="Tutup" /></th>
  </tr>
</table>
</form>

</body>
</html>