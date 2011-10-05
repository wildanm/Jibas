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


//echo $repd1."-".$repd2."-".$repd3;
//exit;

//Ambil dari pesannya
$replid=$_REQUEST['replid'];
$bulan=$_REQUEST['tahun'];
$tahun=$_REQUEST['tahun'];
$updir = "../../upload/pesanguru/";
$dir_bln=date(m);
$dir_thn=date(Y);
$dir = $updir . $dir_thn . $dir_bln;
if (!is_dir($dir)) 
	mkdir($dir, 0777);
$newdir=$dir."/";
$judul=$_REQUEST['judul'];
$tgl=explode("-",$_REQUEST['tanggal']);
$tanggaltampil=$tgl[2]."-".$tgl[1]."-".$tgl[0];
$tanggalpesan=date(Y)."-".date(m)."-".date(j);
$pesan=$_REQUEST['pesan'];
$idguru=SI_USER_ID();

//Input dulu di tabel pesanguru
OpenDb();
$sql="UPDATE jbsvcr.pesanguru SET tanggalpesan='$tanggalpesan', tanggaltampil='$tanggaltampil',judul='$judul',pesan='$pesan',idguru='$idguru' WHERE replid='$replid'";
$result=QueryDb($sql);
CloseDb();

//Ambil last id
$lastid=$replid;

//Hapus dari tabel tujuan
OpenDb();

$sql="DELETE FROM jbsvcr.tujuanpesanguru WHERE idpesan='$lastid'";
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
	
	$sql="INSERT INTO jbsvcr.tujuanpesanguru SET idpesan='$lastid', idguru='".$receiver[$x]."',baru='1'";
	$result=QueryDb($sql);
	CloseDb();
	}
$x++;
}

$d1=$_REQUEST['d1'];
$d2=$_REQUEST['d2'];
$d3=$_REQUEST['d3'];

//Cek bisi ada file yang di hapus
for ($z=1;$z<=3;$z++){
	$d=$_REQUEST['d'.$z];
	$rep=$_REQUEST['repd'.$z];
	echo $rep;
	if ($d!="0" && $rep!=""){
					//Buat hapus file
	OpenDb();
	$sql="SELECT direktori as direktori,namafile FROM jbsvcr.lampiranpesanguru WHERE replid='$rep'";
	//echo $sql;
	//exit;
	$result=QueryDb($sql);
	$row=@mysql_fetch_array($result);
					//Hapus filenyah..............
		delete($row[direktori].$row[namafile]);
	CloseDb();
					//Buat hapus field
	OpenDb();
	$sql="DELETE FROM jbsvcr.lampiranpesanguru WHERE replid='$rep'";
	$result=QueryDb($sql);
	CloseDb();
	}
}
//exit;
$repd1=$_REQUEST['repd1'];
$repd2=$_REQUEST['repd2'];
$repd3=$_REQUEST['repd3'];
//Sekarang lampiran-lampirannya....
$file1 = trim($_FILES["file1"]["tmp_name"]);
$file2 = trim($_FILES["file2"]["tmp_name"]);
$file3 = trim($_FILES["file3"]["tmp_name"]);
if ($file1!=""){
	if ($repd1!=""){
	OpenDb();
	$sql="SELECT direktori,namafile FROM jbsvcr.lampiranpesanguru WHERE replid='$repd1'";
	$result=QueryDb($sql);
	$row=@mysql_fetch_array($result);
		//Hapus filenyah..............
		delete($row[direktori].$row[namafile]);
	CloseDb();
	//Buat hapus field
	OpenDb();
	$sql="DELETE FROM jbsvcr.lampiranpesanguru WHERE replid='$repd1'";
	$result=QueryDb($sql);
	CloseDb();
	}
	$extf1 = $_FILES["file1"]["name"];
	$x1=explode(".",$extf1);
	$ext1=".".$x1[1];
	$namafile1=str_replace(" ","",$x1[0]);
		move_uploaded_file($file1, $newdir.$namafile1."-".$lastid.$ext1);
		OpenDb();
		$sql="INSERT INTO jbsvcr.lampiranpesanguru SET idpesan='$lastid', namafile='".$namafile1."-".$lastid.$ext1."', direktori='".$newdir."'";
		$result=QueryDb($sql);
		CloseDb();
}

if ($file2!=""){
	if ($repd2!=""){
	OpenDb();
	$sql="SELECT direktori,namafile FROM jbsvcr.lampiranpesanguru WHERE replid='$repd2'";
	$result=QueryDb($sql);
	$row=@mysql_fetch_array($result);
		//Hapus filenyah..............
		delete($row[direktori].$row[namafile]);
	CloseDb();
	//Buat hapus field
	OpenDb();
	$sql="DELETE FROM jbsvcr.lampiranpesanguru WHERE replid='$repd2'";
	$result=QueryDb($sql);
	CloseDb();
	}
	$extf2 = $_FILES["file2"]["name"];
	$x2=explode(".",$extf2);
	$ext2=".".$x2[1];
	$namafile2=str_replace(" ","",$x2[0]);
		move_uploaded_file($file2, $newdir.$namafile2."-".$lastid.$ext2);
		OpenDb();
		$sql="INSERT INTO jbsvcr.lampiranpesanguru SET idpesan='$lastid', namafile='".$namafile2."-".$lastid.$ext2."', direktori='".$newdir."'";
		$result=QueryDb($sql);
		CloseDb();
}

if ($file3!=""){
	if ($repd3!=""){
	OpenDb();
	$sql="SELECT direktori,namafile FROM jbsvcr.lampiranpesanguru WHERE replid='$repd3'";
	$result=QueryDb($sql);
	$row=@mysql_fetch_array($result);
		//Hapus filenyah..............
		delete($row[direktori].$row[namafile]);
	CloseDb();
	//Buat hapus field
	OpenDb();
	$sql="DELETE FROM jbsvcr.lampiranpesanguru WHERE replid='$repd3'";
	$result=QueryDb($sql);
	CloseDb();
	}
	$extf3 = $_FILES["file3"]["name"];
	$x3=explode(".",$extf3);
	$ext3=".".$x3[1];
	$namafile3=str_replace(" ","",$x3[0]);
		move_uploaded_file($file3, $newdir.$namafile3."-".$lastid.$ext3);
		OpenDb();
		$sql="INSERT INTO jbsvcr.lampiranpesanguru SET idpesan='$lastid', namafile='".$namafile3."-".$lastid.$ext3."', direktori='".$newdir."'";
		$result=QueryDb($sql);
		CloseDb();
}
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
?>
<script language="javascript">
parent.pesanguru_ubah_tujuan.batal();
</script>