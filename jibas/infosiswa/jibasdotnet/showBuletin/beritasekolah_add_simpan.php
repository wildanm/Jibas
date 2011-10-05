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
require_once('../../include/getheader.php');
require_once('../../include/db_functions.php');
$sender=$_REQUEST['sender'];
if ($sender=="tambah"){
OpenDb();
$dir_bln=date(m);
$dir_thn=date(Y);
$dir = $updir . $dir_thn . $dir_bln;

$jam=date(H).":".date(i).":00";
$judul=$_REQUEST['judul'];
$tgl=explode("-",$_REQUEST['tanggal']);
$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
$jenis=$_REQUEST['jenisberita'];
$abstrak=$_REQUEST['abstrak'];
$isi=$_REQUEST['isi'];
$idpengirim=SI_USER_ID();
$sql1="INSERT INTO jbsvcr.beritasekolah SET judul='$judul', tanggal='".$tanggal." ".$jam."', jenisberita='$jenis',abstrak='$abstrak', isi='$isi', idpengirim='$idpengirim'";
$result1=QueryDb($sql1);
?>
<script language="javascript">
parent.beritasekolah_header.lihat();
</script>
<?
} elseif ($sender=="ubah"){
	OpenDb();
	$page=(int)$_REQUEST['page'];
	$bulan=$_REQUEST['bulan'];
	$tahun=$_REQUEST['tahun'];
	$updir = $UPLOAD_DIR."lampiranbg\\";
	$dir_bln=date(m);
	$dir_thn=date(Y);
	$dir = $updir . $dir_thn . $dir_bln;

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
	$jenisberita=$_REQUEST['jenisberita'];
	$abstrak=$_REQUEST['abstrak'];
	$isi=$_REQUEST['isi'];
	$idpengirim=SI_USER_ID();
	$replid=$_REQUEST['replid'];
	?>
		<script language="javascript">
		//alert ('Mau ngupdate beritanya');
		</script>
	<?
	$sql18="UPDATE jbsvcr.beritasekolah SET judul='$judul', tanggal='$tanggal', jenisberita='$jenisberita', abstrak='$abstrak', isi='$isi' WHERE replid='$replid'";
	$result18=QueryDb($sql18);
?>
<script language="javascript">
document.location.href="beritasekolah_footer.php?page=<?=$page?>&tahun=<?=$tahun?>&bulan=<?=$bulan?>";
</script>
<?
}
?>