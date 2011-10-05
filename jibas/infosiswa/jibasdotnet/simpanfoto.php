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
require_once('../include/getheader.php');
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
$source = $_REQUEST["source"];
for ($i=1;$i<=3;$i++){
	$keterangan = $_REQUEST["keterangan".$i];
	$foto=$_FILES["file".$i];
  	
	$uploadedfile = $foto['tmp_name'];
	$uploadedtypefile = $foto['type'];
  	$uploadedsizefile = $foto['size'];
	if (strlen($uploadedfile)!=0){
  	if($uploadedtypefile=='image/jpeg')
    	$src = imagecreatefromjpeg($uploadedfile);
		//$filename = "tmpimage/x.jpg";
		$filename = "tmpimage/".$foto['name'];
	list($width,$height)=getimagesize($uploadedfile);
   	if ($width<$height){
	$newheight=640;
   	//$newwidth=($width/$height)*480;
   	$newwidth=480;
	} else if ($width>$height){
	$newwidth=640;
   	//$newheight=($height/$width)*640;
   	$newheight=480;
	}
	$tmp=imagecreatetruecolor($newwidth,$newheight);
  	imagecopyresampled($tmp,$src,0,0,0,0,$newwidth,$newheight,$width,$height);
  	imagejpeg($tmp,$filename,50);
	imagedestroy($src);
  	imagedestroy($tmp); // NOTE: menghapus file di temp
	$foto_data=addslashes(fread(fopen($filename,"r"),filesize($filename)));
	OpenDb();
	$sql_client="SELECT * FROM jbsclient.localinfo ORDER BY region,location,clientid";
	$result_client=QueryDb($sql_client);
	$row_client=@mysql_fetch_array($result_client);
	
	$sql="INSERT INTO jbsvcr.galerifoto SET region='$row_client[region]',location='$row_client[location]',clientid='$row_client[clientid]',idguru='".SI_USER_ID()."',keterangan='$keterangan',foto='$foto_data'";
	$result=QueryDb($sql);
	if (!$result){
	?>
	<script language="javascript">
		alert ('Gagal menyimpan Gambar <?=$foto[name]?>');
		opener.ubah_profil();
		window.close()
	</script>
	<?
	}
	CloseDb();
	//delete($filename);
	}

}
?>
<script language="javascript">
	opener.ubah_profil();
	window.close()
</script>