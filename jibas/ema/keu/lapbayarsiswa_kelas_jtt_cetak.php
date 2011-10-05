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
require_once('../inc/common.php');
require_once('../inc/rupiah.php');
require_once('../inc/config.php');
require_once('../inc/sessionchecker.php');
require_once('../inc/getheader.php');
require_once('../inc/db_functions.php');


$urut="nama";
$urutan = "ASC";
$varbaris = $_REQUEST['varbaris'];	
$page = $_REQUEST['page'];
$total = $_REQUEST['total'];

if (isset($_REQUEST['idpenerimaan']))
	$idpenerimaan = (int)$_REQUEST['idpenerimaan'];
	
if (isset($_REQUEST['idangkatan']))
	$idangkatan = (int)$_REQUEST['idangkatan'];

if (isset($_REQUEST['idtingkat']))
	$idtingkat = (int)$_REQUEST['idtingkat'];
	
if (isset($_REQUEST['idkelas']))
	$idkelas = (int)$_REQUEST['idkelas'];
	
if (isset($_REQUEST['lunas']))
	$statuslunas = (int)$_REQUEST['lunas'];
	
	

OpenDb();	

$sql = "SELECT departemen FROM jbsakad.angkatan WHERE replid='$idangkatan'"; 	
$result = QueryDb($sql);    
$row = mysql_fetch_row($result);	
$departemen = $row[0];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS KEU [Laporan Pembayaran Iuran Wajib Siswa Per Kelas]</title>
<script language="javascript" src="script/tables.js"></script>
<script language="javascript" src="script/tools.js"></script>
</head>

<body>
<?
$sql = "SELECT replid FROM jbsfina.tahunbuku WHERE departemen='$departemen' AND aktif=1";
$idtahunbuku = FetchSingle($sql);

// Dapatkan banyaknya pembayaran yang telah terjadi untuk pembayaran terpilih di kelas terpilih
if ($statuslunas == -1) 
{
	// status belum lunas
	if ($idtingkat == -1) 
	{		
		// semua tingkat & kelas
		$sql = "SELECT MAX(jumlah), COUNT(nis) 
		        FROM ((SELECT b.nis AS nis, COUNT(p.replid) AS jumlah 
							  FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
							 WHERE b.info2 = '$idtahunbuku' AND b.idpenerimaan = '$idpenerimaan' AND b.nis = s.nis AND s.idangkatan = '$idangkatan' 
							   AND s.idkelas = k.replid GROUP BY s.nis) AS x)";							
	} 
	else 
	{ 
		if ($idkelas == -1) 
		{			
			// semua kelas di tingkat terpilih
			$sql = "SELECT MAX(jumlah), COUNT(nis) 
			        FROM ((SELECT b.nis AS nis, COUNT(p.replid) AS jumlah 
								  FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
								 WHERE b.info2 = '$idtahunbuku' AND b.idpenerimaan = '$idpenerimaan' AND b.nis = s.nis AND s.idangkatan = '$idangkatan' 
								   AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' GROUP BY s.nis) AS x)";
		} 
		else 
		{
			// tingkat & kelas terpilih
			$sql = "SELECT MAX(jumlah), COUNT(nis) 
			        FROM ((SELECT b.nis AS nis, COUNT(p.replid) AS jumlah 
					           FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s 
								 WHERE b.info2 = '$idtahunbuku' AND b.idpenerimaan = '$idpenerimaan' AND b.nis = s.nis AND s.idkelas = '$idkelas' 
								   AND s.idangkatan = '$idangkatan' GROUP BY s.nis) AS x)";
		}
	}
} 
else 
{
	if ($idtingkat == -1) 
	{
		// semua tingkat & kelas 
		$sql = "SELECT MAX(jumlah), COUNT(nis) 
		        FROM ((SELECT b.nis AS nis, COUNT(p.replid) AS jumlah 
							  FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
							 WHERE b.nis = s.nis AND s.idangkatan = '$idangkatan' AND b.idpenerimaan = '$idpenerimaan' 
							   AND b.lunas = '$statuslunas' AND s.idkelas = k.replid  GROUP BY s.nis) AS x)";					
	} 
	else 
	{
		if ($idkelas == -1) 
		{
			// semua kelas di tingkat terpilih						
			$sql = "SELECT MAX(jumlah), COUNT(nis) 
					  FROM ((SELECT b.nis AS nis, COUNT(p.replid) AS jumlah 
						 		  FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
								 WHERE b.nis = s.nis AND s.idangkatan = '$idangkatan' AND b.idpenerimaan = '$idpenerimaan' 
								   AND b.lunas = '$statuslunas' AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' GROUP BY s.nis) AS x)";					
		} 
		else 
		{
			// tingkat & kelas terpilih
			$sql = "SELECT MAX(jumlah), COUNT(nis) 
					  FROM ((SELECT b.nis AS nis, COUNT(p.replid) AS jumlah 
								  FROM jbsfina.penerimaanjtt p RIGHT JOIN  jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s 
								 WHERE b.nis = s.nis AND s.idangkatan = '$idangkatan' AND b.idpenerimaan = '$idpenerimaan' 
									AND b.lunas = '$statuslunas' AND s.idkelas = '$idkelas' GROUP BY s.nis) AS x)";												
		}
	}
}

$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$max_n_cicilan = $row[0];
$table_width = 810 + $max_n_cicilan * 90;

//Dapatkan namapenerimaan
$sql = "SELECT nama FROM jbsfina.datapenerimaan WHERE replid='$idpenerimaan'";
$namapenerimaan = FetchSingle($sql);

$namatingkat = "(all)";
$namakelas = "(all)";
if ($idkelas <> -1 && $idtingkat <> -1) 
{
	$sql = "SELECT kelas FROM jbsakad.kelas WHERE replid='$idkelas'";
	$result = QueryDb($sql);
	$row = mysql_fetch_row($result);
	$namakelas = $row[0];
} 
else 
{
	$sql = "SELECT tingkat FROM jbsakad.tingkat WHERE replid='$idtingkat'";
	$result = QueryDb($sql);
	$row = mysql_fetch_row($result);
	$namatingkat = $row[0];
} 

$sql = "SELECT angkatan, departemen FROM jbsakad.angkatan WHERE replid='$idangkatan'";
$row = FetchSingleRow($sql);
$angkatan = $row[0];
$departemen = $row[1];
?>

<table border="0" cellpadding="10" cellpadding="5" width="<?=$table_width + 50 ?>" align="left">
<tr><td align="left" valign="top">

<?=getHeader($departemen)?>

<center><font size="4"><strong>LAPORAN PEMBAYARAN IURAN WAJIB SISWA</strong></font><br /> </center><br /><br />
<br />

<table border="0">
<tr>
	<td><strong>Departemen:</strong></td>
   <td><?=$departemen?></td>
</tr>
<tr>
	<td><strong>Angkatan:</strong></td>
   <td><?=$angkatan?></td>
</tr>
<tr>
	<td><strong>Tingkat:</strong></td>
   <td><?=$namatingkat?></td>
</tr>
<tr>
	<td><strong>Kelas:</strong></td>
   <td><?=$namakelas?></td>
</tr>
</table>

<table class="tab" id="table" border="1" cellpadding="5" style="border-collapse:collapse" cellspacing="0" width="<?=$table_width ?>" align="left" bordercolor="#000000">
<tr height="30">
	<td class="header" width="30" align="center">No</td>
    <td class="header" width="80" align="center">N I S</td>
    <td class="header" width="140" align="center">Nama</td>
    <td class="header" width="50" align="center">Kelas</td>
    <? 	for($i = 0; $i < $max_n_cicilan; $i++) { 
			$n = $i + 1; ?>
    		<td class="header" width="120" align="center"><?="Bayaran-$n" ?></td>	
    <?  } ?>
    <td class="header" width="80" align="center">Status</td>
    <td class="header" width="125" align="center"><?=$namapenerimaan ?></td>
    <td class="header" width="125" align="center">Total Pembayaran</td>
    <td class="header" width="125" align="center">Total Tunggakan</td>
    <td class="header" width="200" align="center">Keterangan</td>
</tr>

<?
if ($statuslunas == -1) 
{
	if ($idtingkat == -1) 
	{
		// semua tingkat & kelas
		$sql_tot = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
		              FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t
						 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' 
						   AND s.idangkatan = '$idangkatan' AND s.idkelas = k.replid AND k.idtingkat = t.replid"; 
		
		$sql = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
		          FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
					WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' 
					  AND s.idangkatan = '$idangkatan' AND s.idkelas = k.replid AND k.idtingkat = t.replid 
			   ORDER BY $urut $urutan";
	} 
	else 
	{
		if ($idkelas == -1) 
		{
			// semua kelas di tingkat terpilih
			$sql_tot = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
			              FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
							 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
							   AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' AND k.idtingkat = t.replid"; 
			
			$sql = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
			          FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
						WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
						  AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' AND k.idtingkat = t.replid 
			      ORDER BY $urut $urutan";
		} 
		else 
		{
			// tingkat & kelas terpilih			
			$sql_tot = "SELECT b.nis, s.nama, k.kelas, b.replid AS id, b.besar, b.keterangan, b.lunas 
			              FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k
							 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idkelas = '$idkelas' 
							   AND s.idkelas = k.replid AND s.idangkatan = '$idangkatan'"; 
			
			$sql = "SELECT b.nis, s.nama, k.kelas, b.replid AS id, b.besar, b.keterangan, b.lunas 
			          FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
						WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idkelas = '$idkelas' 
						  AND s.idkelas = k.replid AND s.idangkatan = '$idangkatan' 
				   ORDER BY $urut $urutan";
		}
	} 
} 
else 
{
	if ($idtingkat == -1) 
	{
		// semua tingkat & kelas
		$sql_tot = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
		              FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t
						 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan'
						   AND s.idkelas = k.replid AND k.idtingkat = t.replid AND b.lunas = '$statuslunas'"; 
		
		$sql = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas
		          FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
				   WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
					  AND s.idkelas = k.replid AND k.idtingkat = t.replid AND b.lunas = '$statuslunas' 
				ORDER BY $urut $urutan"; 
	} 
	else 
	{
		if ($idkelas == -1) 
		{ 
			$sql_tot = "SELECT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
			              FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
							 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
							   AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' AND k.idtingkat = t.replid AND b.lunas = '$statuslunas'";
			
			$sql = "SELECT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
			          FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
						WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
						  AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' AND k.idtingkat = t.replid 
						  AND b.lunas = '$statuslunas' 
				   ORDER BY $urut $urutan"; 
		} 
		else 
		{
			$sql_tot = "SELECT b.nis, s.nama, k.kelas, b.replid AS id, b.besar, b.keterangan, b.lunas 
			              FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k
							 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idkelas = '$idkelas' 
							   AND s.idkelas = k.replid AND b.lunas = '$statuslunas' AND s.idangkatan = '$idangkatan'"; 
									
			$sql = "SELECT b.nis, s.nama, k.kelas, b.replid AS id, b.besar, b.keterangan, b.lunas 
			          FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k
						WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idkelas = '$idkelas' 
						  AND s.idkelas = k.replid AND b.lunas = '$statuslunas' AND s.idangkatan = '$idangkatan' 
				   ORDER BY $urut $urutan"; 
		}
	}
}
		
OpenDb();
$result_tot = QueryDb($sql_tot);
$result = QueryDb($sql);
//if ($page==0)
	$cnt = 0;
//else 
	//$cnt = (int)$page*(int)$varbaris;
	
$totalbiayaall = 0;
$totalbayarall = 0;

while ($row = mysql_fetch_array($result)) {
	$idbesarjtt = $row['id'];
	$besarjtt = $row['besar'];
	$ketjtt = $row['keterangan'];
	$lunasjtt = $row['lunas'];
	if ($lunasjtt == 1)
		$infojtt = "<font color=blue><strong>Lunas</strong></font>";
	elseif ($lunasjtt == 2)
		$infojtt = "<font color=green><strong>Gratis</strong></font>";
	else	
		$infojtt = "<font color=red><strong>Belum Lunas</strong></font>";
	
	$totalbiayaall += $besarjtt;
?>
<tr height="40">
	<td align="center"><?=++$cnt ?></td>
    <td align="center"><?=$row['nis'] ?></td>
    <td><?=$row['nama'] ?></td>
    <td align="center"><? if ($idkelas == -1) echo $row['tingkat']." - "; ?><?=$row['kelas'] ?></td>
    <?
	$sql = "SELECT count(*) FROM jbsfina.penerimaanjtt WHERE idbesarjtt = '$idbesarjtt'";
	$result2 = QueryDb($sql);
	$row2 = mysql_fetch_row($result2);
	$nbayar = $row2[0];
	$nblank = $max_n_cicilan - $nbayar;
	$totalbayar = 0;
	
	if ($nbayar > 0) {
		$sql = "SELECT date_format(tanggal, '%d-%b-%y'), jumlah FROM jbsfina.penerimaanjtt WHERE idbesarjtt = '$idbesarjtt' ORDER BY tanggal";
		$result2 = QueryDb($sql);
		while ($row2 = mysql_fetch_row($result2)) {
			$totalbayar = $totalbayar + $row2[1]; ?>
            <td>
                <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse" bordercolor="#000000">
                <tr height="20"><td align="center"><?=FormatRupiah($row2[1]) ?></td></tr>
                <tr height="20"><td align="center"><?=$row2[0] ?></td></tr>
                </table>
            </td>
 <?		}
 		$totalbayarall += $totalbayar;
	}	
	for ($i = 0; $i < $nblank; $i++) { ?>
	    <td>
            <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse" bordercolor="#000000"> 
            <tr height="20"><td align="center">&nbsp;</td></tr>
            <tr height="20"><td align="center">&nbsp;</td></tr>
            </table>
        </td>
    <? }?>
    <td align="center"><?=$infojtt ?></td>
    <td align="right"><?=FormatRupiah($besarjtt) ?></td>
    <td align="right"><?=FormatRupiah($totalbayar) ?></td>
    <td align="right"><?=FormatRupiah($besarjtt - $totalbayar) ?></td>
    <td align="right"><?=$ketjtt ?></td>
</tr>
<?
}

//if ($total-1 == $page) {
	//$totbiayaall = 0;
	//$totbayarall = 0;
	
	while ($row_tot = mysql_fetch_array($result_tot)) {
		$jum = $row_tot['jumlah'];
		if ($row_tot == NULL) $jum = 0;
		$totbiayaall += $row_tot['besar'];
		$totbayarall += $jum;
		
	}
?>
<tr height="40">
	<td align="center" colspan="<?=5 + $max_n_cicilan ?>" bgcolor="#999900"><font color="#FFFFFF"><strong>T O T A L</strong></font></td>
	<td align="right" bgcolor="#999900"><font color="#FFFFFF"><strong><?=FormatRupiah($totbiayaall) ?></strong></font></td>
    <td align="right" bgcolor="#999900"><font color="#FFFFFF"><strong><?=FormatRupiah($totalbayarall) ?></strong></font></td>
    <td align="right" bgcolor="#999900"><font color="#FFFFFF"><strong><?=FormatRupiah($totbiayaall - $totalbayarall) ?></strong></font></td>
    <td bgcolor="#999900">&nbsp;</td>
</tr>
<? //} ?>
</table>
<? CloseDb() ?>
 <!-- END TABLE CONTENT -->
    
	</td>
</tr>
<!--tr>
   	<td align="right">Halaman <strong><?=$page+1?></strong> dari <strong><?=$total?></strong> halaman</td>
</tr-->
    </table>
</td></tr></table>
</body>
</html>
<script language="javascript">window.print();</script>