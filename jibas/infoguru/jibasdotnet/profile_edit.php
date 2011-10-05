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
require_once('../include/imageresizer.php');
require_once('../include/fileinfo.php');
function delete($file) {
 if (file_exists($file)) {
   chmod($file,0777);
   if (is_dir($file)) {
     $handle = opendir($file); 
     while($filename = readdir($handle)) {
       if ($filename != "." && $filename != "..") {
         delete($file."/".$filename);
       }
     }
     closedir($handle);
     rmdir($file);
   } else {
     unlink($file);
   }
 }
}
OpenDb();
$varbaris=5;
if (SI_USER_ID()=="")
	exit;
OpenDb();
$res=QueryDb("SELECT * FROM jbsvcr.profil WHERE nip='".SI_USER_ID()."'");
$row=@mysql_fetch_array($res);
CloseDb();

$op="";
if (isset($_REQUEST[op]))
	$op=trim($_REQUEST[op]);
if (isset($_REQUEST[simpan])){
	// Foto profile
	$foto	  =	$_FILES["foto"];
  	
	$origfile = $foto['name'];
	$ext 	  = GetFileExt($origfile);
	$fn  	  = GetFileName($origfile);
	$fn  	  = str_replace(" ", "", $fn);
	$fn 	  = $fn . $ext;
	$output1  = "tmpimage/x".$ext;
	
	if ($origfile!=""){
	ResizeImage($foto, 120, 95, 100, $output1);
	$foto_data1=addslashes(fread(fopen($output1,"r"),filesize($output1)));
	
	if ($foto_data1!="")
		$sqlfoto1=",foto='$foto_data1'";
	else
		$sqlfoto1="";
	}
	//Gambar Latar
		
	$foto	  =	$_FILES["latar"];
  	$uploadedfile = $foto['tmp_name'];
	$origfile = $foto['name'];
	$ext 	  = GetFileExt($origfile);
	$fn  	  = GetFileName($origfile);
	$fn  	  = str_replace(" ", "", $fn);
	$fn 	  = $fn . $ext;
	$output2  = "tmpimage/xx".$ext;
	list($width, $height) = getimagesize($uploadedfile);

	if ($origfile!=""){
	ResizeImage($foto, $width, $height, 60, $output2);
	$foto_data2=addslashes(fread(fopen($output2,"r"),filesize($output2)));
	
	if ($foto_data2!="")
		$sqlfoto2=",bg='$foto_data2'";
	else
		$sqlfoto2="";
	}

	OpenDb();
	$sql="SELECT * FROM jbsvcr.profil WHERE nip='".SI_USER_ID()."'";
	$result=QueryDb($sql);
	$ada=@mysql_num_rows($result);
	CloseDb();
	if ($ada>0){
		OpenDb();
		$sql="UPDATE jbsvcr.profil SET nip='".SI_USER_ID()."',nama='$_REQUEST[nama]',alamat='$_REQUEST[alamat]',".
			 " telpon='$_REQUEST[telpon]', hp='$_REQUEST[hp]', email='$_REQUEST[email]',hobi='$_REQUEST[hobi]',".
			 " buku='$_REQUEST[buku]', riwayat='$_REQUEST[riwayat]', tentang='$_REQUEST[tentang]' ".$sqlfoto1.$sqlfoto2."  WHERE replid=$_REQUEST[replid]";
		$result=QueryDb($sql);
		if ($result)
			reloadpage("profile.php");
	} else {
		OpenDb();
		$sql="INSERT INTO jbsvcr.profil SET nip='".SI_USER_ID()."',nama='$_REQUEST[nama]',alamat='$_REQUEST[alamat]',".
			 " telpon='$_REQUEST[telpon]', hp='$_REQUEST[hp]', email='$_REQUEST[email]',hobi='$_REQUEST[hobi]',".
			 " buku='$_REQUEST[buku]', riwayat='$_REQUEST[riwayat]', tentang='$_REQUEST[tentang]' ".$sqlfoto1.$sqlfoto2;
		$result=QueryDb($sql);	 
		CloseDb();
		if ($result)
			reloadpage("profile.php");
	}
}
function reloadpage($dest){
	?>
	<script language="javascript" type="text/javascript">
		document.location.href="<?=$dest?>";
	</script>
	<?
}
?>
<html>
<head>
<title>Profil Guru</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style5 {
	font-size: 10px;
	color: #0000FF;
	font-style: italic;
}
-->
</style>
<script src="../script/SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="../script/SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../script/resizing_background.js"></script>
<script language="javascript" type="text/javascript" src="../script/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
tinyMCE.init({
	mode : "exact",
	theme : "simple",
	elements : "hobi,buku,riwayat,tentang"
});

function chg_page(){
	var page=document.getElementById("page").value;
	document.location.href="profile.php?page="+page;
}
function change_page(page) {
	document.location.href="profile.php?page="+page;
}
</script>
</head>
<body style="background-attachment:fixed;"  background="../library/gambarlatar.php?replid=<?=$row[replid]?>&table=jbsvcr.profil"  onLoad="document.getElementById('nama').focus();rbInit();"  onResize="rbResize()" bgcolor="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<script>
// "true" means "keep the proportions of the original image."
// If you pass "false" the image fills the whole window,
// even if it must be distorted to do so. Experiment.
//rbOpen(true);
</script>
<form action="profile_edit.php" method="POST" enctype="multipart/form-data">
<input name="replid" id="replid" type="hidden" value="<?=$row[replid]?>" />
<!-- ImageReady Slices (back_login.psd) -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20" colspan="3" >&nbsp;</td>
  </tr>  
  <tr>
    <td height="20" colspan="4" >&nbsp;&nbsp;<input name="ubah" type="button" class="but" style="width:100px;" value="Lihat Profil" onClick="document.location.href='profile.php'">
    <!--&nbsp;<input name="tema" type="button" class="header" style="width:100px;" value="Tema Profil">&nbsp;<input name="ngobrol" type="button" class="header" style="width:100px;" value="Ajak Ngobrol">&nbsp;<input name="pesan" type="button" class="header" style="width:100px;" value="Kirim Pesan">--></td>
  </tr>
  <tr>
    <td width="19" height="20" style="background-image:url(../images_slice/bg_profil80_01.png); background-repeat:no-repeat; background-position:right;">&nbsp;</td>
    <td height="20" colspan="2" style="background-image:url(../images_slice/bg_profil80_02.png); background-repeat:repeat-x;"></td>
    <td width="19" height="20" style="background-image:url(../images_slice/bg_profil80_04.png); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
  <tr>
    <td width="19" style="background-image:url(../images_slice/bg_profil80_07.png); background-repeat:repeat-y; background-position:right;">&nbsp;</td>
    <td width="453" valign="top" style="background-image:url(../images_slice/bg_profil80_08.png); background-repeat:repeat;">
 <table border="0" cellspacing="2" >
  <tr>
    <th width="57" height="25" scope="row"><div align="left">Nama </div></th>
    <th width="2" scope="row">:</th>
    <td width="294" height="25"><div align="left">
    <input name="nama" id="nama" type="text" value="<?=$row[nama]?>" />
    </div></td>
  </tr>
  <tr>
    <th height="25" scope="row" valign="top"><div align="left">Alamat </div></th>
    <th width="2" height="25" scope="row" valign="top">:</th>
    <td height="25"><div align="left">
    <textarea name="alamat" id="alamat"><?=$row[alamat]?></textarea>
    </div></td>
  </tr>
  <tr>
    <th height="25" scope="row"><div align="left">Telepon </div></th>
    <th width="2" height="25" scope="row">:</th>
    <td height="25"><div align="left">
    <input name="telpon" id="telpon" type="text" value="<?=$row[telpon]?>" /></div></td>
  </tr>
  <tr>
    <th height="25" scope="row"><div align="left">HP </div></th>
    <th width="2" height="25" scope="row">:</th>
    <td height="25"><div align="left">
    <input name="hp" id="hp" type="text" value="<?=$row[hp]?>" /></div></td>
  	</tr>
  <tr>
    <th height="25" scope="row"><div align="left">Email </div></th>
    <th width="2" height="25" scope="row">:</th>
    <td height="25"><div align="left">
  
    <input name="email" id="email" type="text" value="<?=$row[email]?>" /></div></td>
  </tr>
   <tr>
    <th width="57" valign="top" scope="row"><div align="left">Hobby </div>      
      <div align="left"></div></th>
    <th width="2" valign="top" scope="row">:</th>
    <th width="294" align="left" valign="top" scope="row"><div align="left">
      <textarea name="hobi" id="hobi" ><?=$row[hobi]?></textarea>
     
    </div></th>
  </tr>
  <tr>
    <th valign="top" scope="row"><div align="left">Foto</div></th>
    <th width="2" valign="top" scope="row">:</th>
    <th align="left" valign="top" scope="row">
	<?	
		$title = "";
		if ($row[foto]!="") {
		$data = $row[foto];
		$size = 75;  // new image width
		$src = imagecreatefromstring($data); 
		$width = imagesx($src);
		$height = imagesy($src);
		$aspect_ratio = $height/$width;
		if ($width <= $size) {
			$new_w = $width;
			$new_h = $height;
		} else {
			$new_w = $size;
			$new_h = abs($new_w * $aspect_ratio);
		}
		?>
	<img id="gambar" src="../library/gambar.php?replid=<?=$row[replid]?>&table=jbsvcr.profil" width="<?=$new_w?>" height="<?=$new_h?>"  />
	<? } ?>
	<input name="foto" id="foto" type="file" size="20" title="Ganti Foto" /><br>
      <span class="style1 style5">(Isi untuk merubah gambar profil..)      </span></th>
    </tr>
  <tr>
    <th valign="top" scope="row"><div align="left">Latar<br>
      Belakang</div></th>
    <th valign="top" scope="row">:</th>
    <th align="left" valign="top" scope="row">
	<? if ($row[bg]!="") {
		$data = $row[bg];
		$size = 75;  // new image width
		$src = imagecreatefromstring($data); 
		$width = imagesx($src);
		$height = imagesy($src);
		$aspect_ratio = $height/$width;
		if ($width <= $size) {
			$new_w = $width;
			$new_h = $height;
		} else {
			$new_w = $size;
			$new_h = abs($new_w * $aspect_ratio);
		}
		?>
	<img id="gambarlatar" src="../library/gambarlatar.php?replid=<?=$row[replid]?>&table=jbsvcr.profil" width="<?=$new_w?>" height="<?=$new_h?>"  />
	<? }  ?><input name="latar" id="latar" type="file" size="20" title="Ganti Gambar Latar" /><br>
      <span class="style1 style5">(Isi untuk merubah gambar latar belakang ..)      </span></th>
  </tr>
  <tr>
    <th colspan="3" scope="row"></th>
    </tr>
</table>    </td>
    <td width="465" valign="top" style="background-image:url(../images_slice/bg_profil80_08.png); background-repeat:repeat;"><table border="0" cellspacing="2" >
 
  
  <tr>
    <th valign="top" scope="row"><div align="left">Buku&nbsp;Favorit</div></th>
    <th width="2" valign="top" scope="row">:</th>
    <th align="left" valign="top" scope="row"><div align="left">
      
      <textarea name="buku" id="buku" ><?=$row[buku]?></textarea>
     
    </div></th>
  </tr>
  
  <tr>
    <th valign="top" scope="row"><div align="left">Riwayat&nbsp;Hidup</div></th>
    <th width="2" valign="top" scope="row">:</th>
    <th align="left" valign="top" scope="row"><div align="left">
      
      		<textarea name="riwayat" id="riwayat" ><?=$row[riwayat]?></textarea>
      
    </div></th>
  </tr>
  <tr>
    <th valign="top" scope="row"><div align="left">Tentang&nbsp;Saya</div></th>
    <th width="2" valign="top" scope="row">:</th>
    <th align="left" valign="top" scope="row">
	<textarea name="tentang" id="tentang" ><?=$row[tentang]?></textarea></th>
  </tr>
  <tr>
    
  </tr>
  <tr>
    <th colspan="3" valign="top" scope="row">&nbsp;</th>
    </tr>
  <tr>
    <th colspan="3" scope="row"></th>
    </tr>
</table></td>
    <td width="19" style="background-image:url(../images_slice/bg_profil80_09.png); background-repeat:repeat-y;">&nbsp;</td>
  </tr>
  <tr>
    <td style="background-image:url(../images_slice/bg_profil80_07.png); background-repeat:repeat-y; background-position:right;">&nbsp;</td>
    <td colspan="2" valign="top" style="background-image:url(../images_slice/bg_profil80_08.png); background-repeat:repeat;"><div align="center">
  <input name="simpan" type="submit" class="but" id="simpan" value="Simpan">
  &nbsp;&nbsp;
      <input name="batal" type="button" class="but" id="batal" value="Batal" onClick="window.self.history.back();">
    </div></td>
    <td style="background-image:url(../images_slice/bg_profil80_09.png); background-repeat:repeat-y;">&nbsp;</td>
  </tr>
  <tr>
    <td width="19" height="23" style="background-image:url(../images_slice/bg_profil80_10.png); background-repeat:no-repeat; background-position:right;">&nbsp;</td>
    <td height="23" colspan="2" style="background-image:url(../images_slice/bg_profil80_11.png); background-repeat:repeat-x;">&nbsp;</td>
    <td width="19" height="23" style="background-image:url(../images_slice/bg_profil80_12.png); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
</table>
<!-- End ImageReady Slices -->
</form>
<script>
	//rbClose("../library/gambarlatar.php?replid=<?=$row[replid]?>&table=jbsvcr.profil");
</script>
</body>
</html>