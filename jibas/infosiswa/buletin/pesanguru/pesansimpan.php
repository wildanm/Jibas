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
require_once('../../include/common.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/config.php');
require_once('../../include/getheader.php');
require_once('../../include/db_functions.php');
require_once('../../sessionchecker.php');
//Ambil dari pesannya
$bulan=$_REQUEST['tahun'];
$tahun=$_REQUEST['tahun'];
$updir = $UPLOAD_DIR."pesan\\";
$dir_bln=date(m);
$dir_thn=date(Y);
$dir = $updir . $dir_thn . $dir_bln;
if (!is_dir($dir)) 
	mkdir($dir, 0777);
$newdir=$dir."\\";
$dir_db = $dir_thn . $dir_bln . "/" ; 
//$new_dir_db = str_replace("\\","/",$dir_db);
$judul=$_REQUEST['judul'];
$tgl=explode("-",$_REQUEST['tanggal']);
$tanggaltampil=$tgl[2]."-".$tgl[1]."-".$tgl[0];
//$tanggalpesan=date(Y)."-".date(m)."-".date(j);
$pesan=$_REQUEST['pesan'];
$idguru=SI_USER_ID();
OpenDb();
$sql_date="SELECT now()";
$result_date=QueryDb($sql_date);
$row_date=@mysql_fetch_row($result_date);
$tanggalpesan=substr($row_date[0],0,10);
$jampesan=substr($row_date[0],11,8);
CloseDb();
//Input dulu di tabel pesanguru
OpenDb();
$sql="INSERT INTO jbsvcr.pesan SET tanggalpesan='".$tanggalpesan." ".$jampesan."', tanggaltampil='$tanggaltampil',judul='$judul',pesan='$pesan',idguru=NULL,nis='$idguru',keguru=1";
$result=QueryDb($sql);
CloseDb();



//Ambil last id
OpenDb();
$sql="SELECT replid FROM jbsvcr.pesan ORDER BY replid DESC LIMIT 1";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);
$lastid=$row['replid'];
CloseDb();

OpenDb();
$sql="INSERT INTO jbsvcr.pesanterkirim SET judul='$judul',idpesan=$lastid";//,listpenerima='".$_REQUEST['receiver']."'";
$result=QueryDb($sql);
CloseDb();

//Ambil penerimanya
$jum=(int)$_REQUEST['jum']-1;
$receiverall=$_REQUEST['receiver'];
$x=0;
$receiver=explode("|",$receiverall);
while ($x<=$jum){
	if ($receiver[$x]!=""){
	
	//Masukin ke tabel tujuan pesan guru
	OpenDb();
	$sql="INSERT INTO jbsvcr.tujuanpesan SET idpesan='$lastid', idpenerima='".$receiver[$x]."',baru='1'";
	$result=QueryDb($sql);
	CloseDb();
	}
$x++;
}

//Sekarang lampiran-lampirannya....
$file1 = trim($_FILES["file1"]["tmp_name"]);
$file2 = trim($_FILES["file2"]["tmp_name"]);
$file3 = trim($_FILES["file3"]["tmp_name"]);
if ($file1!=""){
	$extf1 = $_FILES["file1"]["name"];
	$x1=explode(".",$extf1);
	$ext1=".".$x1[1];
	$namafile1=str_replace(" ","",$x1[0]);
		move_uploaded_file($file1, $newdir.$namafile1."-".$lastid.$ext1);
		OpenDb();
		$sql="INSERT INTO jbsvcr.lampiranpesan SET idpesan='$lastid', namafile='".$namafile1."-".$lastid.$ext1."', direktori='".$dir_db."'";
		$result=QueryDb($sql);
		CloseDb();
}

if ($file2!=""){
	$extf2 = $_FILES["file2"]["name"];
	$x2=explode(".",$extf2);
	$ext2=".".$x2[1];
	$namafile2=str_replace(" ","",$x2[0]);
		move_uploaded_file($file2, $newdir.$namafile2."-".$lastid.$ext2);
		OpenDb();
		$sql="INSERT INTO jbsvcr.lampiranpesan SET idpesan='$lastid', namafile='".$namafile2."-".$lastid.$ext2."', direktori='".$dir_db."'";
		$result=QueryDb($sql);
		CloseDb();
}

if ($file3!=""){
	$extf3 = $_FILES["file3"]["name"];
	$x3=explode(".",$extf3);
	$ext3=".".$x3[1];
	$namafile3=str_replace(" ","",$x3[0]);
		move_uploaded_file($file3, $newdir.$namafile3."-".$lastid.$ext3);
		OpenDb();
		$sql="INSERT INTO jbsvcr.lampiranpesan SET idpesan='$lastid', namafile='".$namafile3."-".$lastid.$ext3."', direktori='".$dir_db."'";
		$result=QueryDb($sql);
		CloseDb();
}
?>
<script language="javascript">
alert ('Pesan Anda telah dikirim ...');
//parent.go('pesanguru_footer');
parent.tujuan_header.batal();
//parent.location.href="pesanguru_footer.php";
</script>