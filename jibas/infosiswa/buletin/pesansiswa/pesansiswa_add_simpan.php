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
$sender=$_REQUEST['sender'];
if ($sender=="tambah"){
$updir = "../../upload/lampiranbg/";
OpenDb();
$dir_bln=date(m);
$dir_thn=date(Y);
$dir = $updir . $dir_thn . $dir_bln;
if (!is_dir($dir)) 
	mkdir($dir, 0777);
$newdir=$dir."/";
$judul=$_REQUEST['judul'];
$tgl=explode("-",$_REQUEST['tanggal']);
$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
$abstrak=$_REQUEST['abstrak'];
$isi=$_REQUEST['isi'];
$idguru=SI_USER_ID();
$sql1="INSERT INTO jbsvcr.beritaguru SET judul='$judul', tanggal='$tanggal', abstrak='$abstrak', isi='$isi', idguru='$idguru'";
$result1=QueryDb($sql1);

$sql2="SELECT replid FROM jbsvcr.beritaguru ORDER BY replid DESC LIMIT 1";
$result2=QueryDb($sql2);
$row2=@mysql_fetch_array($result2);
$lastid=$row2['replid'];

$file1 = trim($_FILES["file1"]["tmp_name"]);
$file2 = trim($_FILES["file2"]["tmp_name"]);
$file3 = trim($_FILES["file3"]["tmp_name"]);

if ($file1!=""){
	$extf1 = $_FILES["file1"]["name"];
	$x1=explode(".",$extf1);
	$ext1=".".$x1[1];
	$namafile1=str_replace(" ","",$x1[0]);
		move_uploaded_file($file1, $newdir.$namafile1."-".$lastid.$ext1);
		$sql3="INSERT INTO jbsvcr.lampiranberitaguru SET idberita='$lastid', namafile='".$namafile1."-".$lastid.$ext1."', direktori='".$newdir."'";
		$result3=QueryDb($sql3);
}

if ($file2!=""){
	$extf2 = $_FILES["file2"]["name"];
	$x2=explode(".",$extf2);
	$ext2=".".$x2[1];
	$namafile2=str_replace(" ","",$x2[0]);
		move_uploaded_file($file2, $newdir.$namafile2."-".$lastid.$ext2);
		$sql4="INSERT INTO jbsvcr.lampiranberitaguru SET idberita='$lastid', namafile='".$namafile2."-".$lastid.$ext2."', direktori='".$newdir."'";
		$result4=QueryDb($sql4);
}

if ($file3!=""){
	$extf3 = $_FILES["file3"]["name"];
	$x3=explode(".",$extf3);
	$ext3=".".$x3[1];
	$namafile3=str_replace(" ","",$x3[0]);
		move_uploaded_file($file3, $newdir.$namafile3."-".$lastid.$ext3);
		$sql5="INSERT INTO jbsvcr.lampiranberitaguru SET idberita='$lastid', namafile='".$namafile3."-".$lastid.$ext3."', direktori='".$newdir."'";
		$result5=QueryDb($sql5);
}
} elseif ($sender=="ubah"){
	OpenDb();
	//KAlo dari ubah berita guru================================================================================================================================
	$judul=$_REQUEST['judul'];
	$d1=$_REQUEST['d1'];
	$d2=$_REQUEST['d2'];
	$d3=$_REQUEST['d3'];
	$tgl=explode("-",$_REQUEST['tanggal']);
	$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
	$abstrak=$_REQUEST['abstrak'];
	$isi=$_REQUEST['isi'];
	$idguru=SI_USER_ID();
	$file1 = trim($_FILES["file1"]["tmp_name"]);
	$file2 = trim($_FILES["file2"]["tmp_name"]);
	$file3 = trim($_FILES["file3"]["tmp_name"]);
	$replid=$_REQUEST['replid'];
	$sql18="UPDATE jbsvcr.beritaguru SET judul='$judul', tanggal='$tanggal', abstrak='$abstrak', isi='$isi', idguru='$idguru' WHERE replid='$replid'";
	$result18=QueryDb($sql18);
	if ($file1!=""){
		$sql6="SELECT replid,direktori,namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$replid' ORDER BY replid ASC LIMIT 0,1";
		$result6=QueryDb($sql6);
		$row6=@mysql_fetch_array($result6);
		delete($row6['direktori'].$row6['namafile']);
			$extf1 = $_FILES["file1"]["name"];
			$x1=explode(".",$extf1);
			$ext1=".".$x1[1];
			$namafile1=str_replace(" ","",$x1[0]);
			move_uploaded_file($file1, $newdir.$namafile1."-".$replid.$ext1);
			$sql7="UPDATE jbsvcr.lampiranberitaguru SET namafile='".$namafile1."-".$replid.$ext1."', direktori='".$newdir."' WHERE replid='$row6[replid]'";
			$result7=QueryDb($sql7);

	} elseif ($d1=="1") {
		$sql8="SELECT replid,direktori,namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$replid' ORDER BY replid ASC LIMIT 0,1";
		$result8=QueryDb($sql8);
		$row8=@mysql_fetch_array($result8);
		delete($row8['direktori'].$row8['namafile']);
		$sql9="DELETE FROM jbsvcr.lampiranberitaguru WHERE replid='$row8[replid]'";
		$result9=QueryDb($sql9);
	
	}
	if ($file2!=""){
		$sql10="SELECT replid,direktori,namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$replid' ORDER BY replid ASC LIMIT 1,1";
		$result10=QueryDb($sql10);
		$row10=@mysql_fetch_array($result10);
		delete($row10['direktori'].$row10['namafile']);
			$extf2 = $_FILES["file2"]["name"];
			$x2=explode(".",$extf2);
			$ext2=".".$x2[1];
			$namafile2=str_replace(" ","",$x2[0]);
			move_uploaded_file($file2, $newdir.$namafile2."-".$replid.$ext2);
			$sql11="UPDATE jbsvcr.lampiranberitaguru SET namafile='".$namafile2."-".$replid.$ext2."', direktori='".$newdir."' WHERE replid='$row10[replid]'";
			$result11=QueryDb($sql11);

	} elseif ($d2=="1") {
		$sql12="SELECT replid,direktori,namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$replid' ORDER BY replid ASC LIMIT 1,1";
		$result12=QueryDb($sql12);
		$row12=@mysql_fetch_array($result12);
		delete($row12['direktori'].$row12['namafile']);
		$sql13="DELETE FROM jbsvcr.lampiranberitaguru WHERE replid='$row12[replid]'";
		$result13=QueryDb($sql13);
	
	}

	if ($file3!=""){
		$sql14="SELECT replid,direktori,namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$replid' ORDER BY replid ASC LIMIT 2,1";
		$result14=QueryDb($sql14);
		$row14=@mysql_fetch_array($result14);
		delete($row14['direktori'].$row14['namafile']);
			$extf3 = $_FILES["file3"]["name"];
			$x3=explode(".",$extf3);
			$ext3=".".$x3[1];
			$namafile3=str_replace(" ","",$x3[0]);
			move_uploaded_file($file3, $newdir.$namafile3."-".$replid.$ext3);
			$sql15="UPDATE jbsvcr.lampiranberitaguru SET namafile='".$namafile3."-".$replid.$ext3."', direktori='".$newdir."' WHERE replid='$row14[replid]'";
			$result15=QueryDb($sql15);

	} elseif ($d3=="1") {
		$sql16="SELECT replid,direktori,namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$replid' ORDER BY replid ASC LIMIT 2,1";
		$result16=QueryDb($sql16);
		$row16=@mysql_fetch_array($result16);
		delete($row16['direktori'].$row16['namafile']);
		$sql17="DELETE FROM jbsvcr.lampiranberitaguru WHERE replid='$row17[replid]'";
		$result17=QueryDb($sql17);
	
	}
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
parent.beritaguru_header.lihat();
</script>