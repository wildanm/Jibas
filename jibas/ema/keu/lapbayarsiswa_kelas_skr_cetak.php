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
require_once('../inc/config.php');
require_once('../inc/sessionchecker.php');
require_once('../inc/getheader.php');
require_once('../inc/db_functions.php');
require_once('../inc/common.php');
require_once('../inc/rupiah.php');
$departemen = "";
if (isset($_REQUEST['departemen']))
	$departemen = $_REQUEST['departemen'];
	
$idangkatan = 0;
if (isset($_REQUEST['idangkatan']))
	$idangkatan = (int)$_REQUEST['idangkatan'];

if ($idangkatan==0){
	$nangkatan = "Semua Angkatan";
} else {
	$nangkatan = getname2('angkatan','angkatan','replid',$idangkatan);
}
	
$idtingkat = -1;
if (isset($_REQUEST['idtingkat']))
	$idtingkat = (int)$_REQUEST['idtingkat'];

if ($idtingkat=='-1'){
	$ntingkat = "Semua Tingkat";
} else {
	$ntingkat = getname2('tingkat','tingkat','replid',$idtingkat);
}

$idkelas = -1;
if (isset($_REQUEST['idkelas']))
	$idkelas = (int)$_REQUEST['idkelas'];

if ($idkelas=='-1'){
	$nkelas = "Semua Kelas";
} else {
	$nkelas = getname2('kelas','kelas','replid',$idkelas);
}

$statuslunas = -1;
if (isset($_REQUEST['lunas']))
	$statuslunas = (int)$_REQUEST['lunas'];

if ($statuslunas=='-1')
	$nlunas = "Semua Status";
if ($statuslunas=='0')
	$nlunas = "Belum Lunas";
if ($statuslunas=='1')
	$nlunas = "Lunas";
if ($statuslunas=='2')
	$nlunas = "Gratis";			

$idkategori = "";
if (isset($_REQUEST['idkategori']))
	$idkategori = $_REQUEST['idkategori'];

$nkategori = getname2('kategori',$db_name_fina.'.kategoripenerimaan','kode',$idkategori);



$idpenerimaan = 0;
if (isset($_REQUEST['idpenerimaan']))
	$idpenerimaan = (int)$_REQUEST['idpenerimaan'];
	
$npenerimaan = getname2('nama',$db_name_fina.'.datapenerimaan','replid',$idpenerimaan);

$urut = "nama";	
if (isset($_REQUEST['urut']))
	$urut = $_REQUEST['urut'];	

$urutan = "ASC";	
if (isset($_REQUEST['urutan']))
	$urutan = $_REQUEST['urutan'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS EMA [Cetak Laporan Pembayaran Siswa Setiap Kelas]</title>
</head>

<body>

<table border="0" cellpadding="10" cellspacing="5" width="780" align="left">
<tr>
	<td align="left" valign="top" colspan="2">
<? getHeader($departemen) ?>
	
<center>
  <font size="4"><strong>DATA PEMBAYARAN SETIAP KELAS</strong></font><br />
 </center><br /><br />
<table width="100%">
<tr>
	<td width="8%" class="news_content1"><strong>Departemen</strong></td>
    <td width="35%" class="news_content1">: 
      <?=$departemen ?></td>
    <td width="7%" class="news_content1"><strong>Kategori</strong></td>
    <td width="50%" class="news_content1">: 
      <?=$nkategori ?></td>
</tr>
<tr>
  <td class="news_content1"><strong>Tingkat</strong></td>
  <td class="news_content1">: 
      <?=$ntingkat ?></td>
  <td class="news_content1"><strong>Pembayaran</strong></td>
  <td class="news_content1">: 
      <?=$npenerimaan ?></td>
</tr>
<tr>
  <td class="news_content1"><strong>Kelas</strong></td>
  <td class="news_content1">: 
      <?=$nkelas ?></td>
  <td class="news_content1"><strong>Status</strong></td>
  <td class="news_content1">: 
      <?=$nlunas ?></td>
</tr>
<tr>
  <td class="news_content1"><strong>Angkatan</strong></td>
  <td class="news_content1">: 
      <?=$nangkatan ?></td>
  <td class="news_content1">&nbsp;</td>
  <td class="news_content1">&nbsp;</td>
</tr>
<tr></tr>
</table>
<br />
<?
	$sql = "SELECT replid FROM jbsfina.tahunbuku WHERE departemen='$departemen' AND aktif=1";
	$idtahunbuku = FetchSingle($sql);
	
	if ($idtingkat == -1) 
	{
		$sql = "SELECT MAX(jml) FROM ((SELECT p.nis, COUNT(p.replid) as jml 
										 FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s
										WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku
										  AND p.nis = s.nis AND s.idangkatan = $idangkatan
										  AND p.idpenerimaan = $idpenerimaan GROUP BY p.nis) as X)";
	} 
	else 
	{
		if ($idkelas == -1)
			$sql = "SELECT MAX(jml) FROM ((SELECT p.nis, COUNT(p.replid) as jml 
											 FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k 
											WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
											  AND p.nis = s.nis AND s.idangkatan = $idangkatan AND p.idpenerimaan = $idpenerimaan 
											  AND s.idkelas = k.replid AND k.idtingkat = $idtingkat GROUP BY p.nis) as X)";
		else
			$sql = "SELECT MAX(jml) FROM ((SELECT p.nis, COUNT(p.replid) as jml 
											 FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s 
											WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
											  AND p.nis = s.nis AND s.idkelas = $idkelas AND s.idangkatan = $idangkatan 
											  AND p.idpenerimaan = $idpenerimaan GROUP BY p.nis) as X)";
	}
		
	$result = QueryDb($sql);
	$row = mysql_fetch_row($result);
	$max_n_bayar = $row[0];
	$table_width = 520 + $max_n_bayar * 100;
	
	$sql = "SELECT nama FROM $db_name_fina.datapenerimaan WHERE replid = $idpenerimaan";
	$result = QueryDb($sql);
	$row = mysql_fetch_row($result);
	$namapenerimaan = $row[0];
	?>
	
	<table border="0" width="100%" align="center" background="" style="background-repeat:no-repeat; background-attachment:fixed">
	<!-- TABLE CENTER -->
	<tr>
		<td>
	<? if ($max_n_bayar > 0) { ?>
		<table class="tab" id="table" border="1" cellpadding="5" style="border-collapse:collapse" cellspacing="0" width="<?=$table_width ?>" align="left" bordercolor="#000000">
		<tr height="30" align="center" class="header">
			<td width="30" >No</td>
			<td width="90">N I S </td>
			<td width="160">Nama </td>
			<td width="50">Kelas</td>
		<?	for($i = 0; $i < $max_n_bayar; $i++) { ?>
			<td width="100">Bayaran-<?=$i + 1 ?></td>
		<?  } ?>
			<td width="100">Total Pembayaran</td>
			<!--<td width="200">Keterangan</td>-->
		</tr>
	<?
	
	if ($idtingkat == -1) 
	{
		$sql_tot = "SELECT DISTINCT p.nis, s.nama, k.kelas, t.tingkat 
					  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
					   AND p.nis = s.nis AND s.idkelas = k.replid AND s.idangkatan = $idangkatan 
					   AND p.idpenerimaan = $idpenerimaan AND k.idtingkat = t.replid ORDER BY s.nama";
		
		$sql = "SELECT DISTINCT p.nis, s.nama, k.kelas, t.tingkat 
				  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
				 WHERE p.nis = s.nis AND s.idkelas = k.replid AND s.idangkatan = $idangkatan 
				   AND p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
				   AND p.idpenerimaan = $idpenerimaan AND k.idtingkat = t.replid 
			  ORDER BY $urut $urutan"; 
	} 
	else 
	{
		if ($idkelas == -1)
		{
			$sql_tot = "SELECT DISTINCT p.nis, s.nama, k.kelas, t.tingkat 
						  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
						 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
						   AND p.nis = s.nis AND s.idkelas = k.replid AND k.idtingkat = $idtingkat 
						   AND s.idangkatan = $idangkatan AND p.idpenerimaan = $idpenerimaan AND k.idtingkat = t.replid ORDER BY s.nama";
			
			$sql = "SELECT DISTINCT p.nis, s.nama, k.kelas, t.tingkat 
					  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
					   AND p.nis = s.nis AND s.idkelas = k.replid AND k.idtingkat = $idtingkat AND s.idangkatan = $idangkatan 
					   AND p.idpenerimaan = $idpenerimaan AND k.idtingkat = t.replid ORDER BY $urut $urutan"; 
		} 
		else 
		{
			$sql_tot = "SELECT DISTINCT p.nis, s.nama, k.kelas 
						  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k 
						 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
						   AND p.nis = s.nis AND s.idkelas = k.replid AND s.idkelas = $idkelas 
						   AND s.idangkatan = $idangkatan AND p.idpenerimaan = $idpenerimaan ORDER BY s.nama";
			
			$sql = "SELECT DISTINCT p.nis, s.nama, k.kelas 
					  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k 
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
					   AND p.nis = s.nis AND s.idkelas = k.replid AND s.idkelas = $idkelas 
					   AND s.idangkatan = $idangkatan AND p.idpenerimaan = $idpenerimaan ORDER BY $urut $urutan"; 
		}
	}
	
	$result_tot = QueryDb($sql_tot);
	$total=mysql_num_rows($result_tot);
	$jumlah = mysql_num_rows($result_tot);
	
	$result = QueryDb($sql);
	$cnt = 0;
	
	$totalall = 0;
	while ($row = mysql_fetch_array($result)) { 
		$nis = $row['nis'];
	?>
		
		<tr height="40">
			<td align="center"><?=++$cnt ?></td>
			<td align="center"><?=$row['nis'] ?></td>
			<td align="left"><?=$row['nama'] ?></td>
			<td align="center"><? if ($idkelas == -1) echo $row['tingkat']." - "; ?><?=$row['kelas'] ?></td>
	<?		$sql = "SELECT date_format(p.tanggal, '%d-%b-%y') as tanggal, jumlah 
	                  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
					   AND nis = '$nis' AND idpenerimaan = $idpenerimaan";
			$result2 = QueryDb($sql);
			$nbayar = mysql_num_rows($result2);
			$nblank = $max_n_bayar - $nbayar;
			
			$totalbayar = 0;
			while ($row2 = mysql_fetch_array($result2)) {
				$totalbayar += $row2['jumlah']; ?>
				<td>
					<table border="1" width="100%" style="border-collapse:collapse" cellpadding="0" cellspacing="0" bordercolor="#000000">
					<tr height="20"><td align="center"><?=FormatRupiah($row2['jumlah']) ?></td></tr>
					<tr height="20"><td align="center"><?=$row2['tanggal'] ?></td></tr>
					</table>
				</td>
	<?		} //end for 
			$totalall += $totalbayar;
	
			for ($i = 0; $i < $nblank; $i++) { ?>        
				<td>
					<table border="1" width="100%" style="border-collapse:collapse" cellpadding="0" cellspacing="0" bordercolor="#000000">
					<tr height="20"><td align="center">&nbsp;</td></tr>
					<tr height="20"><td align="center">&nbsp;</td></tr>
					</table>
				</td>
	<?		} //end for ?>        
			<td align="right"><?=FormatRupiah($totalbayar) ?></td>
			<!--<td align="right"><?=$row['keterangan'] ?></td>-->
		</tr>
	<? } //end for ?>
		<input type="hidden" name="tes" id="tes" value="<?=$total?>"/>
		<tr height="30">
			<td bgcolor="#999900" align="center" colspan="<?=4 + $max_n_bayar ?>"><font color="#FFFFFF"><strong>T O T A L</strong></font></td>
			<td bgcolor="#999900" align="right"><font color="#FFFFFF"><strong><?=FormatRupiah($totalall) ?></strong></font></td>
			<!--<td bgcolor="#999900">&nbsp;</td>-->
		</tr>
		</table>
    </td>
  </tr>
</table>
<? } ?>
	</td>
</tr>    
</table>
</body>
<script language="javascript">
window.print();
</script>

</html>