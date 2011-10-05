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

//$jam=date(H).":".date(i).":00";
$judul=$_REQUEST['judul'];
$jenis=$_REQUEST['jenis'];
$tgl=explode("-",$_REQUEST['tglmulai']);
$tgl2=explode("-",$_REQUEST['tglakhir']);
$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
$tanggal2=$tgl[2]."-".$tgl2[1]."-".$tgl2[0];

$sql1="INSERT INTO jbsvcr.angket SET judul='$judul', tglmulai='".$tanggal."', tglakhir='".$tanggal2."', jenis='".$jenis."'";

$result1=QueryDb($sql1);
?>
<script language="javascript">
parent.daftar_angket;
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
	$jenis=$_REQUEST['jenis'];
	$tgl=explode("-",$_REQUEST['tglmulai']);
	$tgl2=explode("-",$_REQUEST['tglakhir']);
	$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
	$tanggal2=$tgl[2]."-".$tgl2[1]."-".$tgl2[0];
	?>
		<script language="javascript">
		//alert ('Mau ngupdate beritanya');
		</script>
	<?
	$sql18="UPDATE jbsvcr.angket SET angket='$angket', tanggal='$tanggal' WHERE replid='$replid'";
	$result18=QueryDb($sql18);
?>
<script language="javascript">
document.location.href="daftar_angket.php?tahun=<?=$tahun?>";
</script>
<?
}
?>