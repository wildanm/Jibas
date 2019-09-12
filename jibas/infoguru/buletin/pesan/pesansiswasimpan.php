<?
/**[N]**
 * JIBAS Education Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 18.0 (August 01, 2019)
 * @notes: JIBAS Education Community will be managed by Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
 * 
 * Copyright (C) 2009 Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
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
require_once('../../include/sessionchecker.php');

$bulan=$_REQUEST['bulan'];
$tahun=$_REQUEST['tahun'];

$judul=CQ($_POST['judul']);
$tgl=explode("-",$_REQUEST['tanggal']);
$tanggaltampil=$tgl[2]."-".$tgl[1]."-".$tgl[0];
$pesan = $_REQUEST['pesan'];
$pesan = str_replace("'", "#sq;", $pesan);

$idpengirim=SI_USER_ID();

OpenDb();

$success = true;
BeginTrans();

$sql = "INSERT INTO jbsvcr.pesan
		   SET tanggalpesan=NOW(), tanggaltampil='$tanggaltampil',judul='$judul',
		       pesan='$pesan',idguru='$idpengirim',nis=NULL,kesiswa=1";
QueryDbTrans($sql, $success);

if ($success)
{
	$sql="SELECT LAST_INSERT_ID()";
	$result=QueryDbTrans($sql, $success);
	$row=@mysql_fetch_row($result);
	$lastid=$row[0];
}

if ($success)
{
	$sql="INSERT INTO jbsvcr.pesanterkirim SET judul='$judul',idpesan=$lastid";
	QueryDbTrans($sql, $success);
}

$jum=(int)$_REQUEST['jum']-1;
$receiverall=$_REQUEST['receiver'];
$x=0;
$receiver=explode("|",$receiverall);
while ($x<=$jum && $success)
{
	if ($receiver[$x]!="")
	{
		$sql="INSERT INTO jbsvcr.tujuanpesan SET idpesan='$lastid', idpenerima='".$receiver[$x]."',baru='1'";
		QueryDbTrans($sql, $success);
	}
	$x++;
}

if ($success)
{
	CommitTrans();
	CloseDb();	?>
<script language="javascript">
	alert ('Pesan telah dikirim');
	document.location.href="pesanguru_footer.php";
</script>
<?
}
else
{
	RollbackTrans();
	CloseDb(); ?>
<script language="javascript">
	alert ('Gagal mengirimkan pesan');
	document.location.href="pesanguru_footer.php";
</script>
<?	
}
?>