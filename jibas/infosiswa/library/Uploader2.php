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
if (isset($_REQUEST[simpan])){
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
$updir = $UPLOAD_DIR."gambarpesan\\";
$dir_bln=date(m);
$dir_thn=date(Y);
$dir = $updir . $dir_thn . $dir_bln;
if (!is_dir($dir)) 
	mkdir($dir, 0777);
$newdir=$dir."\\";
$dir_db = str_replace($UPLOAD_DIR,$WEB_UPLOAD_DIR,$newdir);
$new_dir_db =  $dir_thn . $dir_bln ."/";
$nama=$_REQUEST['nama'];
$keterangan=$_REQUEST['keterangan'];
$idguru=SI_USER_ID();
	
	$foto=$_FILES["gambar"];
	$uploadedfile = $foto['tmp_name'];
	$uploadedtypefile = $foto['type'];
  	$uploadedsizefile = $foto['size'];
	if (strlen($uploadedfile)!=0){
  	if($uploadedtypefile=='image/jpeg')
    	$src = imagecreatefromjpeg($uploadedfile);
		//$filename = "x.jpg";
		$filename = $foto['name'];
	list($width,$height)=getimagesize($uploadedfile);
   	if ($width<$height){
	$newheight=320;
   	//$newwidth=($width/$height)*480;
   	$newwidth=240;
	} else if ($width>$height){
	$newwidth=320;
   	//$newheight=($height/$width)*640;
   	$newheight=240;
	}
	$tmp=imagecreatetruecolor($newwidth,$newheight);
  	imagecopyresampled($tmp,$src,0,0,0,0,$newwidth,$newheight,$width,$height);
  	imagejpeg($tmp,$filename,50);
	imagedestroy($src);
  	imagedestroy($tmp); // NOTE: menghapus file di temp
	$extf = $filename;
	$x=explode(".",$extf);
	$ext=".".$x[1];
	$fn=str_replace(" ","",$x[0]);
	$fn2=$idguru."-".$fn;
	//echo $newdir.$fn2.$ext;
	//exit;
	copy($filename,$newdir.$fn2.$ext);
	OpenDb();
	//echo "INSERT INTO jbsvcr.gambartinypesan SET nis='$idguru',idguru=NULL,direktori='".$dir_thn.$dir_bln."\',keterangan='$keterangan',namagambar='$nama',bulan=$dir_bln,tahun=$dir_thn";
	//exit;
	$res=Querydb("INSERT INTO jbsvcr.gambartinypesan SET nis='$idguru',idguru=NULL,direktori='".$new_dir_db."',namafile='".$fn2.$ext."',keterangan='$keterangan',namagambar='$nama',bulan=$dir_bln,tahun=$dir_thn");
	//$res2=Querydb("SELECT replid FROM jbsvcr.gambartinypesan ORDER BY replid DESC LIMIT 1");
	//$row2=@mysql_fetch_array($res2);
	//$lastid=$row2[replid];
	CloseDb();
	delete($filename);
	?>
	<script language="javascript">
		alert ('Berhasil upload gambar!');
		document.location.href="blank_uploader2.php";
    </script>
	<?
	}	


//##############################################################################################################################
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link rel="Stylesheet" href="../style/style.css" />
    <title>Untitled Page</title>
    <script language="javascript" src="../script/validasi.js"></script>
    <script language="javascript">
    function validate() {
        return validateEmptyText("gambar", "File Gambar") && 
               validateEmptyText("nama", "Nama Gambar");
    }
    </script>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" onsubmit="return validate()" method="post">
    <div>
    <table border="0" cellpadding="2" cellspacing="0" width="100%">
    <tr>
        <td align="left" width="10%">File Gambar:</td>
        <td><input name="gambar" id="gambar" type="file" size="60" /></td>
    </tr>
    <tr>
        <td align="left">Nama Gambar:</td>
        <td align="left"><textarea id="nama" name="nama" Columns="30" ></textarea></td>
    </tr>
    <tr>
        <td align="left">Keterangan:</td>
        <td align="left"><textarea id="keterangan" name="keterangan" columns="50" Rows="2" TextMode="MultiLine"></textarea></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td align="left">
            <input type="submit" class="but" name="simpan" id="simpan" value="Upload" />
        </td>
    </tr>
    </table>
    
    </div>
    </form>
</body>
</html>