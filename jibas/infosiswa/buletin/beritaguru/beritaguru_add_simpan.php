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
$updir = $UPLOAD_DIR."lampiranbs\\";
OpenDb();
$dir_bln=date(m);
$dir_thn=date(Y);
$dir = $updir . $dir_thn . $dir_bln;
if (!is_dir($dir)) 
	mkdir($dir, 0777);
$newdir=$dir."\\";
$dir_db = str_replace($UPLOAD_DIR,$WEB_UPLOAD_DIR,$newdir);
$new_dir_db = str_replace("\\","/",$dir_db);

$jam=date(H).":".date(i).":00";
$judul=$_REQUEST['judul'];
$tgl=explode("-",$_REQUEST['tanggal']);
$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
$abstrak=$_REQUEST['abstrak'];
$isi=$_REQUEST['isi'];
$idguru=SI_USER_ID();
$sql1="INSERT INTO jbsvcr.beritasiswa SET judul='$judul', tanggal='".$tanggal." ".$jam."', abstrak='$abstrak', isi='$isi', idpengirim='$idguru'";
$result1=QueryDb($sql1);

$sql2="SELECT replid FROM jbsvcr.beritasiswa ORDER BY replid DESC LIMIT 1";
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
		$sql3="INSERT INTO jbsvcr.lampiranberitasiswa SET idberita='$lastid', namafile='".$namafile1."-".$lastid.$ext1."', direktori='".$new_dir_db."'";
		$result3=QueryDb($sql3);
}

if ($file2!=""){
	$extf2 = $_FILES["file2"]["name"];
	$x2=explode(".",$extf2);
	$ext2=".".$x2[1];
	$namafile2=str_replace(" ","",$x2[0]);
		move_uploaded_file($file2, $newdir.$namafile2."-".$lastid.$ext2);
		$sql4="INSERT INTO jbsvcr.lampiranberitasiswa SET idberita='$lastid', namafile='".$namafile2."-".$lastid.$ext2."', direktori='".$new_dir_db."'";
		$result4=QueryDb($sql4);
}

if ($file3!=""){
	$extf3 = $_FILES["file3"]["name"];
	$x3=explode(".",$extf3);
	$ext3=".".$x3[1];
	$namafile3=str_replace(" ","",$x3[0]);
		move_uploaded_file($file3, $newdir.$namafile3."-".$lastid.$ext3);
		$sql5="INSERT INTO jbsvcr.lampiranberitasiswa SET idberita='$lastid', namafile='".$namafile3."-".$lastid.$ext3."', direktori='".$new_dir_db."'";
		$result5=QueryDb($sql5);
}
} elseif ($sender=="ubah"){
	OpenDb();
	$updir = $UPLOAD_DIR."lampiranbs\\";
	$dir_bln=date(m);
	$dir_thn=date(Y);
	$dir = $updir . $dir_thn . $dir_bln;
	if (!is_dir($dir)) 
	mkdir($dir, 0777);
	$newdir=$dir."\\";
	$dir_db = str_replace($UPLOAD_DIR,$WEB_UPLOAD_DIR,$newdir);
	$new_dir_db = str_replace("\\","/",$dir_db);
	//KAlo dari ubah berita guru================================================================================================================================
	$judul=$_REQUEST['judul'];
	$d1=$_REQUEST['d1'];
	$d2=$_REQUEST['d2'];
	$d3=$_REQUEST['d3'];
	$repd1=$_REQUEST['repd1'];
	$repd2=$_REQUEST['repd2'];
	$repd3=$_REQUEST['repd3'];
	$tgl=explode("-",$_REQUEST['tanggal']);
	$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
	$abstrak=$_REQUEST['abstrak'];
	$isi=$_REQUEST['isi'];
	$idguru=SI_USER_ID();
	$file1 = trim($_FILES["file1"]["tmp_name"]);
	$file2 = trim($_FILES["file2"]["tmp_name"]);
	$file3 = trim($_FILES["file3"]["tmp_name"]);
	$replid=$_REQUEST['replid'];
	?>
		<script language="javascript">
		//alert ('Mau ngupdate beritanya');
		</script>
	<?
	$sql18="UPDATE jbsvcr.beritasiswa SET judul='$judul', tanggal='$tanggal', abstrak='$abstrak', isi='$isi', idpengirim='$idguru' WHERE replid='$replid'";
	$result18=QueryDb($sql18);
	
	if ($file1!=""){
		if ($repd1!=""){
			OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau nagmbil dir+file pertama');
				</script>
			<?
			$sql="SELECT direktori,namafile FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd1;
			echo $sql."<br>";
			$result=QueryDb($sql);
			$row=@mysql_fetch_array($result);
				//Hapus filenyah..............
					delete($row[direktori].$row[namafile]);
			CloseDb();
			//Buat hapus field
			OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau happus dir+file pertama');
				</script>
			<?
			$sql="DELETE FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd1;
			echo $sql."<br>";
			$result=QueryDb($sql);
			CloseDb();
		}
	$extf1 = $_FILES["file1"]["name"];
	$x1=explode(".",$extf1);
	$ext1=".".$x1[1];
	$namafile1=str_replace(" ","",$x1[0]);
		move_uploaded_file($file1, $newdir.$namafile1."-".$replid.$ext1);
		OpenDb();
				?>
				<script language="javascript">
				//alert ('Mau ngisi dir+file pertama');
				</script>
			<?
	
		$sql="INSERT INTO jbsvcr.lampiranberitasiswa SET idberita='$replid', namafile='".$namafile1."-".$replid.$ext1."', direktori='".$new_dir_db."'";
		$result=QueryDb($sql);
		CloseDb();
	} else {
		if ($d1!="0"){
		OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau nagmbil dir+file pertama');
				</script>
			<?
			$sql="SELECT direktori,namafile FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd1;
			echo $sql."<br>";
			$result=QueryDb($sql);
			$row=@mysql_fetch_array($result);
				//Hapus filenyah..............
					delete($row[direktori].$row[namafile]);
			CloseDb();
			OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau happus dir+file pertama');
				</script>
			<?
			$sql="DELETE FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd1;
			echo $sql."<br>";
			$result=QueryDb($sql);
			CloseDb();
		}
	}



if ($file2!=""){
		if ($repd2!=""){
			OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau nagmbil dir+file pertama');
				</script>
			<?
			$sql="SELECT direktori,namafile FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd2;
			echo $sql."<br>";
			$result=QueryDb($sql);
			$row=@mysql_fetch_array($result);
				//Hapus filenyah..............
					delete($row[direktori].$row[namafile]);
			CloseDb();
			//Buat hapus field
			OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau happus dir+file pertama');
				</script>
			<?
			$sql="DELETE FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd2;
			echo $sql."<br>";
			$result=QueryDb($sql);
			CloseDb();
		}
	$extf2 = $_FILES["file2"]["name"];
	$x2=explode(".",$extf2);
	$ext2=".".$x2[1];
	$namafile2=str_replace(" ","",$x2[0]);
		move_uploaded_file($file2, $newdir.$namafile2."-".$replid.$ext2);
		OpenDb();
				?>
				<script language="javascript">
				//alert ('Mau ngisi dir+file pertama');
				</script>
			<?
	
		$sql="INSERT INTO jbsvcr.lampiranberitasiswa SET idberita='$replid', namafile='".$namafile2."-".$replid.$ext2."', direktori='".$new_dir_db."'";
		$result=QueryDb($sql);
		CloseDb();
	} else {
		if ($d2!="0"){
		OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau nagmbil dir+file pertama');
				</script>
			<?
			$sql="SELECT direktori,namafile FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd2;
			echo $sql."<br>";
			$result=QueryDb($sql);
			$row=@mysql_fetch_array($result);
				//Hapus filenyah..............
					delete($row[direktori].$row[namafile]);
			CloseDb();
			OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau happus dir+file pertama');
				</script>
			<?
			$sql="DELETE FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd2;
			echo $sql."<br>";
			$result=QueryDb($sql);
			CloseDb();
		}
	}

if ($file3!=""){
		if ($repd3!=""){
			OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau nagmbil dir+file pertama');
				</script>
			<?
			$sql="SELECT direktori,namafile FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd3;
			echo $sql."<br>";
			$result=QueryDb($sql);
			$row=@mysql_fetch_array($result);
				//Hapus filenyah..............
					delete($row[direktori].$row[namafile]);
			CloseDb();
			//Buat hapus field
			OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau happus dir+file pertama');
				</script>
			<?
			$sql="DELETE FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd3;
			echo $sql."<br>";
			$result=QueryDb($sql);
			CloseDb();
		}
	$extf3 = $_FILES["file3"]["name"];
	$x3=explode(".",$extf3);
	$ext3=".".$x3[1];
	$namafile3=str_replace(" ","",$x3[0]);
		move_uploaded_file($file3, $newdir.$namafile3."-".$replid.$ext3);
		OpenDb();
				?>
				<script language="javascript">
				//alert ('Mau ngisi dir+file pertama');
				</script>
			<?
	
		$sql="INSERT INTO jbsvcr.lampiranberitasiswa SET idberita='$replid', namafile='".$namafile3."-".$replid.$ext3."', direktori='".$new_dir_db."'";
		$result=QueryDb($sql);
		CloseDb();
	} else {
		if ($d3!="0"){
		OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau nagmbil dir+file pertama');
				</script>
			<?
			$sql="SELECT direktori,namafile FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd3;
			echo $sql."<br>";
			$result=QueryDb($sql);
			$row=@mysql_fetch_array($result);
				//Hapus filenyah..............
					delete($row[direktori].$row[namafile]);
			CloseDb();
			OpenDb();
			?>
				<script language="javascript">
				//alert ('Mau happus dir+file pertama');
				</script>
			<?
			$sql="DELETE FROM jbsvcr.lampiranberitasiswa WHERE replid=".$repd3;
			echo $sql."<br>";
			$result=QueryDb($sql);
			CloseDb();
		}
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