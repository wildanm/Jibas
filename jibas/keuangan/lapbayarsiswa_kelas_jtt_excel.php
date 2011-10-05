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
require_once('include/errorhandler.php');
require_once('include/sessionchecker.php');
require_once('include/common.php');
require_once('include/rupiah.php');
require_once('include/config.php');
require_once('include/db_functions.php');
require_once('include/getheader.php'); 
require_once('library/jurnal.php');
require_once('library/repairdatajtt.php');

/**/
header('Content-Type: application/vnd.ms-excel'); //IE and Opera  
header('Content-Type: application/x-msexcel'); // Other browsers  
header('Content-Disposition: attachment; filename=Iuran_Wajib_Siswa_per_Kelas.xls');
header('Expires: 0');  
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');

$urut=$_REQUEST['urut'];
$urutan = $_REQUEST['urutan'];
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS KEU [Laporan Pembayaran Iuran Wajib Siswa Per Kelas]</title>
</head>

<body>
<?
$sql = "SELECT replid FROM tahunbuku WHERE departemen='$departemen' AND aktif=1";
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
							  FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
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
								  FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
								 WHERE b.info2 = '$idtahunbuku' AND b.idpenerimaan = '$idpenerimaan' AND b.nis = s.nis AND s.idangkatan = '$idangkatan' 
								   AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' GROUP BY s.nis) AS x)";
		} 
		else 
		{
			// tingkat & kelas terpilih
			$sql = "SELECT MAX(jumlah), COUNT(nis) 
			        FROM ((SELECT b.nis AS nis, COUNT(p.replid) AS jumlah 
					           FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s 
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
							  FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
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
						 		  FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
								 WHERE b.nis = s.nis AND s.idangkatan = '$idangkatan' AND b.idpenerimaan = '$idpenerimaan' 
								   AND b.lunas = '$statuslunas' AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' GROUP BY s.nis) AS x)";					
		} 
		else 
		{
			// tingkat & kelas terpilih
			$sql = "SELECT MAX(jumlah), COUNT(nis) 
					  FROM ((SELECT b.nis AS nis, COUNT(p.replid) AS jumlah 
								  FROM penerimaanjtt p RIGHT JOIN  besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s 
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
$sql = "SELECT nama FROM datapenerimaan WHERE replid='$idpenerimaan'";
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

<center><font size="4" face="Arial"><strong>LAPORAN PEMBAYARAN IURAN WAJIB SISWA</strong></font><br /></center>
<br /><br /><br />

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
	<td width="30" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">No</font></strong></td>
    <td width="80" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">N I S</font></strong></td>
    <td width="140" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">Nama</font></strong></td>
    <td width="50" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">Kelas</font></strong></td>
<? 	for($i = 0; $i < $max_n_cicilan; $i++) {
			$n = $i + 1; ?>
    		<td width="120" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">
   		    <?="Bayaran-$n" ?>
    		</font></strong></td>	
    <?  } ?>
    <td width="80" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">Status</font></strong></td>
    <td width="125" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">
      <?=$namapenerimaan ?>
    </font></strong></td>
    <td width="125" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">Total Pembayaran</font></strong></td>
    <td width="125" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">Total Tunggakan</font></strong></td>
    <td width="200" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">Keterangan</font></strong></td>
</tr>

<?
if ($statuslunas == -1) 
{
	if ($idtingkat == -1) 
	{
		// semua tingkat & kelas
		$sql_tot = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
		              FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t
						 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' 
						   AND s.idangkatan = '$idangkatan' AND s.idkelas = k.replid AND k.idtingkat = t.replid"; 
		
		$sql = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
		          FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
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
			              FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
							 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
							   AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' AND k.idtingkat = t.replid"; 
			
			$sql = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
			          FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
						WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
						  AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' AND k.idtingkat = t.replid 
			      ORDER BY $urut $urutan";
		} 
		else 
		{
			// tingkat & kelas terpilih			
			$sql_tot = "SELECT DISTINCT b.nis, s.nama, k.kelas, b.replid AS id, b.besar, b.keterangan, b.lunas 
			              FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k
							 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idkelas = '$idkelas' 
							   AND s.idkelas = k.replid AND s.idangkatan = '$idangkatan'"; 
			
			$sql = "SELECT DISTINCT b.nis, s.nama, k.kelas, b.replid AS id, b.besar, b.keterangan, b.lunas 
			          FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k 
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
		              FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t
						 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan'
						   AND s.idkelas = k.replid AND k.idtingkat = t.replid AND b.lunas = '$statuslunas'"; 
		
		$sql = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas
		          FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
				   WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
					  AND s.idkelas = k.replid AND k.idtingkat = t.replid AND b.lunas = '$statuslunas' 
				ORDER BY $urut $urutan"; 
	} 
	else 
	{
		if ($idkelas == -1) 
		{ 
			$sql_tot = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
			              FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
							 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
							   AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' AND k.idtingkat = t.replid AND b.lunas = '$statuslunas'";
			
			$sql = "SELECT DISTINCT b.nis, s.nama, k.kelas, t.tingkat, b.replid AS id, b.besar, b.keterangan, b.lunas 
			          FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
						WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idangkatan = '$idangkatan' 
						  AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' AND k.idtingkat = t.replid 
						  AND b.lunas = '$statuslunas' 
				   ORDER BY $urut $urutan"; 
		} 
		else 
		{
			$sql_tot = "SELECT DISTINCT b.nis, s.nama, k.kelas, b.replid AS id, b.besar, b.keterangan, b.lunas 
			              FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k
							 WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idkelas = '$idkelas' 
							   AND s.idkelas = k.replid AND b.lunas = '$statuslunas' AND s.idangkatan = '$idangkatan'"; 
									
			$sql = "SELECT DISTINCT b.nis, s.nama, k.kelas, b.replid AS id, b.besar, b.keterangan, b.lunas 
			          FROM penerimaanjtt p RIGHT JOIN besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s, jbsakad.kelas k
						WHERE b.info2 = '$idtahunbuku' AND s.nis = b.nis AND b.idpenerimaan = '$idpenerimaan' AND s.idkelas = '$idkelas'						  
						AND s.idkelas = k.replid AND b.lunas = '$statuslunas' AND s.idangkatan = '$idangkatan' 
				   ORDER BY $urut $urutan"; 
		}
	}
}

$result_tot = QueryDb($sql_tot);
$result = QueryDb($sql);
$cnt = 0;
	
$totalbiayaall = 0;
$totalbayarall = 0;

while ($row = mysql_fetch_array($result)) 
{
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
	$bg1="#ffffff";
	if ($cnt==0 || $cnt%2==0)
		$bg1="#fcffd3";
?>
<tr height="40" bgcolor="<?=$bg1?>">
	<td align="center"><font size="2" face="Arial">
	  <?=++$cnt ?>
	</font></td>
    <td align="center"><font size="2" face="Arial">
      <?=$row['nis'] ?>
    </font></td>
    <td><font size="2" face="Arial">
      <?=$row['nama'] ?>
    </font></td>
    <td align="center"><font size="2" face="Arial">
      <? if ($idkelas == -1) echo  $row['tingkat']." - "; ?>
      <?=$row['kelas'] ?>
    </font></td>
<?
	$sql = "SELECT count(*) FROM penerimaanjtt WHERE idbesarjtt = '$idbesarjtt'";
	$result2 = QueryDb($sql);
	$row2 = mysql_fetch_row($result2);
	$nbayar = $row2[0];
	$nblank = $max_n_cicilan - $nbayar;
	$totalbayar = 0;
	
	if ($nbayar > 0) {
		$sql = "SELECT date_format(tanggal, '%d-%b-%y'), jumlah FROM penerimaanjtt WHERE idbesarjtt = '$idbesarjtt' ORDER BY tanggal";
		$result2 = QueryDb($sql);
		
		$x=0;
		while ($row2 = mysql_fetch_row($result2)) {
		$bg2=$bg1;
		if ($x%2==0 || $x==0)
			$bg2="#d3fffd";
			$totalbayar = $totalbayar + $row2[1]; ?>
            <td bgcolor="<?=$bg2?>">
                <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse" bordercolor="#000000">
                <tr height="20"><td align="center"><font size="2" face="Arial">
                <?=$row2[1] ?>
                </font></td></tr>
                <tr height="20"><td align="center"><font size="2" face="Arial">
                <?=$row2[0] ?>
                </font></td></tr>
    </table>            </td>
<?		$x++;
		}
 		$totalbayarall += $totalbayar;
	}	
	for ($i = 0; $i < $nblank; $i++) { ?>
	    <td>
            <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse" bordercolor="#000000"> 
            <tr height="20"><td align="center">&nbsp;</td></tr>
            <tr height="20"><td align="center">&nbsp;</td></tr>
    </table>        </td>
    <? }?>
    <td align="center"><font size="2" face="Arial">
      <?=$infojtt ?>
    </font></td>
    <td align="right"><font size="2" face="Arial">
      <?=$besarjtt ?>
    </font></td>
    <td align="right"><font size="2" face="Arial">
      <?=$totalbayar ?>
    </font></td>
    <td align="right"><font size="2" face="Arial">
      <?=$besarjtt - $totalbayar ?>
    </font></td>
    <td align="right"><font size="2" face="Arial">
      <?=$ketjtt ?>
    </font></td>
</tr>
<?
}

//if ($total-1 == $page) {
	$totbiayaall = 0;
	$totbayarall = 0;
	
	while ($row_tot = mysql_fetch_array($result_tot)) {
		$jum = $row_tot['jumlah'];
		if ($row_tot == NULL) $jum = 0;
		$totbiayaall += $row_tot['besar'];
		$totbayarall += $jum;
		
	}
?>
<tr height="40">
	<td align="center" colspan="<?=5 + $max_n_cicilan ?>" bgcolor="#999900"><font color="#FFFFFF" size="2" face="Arial"><strong>T O T A L</strong></font></td>
	<td align="right" bgcolor="#999900"><font color="#FFFFFF" size="2" face="Arial"><strong><?=$totbiayaall ?></strong></font></td>
    <td align="right" bgcolor="#999900"><font color="#FFFFFF" size="2" face="Arial"><strong><?=$totalbayarall ?></strong></font></td>
    <td align="right" bgcolor="#999900"><font color="#FFFFFF" size="2" face="Arial"><strong><?=$totbiayaall - $totalbayarall ?></strong></font></td>
    <td bgcolor="#999900">&nbsp;</td>
</tr>
<? //} ?>
</table>
<? CloseDb() ?>
</body>
</html>
<script language="javascript">window.print();</script>