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
require_once('../include/fileinfo.php');
require_once('../include/imageresizer.php');
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
		$nama 		= $_REQUEST['nama'];
		$keterangan = $_REQUEST['keterangan'];
		$pengguna 	= SI_USER_ID();
		$bln = date('m');
		$thn = date('Y');
			
		// Check and create directory if it doesnt exists
		$updir = $UPLOAD_DIR . "gambarpesan\\" . $thn . $bln . "\\";
		if (!is_dir($updir)) 
			mkdir($updir, 0777);
		
		// create filename 
		$foto 	  = $_FILES["gambar"];
		$origfile = $foto['name'];
		$ext 	  = GetFileExt($origfile);
		$fn  	  = GetFileName($origfile);
		$fn  	  = str_replace(" ", "", $fn);
		$fn 	  = date('ymdHis') . "-" . $fn . $ext;
		
		/*
		switch($resize)
		{
			case 1:
				$w = 640; $h = 480; break;
			case 2:
				$w = 320; $h = 240; break;
			case 3:
				$w = 160; $h = 120; break;
			case 4:
				$w = 106; $h = 80; break;
			case 5:
				$w = 80; $h = 60;
		}*/
		$w = 320;
		$h = 240;
		// resize original image		
		$output   	= $updir . $fn;
		//echo $output; exit;
		ResizeImage($foto, $w, $h, 70, $output);
		//echo $output; exit;
		$relpath 	= $thn . $bln . "/";
		OpenDb();
		//$sql_client="SELECT * FROM jbsclient.localinfo ORDER BY region,location,clientid";
		//$result_client=QueryDb($sql_client);
		//$row_client=@mysql_fetch_array($result_client);
		$sql="INSERT INTO jbsvcr.gambartiny SET idguru='$pengguna', namagambar='$fn',bulan='$bln',tahun='$thn',keterangan='$keterangan' $gantifoto";
		//echo $sql;
		$result=QueryDb($sql);
		CloseDb();
	//copy($filename,$newdir.$fn2.$ext);
	//OpenDb();
	//echo "INSERT INTO jbsvcr.gambartinypesan SET nis=NULL,idguru='$idguru',direktori='".$dir_thn.$dir_bln."\',keterangan='$keterangan',namagambar='$nama',bulan=$dir_bln,tahun=$dir_thn";
	//exit;
	//$res=Querydb("INSERT INTO jbsvcr.gambartinypesan SET nis=NULL,idguru='$idguru',direktori='".$new_dir_db."',namafile='".$fn2.$ext."',keterangan='$keterangan',namagambar='$nama',bulan=$dir_bln,tahun=$dir_thn");
	//$res2=Querydb("SELECT replid FROM jbsvcr.gambartinypesan ORDER BY replid DESC LIMIT 1");
	//$row2=@mysql_fetch_array($res2);
	//$lastid=$row2[replid];
	//CloseDb();
	//delete($filename);
	?>
	<script language="javascript">
		alert ('Berhasil upload gambar!');
		document.location.href="blank_uploader2.php";
    </script>
	<?
	//}	


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
    <form id="form1" runat="server" enctype="multipart/form-data" onSubmit="return validate()" method="post">
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