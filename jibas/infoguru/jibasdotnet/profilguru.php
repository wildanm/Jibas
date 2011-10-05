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
require_once('../include/common.php');
require_once('../include/sessioninfo.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
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
$op="";
if (isset($_REQUEST[op]))
	$op=$_REQUEST[op];
if (isset($_REQUEST[op2]))
	$op2=$_REQUEST[op2];
if ($op2=="fh873jh62ft6dsg7h7whgufdte3"){
OpenDb();
$sql="DELETE FROM jbsvcr.galerifoto WHERE replid=".$_REQUEST[replid];
$result=QueryDb($sql);
CloseDb();
if ($op=="ubah"){
?>
<script language="javascript">
	document.location.href="profilguru.php?op=ubah";
</script>
<?
} else {
?>
<script language="javascript">
	document.location.href="profilguru.php";
</script>
<?
}
}
OpenDb();
$sql="SELECT * FROM jbsvcr.profil WHERE nip=".SI_USER_ID();
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);
$nama=$row[nama];
$alamat=$row[alamat];
$telpon=$row[telpon];
$hp=$row[hp];
$email=$row[email];
$hobi=$row[hobi];
$buku=$row[buku];
$riwayat=$row[riwayat];
$tentang=$row[tentang];
$replid=$row[replid];
$sql2="SELECT replid FROM jbsvcr.galerifoto WHERE idguru=".SI_USER_ID();
$result2=QueryDb($sql2);
$jatahfoto=20-@mysql_num_rows($result2);

CloseDb();	
if (isset($_REQUEST[simpan])){
	$foto=$_FILES["file"];
	$uploadedfile = $foto['tmp_name'];
	$uploadedtypefile = $foto['type'];
	$uploadedsizefile = $foto['size'];
	if (strlen($uploadedfile)!=0){
		$gantifoto=", foto='$foto_data'";
  	if($uploadedtypefile=='image/jpeg')
    $src = imagecreatefromjpeg($uploadedfile);
	$filename = "tmpimage/x.jpg";
	list($width,$height)=getimagesize($uploadedfile);
   	$newheight=176;
   	$newwidth=($width/$height)*176;
   	$tmp=imagecreatetruecolor($newwidth,$newheight);
   	imagecopyresampled($tmp,$src,0,0,0,0,$newwidth,$newheight,$width,$height);
  	imagejpeg($tmp,$filename,100);
	imagedestroy($src);
  	imagedestroy($tmp); // NOTE: menghapus file di temp
	$foto_data=addslashes(fread(fopen($filename,"r"),filesize($filename)));
	}
if ($foto_data!=""){
$gantifoto=", foto='$foto_data'";
} else {
$gantifoto="";
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
	 " buku='$_REQUEST[buku]', riwayat='$_REQUEST[riwayat]', tentang='$_REQUEST[tentang]' $gantifoto WHERE nip='".SI_USER_ID()."'";
$result=QueryDb($sql);	 
if ($result){
?>
<script language="javascript">
	document.location.href="profilguru.php";
</script>
<?
}
CloseDb();
} else {
OpenDb();
$sql_client="SELECT * FROM jbsclient.localinfo ORDER BY region,location,clientid";
	$result_client=QueryDb($sql_client);
	$row_client=@mysql_fetch_array($result_client);
	
$sql="INSERT INTO jbsvcr.profil SET region='$row_client[region]',location='$row_client[location]',clientid='$row_client[clientid]',nip='".SI_USER_ID()."',nama='$_REQUEST[nama]',alamat='$_REQUEST[alamat]',".
	 " telpon='$_REQUEST[telpon]', hp='$_REQUEST[hp]', email='$_REQUEST[email]',hobi='$_REQUEST[hobi]',".
	 " buku='$_REQUEST[buku]', riwayat='$_REQUEST[riwayat]', tentang='$_REQUEST[tentang]' $gantifoto";
$result=QueryDb($sql);	 
CloseDb();
}
delete($filename);
OpenDb();
$sql="SELECT replid FROM jbsvcr.galerifoto WHERE idguru=".SI_USER_ID();
$result=QueryDb($sql);

while ($row=@mysql_fetch_array($result)){
	$ket=$_REQUEST["ket".$row[replid]];
	$sql2="UPDATE jbsvcr.galerifoto SET keterangan='$ket' WHERE replid=$row[replid]";
	$result2=QueryDb($sql2);
}
CloseDb();
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="../style/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../script/tools.js"></script>
<script language="javascript" type="text/javascript" src="../script/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
tinyMCE.init({
		mode : "textareas",
		theme : "simple",
		skin : "o2k7",
		skin_variant : "silver",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",		
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect,forecolor,backcolor,fullscreen,print",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,image",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : false,
		content_css : "style/content.css"
	});
function ubah_profil(){
	document.location.href="profilguru.php?op=ubah";
}
function get_fresh(){
	var x=document.getElementById('op').value;
	if (op=="ubah"){
	document.location.href="profilguru.php?op=ubah";
	} else {
		document.location.href="profilguru.php";
	}
}
function tambah_foto() {
	newWindow('tambahfoto.php?source=profil', 'Tambah','558','163','resizable=1,scrollbars=1,status=0,toolbar=0')
}
function hapus_foto(replid) {
	var x=document.getElementById('op').value;
	if (x=="ubah"){
		if (confirm('Anda yakin akan menghapus gambar ini ?'))
		document.location.href="profilguru.php?op=ubah&op2=fh873jh62ft6dsg7h7whgufdte3&replid="+replid;
	} else {
		if (confirm('Anda yakin akan menghapus gambar ini ?'))
		document.location.href="profilguru.php?op2=fh873jh62ft6dsg7h7whgufdte3&replid="+replid;
	}
	
}
function tampil(replid){
	newWindow('../library/gambar.php?replid='+replid+'&table=jbsvcr.galerifoto','LihatFoto','663','316','resizable=1,scrollbars=0,status=0,toolbar=0');
}
</script>
<style type="text/css">
<!--
.style1 {
	color: #0066CC;
	font-style: italic;
}
.style3 {font-size: 10px}
-->
</style>
</head>
<body>
<form action="profilguru.php" method="post" enctype="multipart/form-data">
<? if ($op=="ubah"){ ?>
<input class="but" type="submit" name="simpan" id="simpan" value="Simpan"  style="visibility:visible;width:80px;" />
<? } else { ?>
<input class="but" type="button" name="ubah" id="ubah" value="Ubah" onClick="ubah_profil()" style="visibility:visible;width:80px;" title="Klik disini untuk merubah profil guru dan galeri foto !" />
<? } ?>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <th width="31%" align="left" scope="row" valign="top">
    <table width="489%" border="0" cellspacing="2" >
  <tr>
    <th width="31%" height="25" scope="row"><div align="left">Nama </div></th>
    <th width="9%" scope="row">:</th>
    <td width="60%" height="25"><div align="left">
    <? if ($op=="ubah"){ ?><input name="nama" id="nama" type="text" value="<?=$nama?>" />
    <? } else { 
    echo $nama;
	} ?>
    </div></td>
  </tr>
  <tr>
    <th height="25" scope="row"><div align="left">Alamat </div></th>
    <th height="25" scope="row">:</th>
    <td height="25"><div align="left">
    <? if ($op=="ubah"){ ?>
    <input name="alamat" id="alamat" type="text" value="<?=$alamat?>" />
    <? } else { 
    echo $alamat;
	} ?>
    </div></td>
  </tr>
  <tr>
    <th height="25" scope="row"><div align="left">Telepon </div></th>
    <th height="25" scope="row">:</th>
    <td height="25"><div align="left">
    <? if ($op=="ubah"){ ?>
    <input name="telpon" id="telpon" type="text" value="<?=$telpon?>" /></div></td>
  	<? } else { 
    echo $telpon;
	} ?>
  </tr>
  <tr>
    <th height="25" scope="row"><div align="left">HP </div></th>
    <th height="25" scope="row">:</th>
    <td height="25"><div align="left">
    <? if ($op=="ubah"){ ?>
    <input name="hp" id="hp" type="text" value="<?=$hp?>" /></div></td>
  	<? } else { 
    echo $hp;
	} ?>
  </tr>
  <tr>
    <th height="25" scope="row"><div align="left">Email </div></th>
    <th height="25" scope="row">:</th>
    <td height="25"><div align="left">
    <? if ($op=="ubah"){ ?>
    <input name="email" id="email" type="text" value="<?=$email?>" /></div></td>
  	 <? } else { 
    echo $email;
	} ?>
  </tr>
  <tr>
    <th valign="top" scope="row"><div align="left">Hobby </div>      
      <div align="left"></div></th>
    <th valign="top" scope="row">:</th>
    <th align="left" valign="top" scope="row"><div align="left"><? if ($op=="ubah"){ ?>
      <textarea name="hobi" ><?=$hobi?></textarea>
      <? } else { 
    echo $hobi;
	} ?>
    </div></th>
  </tr>
  
  <tr>
    <th valign="top" scope="row"><div align="left">Buku Favorit </div></th>
    <th valign="top" scope="row">:</th>
    <th align="left" valign="top" scope="row"><div align="left">
      <? if ($op=="ubah"){ ?>
      <textarea name="buku" ><?=$buku?></textarea>
      <? } else { 
    echo $buku;
	} ?>
    </div></th>
  </tr>
  
  <tr>
    <th valign="top" scope="row"><div align="left">Riwayat Hidup </div></th>
    <th valign="top" scope="row">:</th>
    <th align="left" valign="top" scope="row"><div align="left">
      	<? if ($op=="ubah"){ ?>
      		<textarea name="riwayat" ><?=$riwayat?></textarea>
      	<? } else { 
    		echo $riwayat;
		} ?>
    </div></th>
  </tr>
  <tr>
    <th colspan="3" scope="row"></th>
    </tr>
</table>

    </th>
    <td width="69%" align="left" valign="top"><div align="center"><font face='Arial' style='font-size: 16pt' color='#800000'>Tentang 
      <?=$nama?>
      </font></div><br />
      
      <img src="../library/gambar.php?replid=<?=$replid?>&table=jbsvcr.profil" <? if ($op!="ubah"){ ?>align="left" <? } ?>/>
      <? if ($op=="ubah"){ ?>
      <br />
      <strong>Gambar : </strong><br>
      <input name="file" id="file" type="file" size="20" title="Ganti Gambar" /><br>
      <span class="style1">(Isi untuk mengganti gambar utama..)      </span><br />
      <br /><br /><br />
      <strong>Tentang : </strong><br />
      <textarea name="tentang" style="width:200px; height:100px;" id="tentang"  ><?=$tentang?>
      </textarea>
      <? } else {
    echo "".$tentang.""; 
	}
	?>
      
    </td>
  </tr>
  <tr>
    <th colspan="2" scope="row" align="justify">
    
	<? 
	$total=@mysql_num_rows($result2);
	if ($op=="ubah" && $total<20){ ?>
    <a href="#" title="Tambah gambar koleksi" onClick="tambah_foto()"><img src="../images/ico/tambah.png" border="0" />Tambah Koleksi Gambar</a><br /><br />
	<? } ?>	
	
    Galeri Foto :<br /><br />
    
	<table width="100%" border="0" cellspacing="0" align="center">
	<? 
	
	for ($i=0;$i<=$total;$i++) { 
	$xx=(int)$i*4;
//$kali=5;
//if ($i==0){
//$xx=$x;
//} else {
//$xx=$x+$kali;
//}
?>
  <tr>
	<?	OpenDb();
		$sql_blob="SELECT replid,foto,keterangan FROM jbsvcr.galerifoto WHERE idguru='".SI_USER_ID()."' LIMIT ".$xx.",4";
		//echo $sql_blob;
		$result_blob=QueryDb($sql_blob);
		CloseDb();
		while ($row_blob=@mysql_fetch_array($result_blob)){ ?>
			<th scope="row" width="20%" align="center"><img style="cursor:pointer;" title="Klik untuk menampilkan dalam ukuran sebenarnya !" src="../library/gambar.php?replid=<?=$row_blob['replid']?>&table=jbsvcr.galerifoto" width="132" onClick="tampil('<?=$row_blob['replid']?>')" /><br>
			<? if ($op=="ubah"){ ?>
            <img src="../images/ico/hapus.png" style="cursor:pointer;" onclick="hapus_foto('<?=$row_blob['replid']?>')"/><br />
            <span class="style3">Ket : </span>
            <input title="Keterangan Gambar" type="text" name="ket<?=$row_blob['replid']?>" id="ket<?=$row_blob['replid']?>" value="<?=$row_blob['keterangan']?>">
			<? } else { 
			if ($row_blob['keterangan']!=""){
			?><?=$row_blob['keterangan']?><?
			} else {
			echo "&nbsp;";
			}
			?>
			<? } ?>
			</th>
	<?  } ?>
 </tr>
<? } ?>
</table>	
    
    
</th>
  </tr>
</table>
<input name="op" id="op" type="hidden" size="20" value="<?=$op?>" />
</form>
</body>
</html>