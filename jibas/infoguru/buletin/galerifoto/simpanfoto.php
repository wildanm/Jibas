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
require_once('../../include/common.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/config.php');
require_once('../../include/db_functions.php');
require_once('../../include/imageresizer.php');
require_once('../../include/fileinfo.php');
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
	$nama = $_REQUEST["nama".$i];
	$keterangan = $_REQUEST["keterangan".$i];
	$foto	  =	$_FILES["file".$i];
  	
	$origfile = $foto['name'];
	$ext 	  = GetFileExt($origfile);
	$fn  	  = GetFileName($origfile);
	$fn  	  = str_replace(" ", "", $fn);
	$fn 	  = date('ymdHis') . "-" . $fn . $ext;
	$output1  = "photos/".$fn;
	$output2  = "thumbnail/".$fn;	
	if (!is_dir("photos/")){
		mkdir("photos");
		chmod(0777,"photos");
	}
	if (!is_dir("thumbnail/")){
		mkdir("thumbnail");
		chmod(0777,"thumbnail");
	}

	if ($origfile!=""){
	ResizeImage($foto, 500, 300, 70, $output1);
	//echo "Masuk 1 ";
	$foto_data1=addslashes(fread(fopen($output1,"r"),filesize($output1)));
	
	if ($foto_data1!="")
		$sqlfoto1=",filename='$fn'";
	else
		$sqlfoto1="";

	ResizeImage($foto, 125, 75, 70, $output2);
	//echo "Masuk 2";	
	OpenDb();
	$sql="INSERT INTO jbsvcr.galerifoto SET idguru='".SI_USER_ID()."',nama='$nama',keterangan='$keterangan' $sqlfoto1";
	//echo $sql;
	$result=QueryDb($sql);
	$result2=QueryDb("SELECT replid FROM jbsvcr.galerifoto ORDER BY replid DESC LIMIT 1");
	$row2=@mysql_fetch_array($result2);
	//if ($foto_data2!="")
	//	QueryDb("UPDATE jbsvcr.galerifoto SET $sqlfoto2 WHERE replid=$row2[replid]");
	
	
	if (!$result){
	?>
	<script language="javascript">
		alert ('Gagal menyimpan Gambar <?=$foto[name]?>');
		opener.ubah_profil();
		window.close()
	</script>
	<?
			}
	}
	CloseDb();
	//delete($filename);
	

}
?>
<script language="javascript">
	opener.get_fresh();
	window.close()
</script>