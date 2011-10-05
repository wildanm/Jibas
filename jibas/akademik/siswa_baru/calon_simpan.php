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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/rupiah.php');
require_once('../include/imageresizer.php');
require_once('../include/db_functions.php');

OpenDb();
$proses = $_REQUEST['proses'];

$sql = "SELECT MAX(replid) FROM jbsakad.calonsiswa WHERE idproses = $proses";
$res = QueryDb($sql);	
$row = mysql_fetch_row($res);
$nom = $row[0];

$sql = "SELECT kodeawalan FROM jbsakad.prosespenerimaansiswa WHERE replid = $proses";	
$res = QueryDb($sql);	
$row = mysql_fetch_array($res);	
	
$kode_no = $row['kodeawalan'];		
$thn_no = substr(date("Y"), 2, 2);
$nomor = sprintf("%04d",$nom + 1);
$no = sprintf("%s%02d%04d", $kode_no, $thn_no, $nomor);

$nisn = trim($_REQUEST['nisn']);
$tahunmasuk = $_REQUEST['tahunmasuk'];
$nama = $_REQUEST['nama'];
$nama = str_replace("'", "`", $nama);
$panggilan=$_REQUEST['panggilan'];
$kelamin=$_REQUEST['kelamin'];
$tmplahir=$_REQUEST['tmplahir'];
$tgllahir=$_REQUEST['tgllahir'];
$blnlahir=$_REQUEST['blnlahir'];
$thnlahir=$_REQUEST['thnlahir'];;
$lahir=$thnlahir."-".$blnlahir."-".$tgllahir;
$suku=$_REQUEST['suku'];
$agama=$_REQUEST['agama'];
$status=$_REQUEST['status'];
$kondisi=$_REQUEST['kondisi'];
$warga=$_REQUEST['warga'];
$urutananak=$_REQUEST['urutananak'];;
if ($_REQUEST['urutananak']=="")
	$urutananak = 0;
$jumlahanak=$_REQUEST['jumlahanak'];
if ($_REQUEST['jumlahanak']=="")
	$jumlahanak = 0;
$bahasa=$_REQUEST['bahasa'];
$alamatsiswa=$_REQUEST['alamatsiswa'];
$kodepos=$_REQUEST['kodepos'];
$kodepos_sql = "kodepossiswa = '$kodepos'";
if ($kodepos == "")
	$kodepos_sql = "kodepossiswa = NULL";
$telponsiswa=$_REQUEST['telponsiswa'];
$hpsiswa=trim($_REQUEST['hpsiswa']);
$hpsiswa=str_replace(' ','',$hpsiswa);
$emailsiswa=$_REQUEST['emailsiswa'];
$dep_asal=$_REQUEST['dep_asal'];
$sekolah=$_REQUEST['sekolah'];
$sekolah_sql = "asalsekolah = '$sekolah'";
if ($sekolah == "")
	$sekolah_sql = "asalsekolah = NULL";
$ketsekolah=$_REQUEST['ketsekolah'];
$gol=$_REQUEST['gol'];
//$berat=$_REQUEST['berat'];
$berat = $_REQUEST['berat'];
if ($_REQUEST['berat']=="")
	$berat = 0;
$tinggi = $_REQUEST['tinggi'];
if ($_REQUEST['tinggi']=="")
	$tinggi = 0;
$kesehatan=$_REQUEST['kesehatan'];
$namaayah=$_REQUEST['namaayah'];
$almayah = $_REQUEST['almayah'];
if ($_REQUEST['almayah']<> "1")
	$almayah=0;
$namaibu=$_REQUEST['namaibu'];
$almibu = $_REQUEST['almibu'];
if ($_REQUEST['almibu']<> "1")
	$almibu=0;
$pendidikanayah=$_REQUEST['pendidikanayah'];
$pendidikanayah_sql = "pendidikanayah = '$pendidikanayah'";
if ($pendidikanayah == "")
	$pendidikanayah_sql = "pendidikanayah = NULL";
$pendidikanibu=$_REQUEST['pendidikanibu'];
$pendidikanibu_sql = "pendidikanibu = '$pendidikanibu'";
if ($pendidikanibu == "")
	$pendidikanibu_sql = "pendidikanibu = NULL";
$pekerjaanayah=$_REQUEST['pekerjaanayah'];
$pekerjaanayah_sql = "pekerjaanayah = '$pekerjaanayah'";
if ($pekerjaanayah == "")
	$pekerjaanayah_sql = "pekerjaanayah = NULL";
$pekerjaanibu=$_REQUEST['pekerjaanibu'];
$pekerjaanibu_sql = "pekerjaanibu = '$pekerjaanibu'";
if ($pekerjaanibu == "")
	$pekerjaanibu_sql = "pekerjaanibu = NULL";
$penghasilanayah = $_REQUEST['penghasilanayah'];
if ($_REQUEST['penghasilanayah']=="")
	$penghasilanayah = 0;
$penghasilanibu = $_REQUEST['penghasilanibu'];
if ($_REQUEST['penghasilanibu']=="")
	$penghasilanibu = 0;
$namawali=$_REQUEST['namawali'];
$alamatortu=$_REQUEST['alamatortu'];
$telponortu=$_REQUEST['telponortu'];
$hportu=trim($_REQUEST['hportu']);
$hportu=str_replace(' ','',$hportu);
$emailayah=$_REQUEST['emailayah'];
$emailibu=$_REQUEST['emailibu'];
$alamatsurat=$_REQUEST['alamatsurat'];
$keterangan=$_REQUEST['keterangan'];
$departemen=$_REQUEST['departemen'];
$kelompok = $_REQUEST['kelompok'];

// --- check temporary directory
$tmp_path = realpath(".") . "/../../temp";
$tmp_exists = file_exists($tmp_path) && is_dir($tmp_path);
if (!$tmp_exists)
	mkdir($tmp_path, 0755);
	
$foto = $_FILES["nama_foto"];
$uploadedfile = $foto['tmp_name'];
$uploadedtypefile = $foto['type'];
$uploadedsizefile = $foto['size'];
if ($uploadedfile != "")
{
	$filename = "$tmp_path/ad-cs-tmp.jpg";
	ResizeImage($foto, 159, 120, 100, $filename);
	
	$fh = fopen($filename, "r");
	$foto_data = addslashes(fread($fh, filesize($filename)));
	fclose($fh);
	
	$gantifoto = ", foto='$foto_data'";
} 
else 
{
	if ($_REQUEST['action'] == 'ubah') 
	{	
	   $x = @mysql_fetch_row(QueryDb("SELECT foto FROM jbsakad.calonsiswa WHERE replid=$_REQUEST[replid]"));
	   $data = $x[0];
	   
	   $filename = "$tmp_path/ed-cs-tmp.jpg";
	   $src_img = imagecreatefromstring($data);
	   $dst_img = imagecreatetruecolor(120, 159);
	   imagecopyresampled($dst_img, $src_img, 0,0,0,0, 120, 159, imagesx($src_img), imagesy($src_img));
	   imagejpeg($dst_img, $filename, 100);
	   
	   $fh = fopen($filename, "r");
	   $foto_data = addslashes(fread($fh, filesize($filename)));
	   fclose($fh);
	   
	   $gantifoto = ", foto='$foto_data'";
	}
}

$set = "";
for($i = 1; $i <= 2; $i++)
{
	if ($set != "")
		$set .= ", ";
	$fkd = "sum$i";
	$kd = trim($_REQUEST[$fkd]);
	$kd = (strlen($kd) == 0) ? "0" : $kd;
	$kd = UnformatRupiah($kd);
	$set .= "$fkd = '$kd'";
}

for($i = 1; $i <= 5; $i++)
{
	if ($set != "")
		$set .= ", ";
	$fkd = "ujian$i";
	$kd = trim($_REQUEST[$fkd]);
	$kd = (strlen($kd) == 0) ? 0 : $kd;
	$set .= "$fkd = '$kd'";
}

if ($_REQUEST['action'] == 'ubah') {	
		$sql="UPDATE jbsakad.calonsiswa SET nama='$nama', panggilan='$panggilan', idproses=$proses, idkelompok=$kelompok, suku='$suku', agama='$agama', status='$status', kondisi='$kondisi', kelamin='$kelamin', tmplahir='$tmplahir', tgllahir='$lahir', warga='$warga', anakke=$urutananak, jsaudara=$jumlahanak, bahasa='$bahasa', berat=$berat, tinggi=$tinggi, darah='$gol', foto='$foto', alamatsiswa='$alamatsiswa', $kodepos_sql, telponsiswa='$telponsiswa', hpsiswa='$hpsiswa', emailsiswa='$emailsiswa', kesehatan='$kesehatan', $sekolah_sql, ketsekolah='$ketsekolah', namaayah='$namaayah', namaibu='$namaibu', almayah=$almayah, almibu=$almibu, $pendidikanayah_sql, $pendidikanibu_sql,  $pekerjaanayah_sql, $pekerjaanibu_sql, wali='$namawali', penghasilanayah=$penghasilanayah, penghasilanibu=$penghasilanibu, alamatortu='$alamatortu', telponortu='$telponortu', hportu='$hportu', emailayah='$emailayah', emailibu='$emailibu', alamatsurat='$alamatsurat', keterangan='$keterangan',nisn='$nisn', $set $gantifoto WHERE replid=$_REQUEST[replid]";

} else { 
	$sql="INSERT INTO jbsakad.calonsiswa SET nopendaftaran='$no', nama='$nama', panggilan='$panggilan', tahunmasuk='$tahunmasuk', idproses='$proses', idkelompok='$kelompok', suku='$suku', agama='$agama', status='$status', kondisi='$kondisi', kelamin='$kelamin', tmplahir='$tmplahir', tgllahir='$lahir', warga='$warga', anakke='$urutananak', jsaudara='$jumlahanak', bahasa='$bahasa', berat='$berat', tinggi='$tinggi', darah='$gol', alamatsiswa='$alamatsiswa', $kodepos_sql, telponsiswa='$telponsiswa', hpsiswa='$hpsiswa', emailsiswa='$emailsiswa', kesehatan='$kesehatan', $sekolah_sql, ketsekolah='$ketsekolah', namaayah='$namaayah', namaibu='$namaibu', almayah='$almayah', almibu='$almibu', $pendidikanayah_sql, $pendidikanibu_sql, $pekerjaanayah_sql, $pekerjaanibu_sql, wali='$namawali', penghasilanayah='$penghasilanayah', penghasilanibu='$penghasilanibu', alamatortu='$alamatortu', telponortu='$telponortu', hportu='$hportu', emailayah='$emailayah', emailibu='$emailibu', alamatsurat='$alamatsurat', keterangan='$keterangan',nisn='$nisn', $set $gantifoto";
}	
//echo $sql;
//exit;
$result = QueryDb($sql);
if ($result) { ?>

<script language="javascript">
	parent.opener.refresh_simpan('<?=$departemen?>','<?=$proses?>','<?=$kelompok?>');
	window.close();
</script> 
<?  } 
//} 
//}

CloseDb();
?>

<!--</body>
</html>-->