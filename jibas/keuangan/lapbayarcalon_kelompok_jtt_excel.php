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
require_once('include/errorhandler.php');
require_once('include/sessionchecker.php');
require_once('include/common.php');
require_once('include/rupiah.php');
require_once('include/config.php');
require_once('include/db_functions.php');
require_once('include/getheader.php'); 
require_once('library/jurnal.php');
require_once('library/repairdatajttcalon.php');

/**/
header('Content-Type: application/vnd.ms-excel'); //IE and Opera  
header('Content-Type: application/x-msexcel'); // Other browsers  
header('Content-Disposition: attachment; filename=Laporan_Tunggakan_Iuran_Wajib_Calon_Siswa_setiap_Kelompok.xls');
header('Expires: 0');  
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');

$urut=$_REQUEST['urut'];
$urutan = $_REQUEST['urutan'];
$varbaris = $_REQUEST['varbaris'];	
$page = $_REQUEST['page'];
$total = $_REQUEST['total'];

$idtahunbuku = 0;
if (isset($_REQUEST['idtahunbuku']))
	$idtahunbuku = (int)$_REQUEST['idtahunbuku'];

$idpenerimaan = 0;
if (isset($_REQUEST['idpenerimaan']))
	$idpenerimaan = (int)$_REQUEST['idpenerimaan'];
	
$kelompok = -1;
if (isset($_REQUEST['kelompok']))
	$kelompok = (int)$_REQUEST['kelompok'];
	
if (isset($_REQUEST['statuslunas']))
	$statuslunas = (int)$_REQUEST['statuslunas'];

OpenDb();
$sql = "SELECT departemen FROM datapenerimaan WHERE replid=$idpenerimaan";
$result = QueryDb($sql);
$r = @mysql_fetch_array($result);
$departemen = $r[departemen];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS KEU [Laporan Pembayaran Iuran Wajib Calon Siswa Per Kelompok]</title>
</head>

<body>
<?
// Dapatkan banyaknya pembayaran yang telah terjadi untuk pembayaran terpilih di kelas terpilih
if ($statuslunas == -1)
	if ($kelompok == -1)
		$sql = "SELECT MAX(jumlah) 
		          FROM ((SELECT c.replid, count(p.replid) as jumlah 
								 FROM penerimaanjttcalon p, besarjttcalon b, jbsakad.calonsiswa c 
								WHERE p.idbesarjttcalon = b.replid AND b.idcalon = c.replid AND b.info2='$idtahunbuku'
								  AND b.idpenerimaan = $idpenerimaan GROUP BY c.replid) AS x);";
	else
		$sql = "SELECT MAX(jumlah) 
		          FROM ((SELECT c.replid, count(p.replid) as jumlah 
								 FROM penerimaanjttcalon p, besarjttcalon b, jbsakad.calonsiswa c 
							   WHERE p.idbesarjttcalon = b.replid AND b.idcalon = c.replid AND b.info2='$idtahunbuku'
								  AND c.idkelompok = $kelompok AND b.idpenerimaan = $idpenerimaan GROUP BY c.replid) AS x);";
else
	if ($kelompok == -1)
		$sql = "SELECT MAX(jumlah) 
		          FROM ((SELECT c.replid, count(p.replid) as jumlah 
							    FROM penerimaanjttcalon p, besarjttcalon b, jbsakad.calonsiswa c 
								WHERE p.idbesarjttcalon = b.replid AND b.idcalon = c.replid AND b.info2='$idtahunbuku' 
								 AND b.idpenerimaan = $idpenerimaan AND b.lunas = $statuslunas GROUP BY c.replid) AS x);";
	else
		$sql = "SELECT MAX(jumlah) 
		          FROM ((SELECT c.replid, count(p.replid) as jumlah 
								 FROM penerimaanjttcalon p, besarjttcalon b, jbsakad.calonsiswa c 
								WHERE p.idbesarjttcalon = b.replid AND b.idcalon = c.replid AND b.info2='$idtahunbuku' 
								  AND c.idkelompok = $kelompok AND b.idpenerimaan = $idpenerimaan AND b.lunas = $statuslunas GROUP BY c.replid) AS x);";

$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$max_n_cicilan = $row[0];
$table_width = 810 + $max_n_cicilan * 90;

//Dapatkan namapenerimaan
$sql = "SELECT nama FROM datapenerimaan WHERE replid=$idpenerimaan";
$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$namapenerimaan = $row[0];

?>
<center><font size="4"><strong><font face="Verdana">LAPORAN PEMBAYARAN IURAN WAJIB CALON SISWA</font></strong></font><font face="Verdana"><br /> 
  </font>
</center>
<br /><br />
<br />
<table class="tab" id="table" border="1" cellpadding="5" style="border-collapse:collapse" cellspacing="0" width="<?=$table_width ?>" align="left" bordercolor="#000000">
<tr height="30" align="center">
	<td width="30" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">No</font></strong></td>
    <td width="80" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">No. Reg</font></strong></td>
    <td width="140" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">Nama</font></strong></td>
    <td width="50" align="center" bgcolor="#CCCCCC" class="header"><strong><font size="2" face="Arial">Kel</font></strong></td>
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
	if ($kelompok == -1) 
	{
		$sql_tot = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
		              FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, besarjttcalon b 
						 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku' AND c.idkelompok = k.replid 
				 	 ORDER BY c.nama";
		
		$sql = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
		          FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, besarjttcalon b 
					WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
					  AND c.idkelompok = k.replid ORDER BY $urut $urutan";
	} 
	else 
	{
		$sql_tot = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
		              FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, besarjttcalon b 
						 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
						   AND c.idkelompok = $kelompok AND c.idkelompok = k.replid ORDER BY c.nama";
		
		$sql = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
		          FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, besarjttcalon b 
					WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku' 
					  AND c.idkelompok = $kelompok AND c.idkelompok = k.replid ORDER BY $urut $urutan";
	}
} 
else 
{
	if ($kelompok == -1) 
	{
		$sql_tot = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
					     FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, besarjttcalon b 
						 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
						   AND c.idkelompok = k.replid AND b.lunas = $statuslunas";
	
		$sql = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
					 FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, besarjttcalon b
					WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku' 
					  AND c.idkelompok = k.replid AND b.lunas = $statuslunas ORDER BY $urut $urutan";
	} 
	else 
	{
		$sql_tot = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas
		              FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, besarjttcalon b
						 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
						   AND c.idkelompok = $kelompok AND c.idkelompok = k.replid AND b.lunas = $statuslunas"; 
		
		$sql = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
		          FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, besarjttcalon b 
					WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
					  AND c.idkelompok = $kelompok AND c.idkelompok = k.replid AND b.lunas = $statuslunas ORDER BY $urut $urutan";
	}
}

$result = QueryDb($sql);
$cnt = 0;
$totalbiayaall = 0;
$totalbayarall = 0;

while ($row = mysql_fetch_array($result)) {
	$bg1="#ffffff";
	if ($cnt==0 || $cnt%2==0)
		$bg1="#fcffd3";
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
<tr height="40" bgcolor="<?=$bg1?>">
	<td align="center">	  <font size="2" face="Arial">
	  <?=++$cnt ?>	
    </font></td>
    <td align="center">      <font size="2" face="Arial">
      <?=$row['nopendaftaran'] ?>    
    </font></td>
    <td>      <font size="2" face="Arial">
      <?=$row['nama'] ?>    
    </font></td>
    <td align="center">      <font size="2" face="Arial">
      <?=$row['kelompok'] ?>    
    </font></td>
<?
	$sql = "SELECT count(*) FROM penerimaanjttcalon WHERE idbesarjttcalon = $idbesarjtt";
	$result2 = QueryDb($sql);
	$row2 = mysql_fetch_row($result2);
	$nbayar = $row2[0];
	$nblank = $max_n_cicilan - $nbayar;
	$totalbayar = 0;
	
	if ($nbayar > 0) {
		$sql = "SELECT date_format(tanggal, '%d-%b-%y'), jumlah FROM penerimaanjttcalon WHERE idbesarjttcalon = $idbesarjtt ORDER BY tanggal";
		$result2 = QueryDb($sql);
		$x=0;
		while ($row2 = mysql_fetch_row($result2)) {
			$bg2=$bg1;
			if ($x%2==0 || $x==0)
				$bg2="#d3fffd";
			$totalbayar = $totalbayar + $row2[1]; ?>
            <td bgcolor="<?=$bg2?>">
                <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse" bordercolor="#000000">
                <tr height="20"><td align="center">                  <font size="2" face="Arial">
                <?=$row2[1] ?>
                </font></td></tr>
                <tr height="20"><td align="center">                  <font size="2" face="Arial">
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
    <td align="center">      <font size="2" face="Arial">
      <?=$infojtt ?>    
    </font></td>
    <td align="right">      <font size="2" face="Arial">
      <?=$besarjtt ?>    
    </font></td>
    <td align="right">      <font size="2" face="Arial">
      <?=$totalbayar ?>    
    </font></td>
    <td align="right">      <font size="2" face="Arial">
      <?=$besarjtt - $totalbayar ?>    
    </font></td>
    <td>      <font size="2" face="Arial">
      <?=$ketjtt ?>    
    </font></td>
</tr>
<?
}
?>
<tr height="40">
	<td align="center" colspan="<?=5 + $max_n_cicilan ?>" bgcolor="#999900"><font color="#FFFFFF" size="2" face="Arial"><strong>T O T A L</strong></font></td>
	<td align="right" bgcolor="#999900"><font color="#FFFFFF" size="2" face="Arial"><strong><?=$totalbiayaall ?></strong></font></td>
    <td align="right" bgcolor="#999900"><font color="#FFFFFF" size="2" face="Arial"><strong><?=$totalbayarall ?></strong></font></td>
    <td align="right" bgcolor="#999900"><font color="#FFFFFF" size="2" face="Arial"><strong><?=$totalbiayaall - $totalbayarall ?></strong></font></td>
    <td bgcolor="#999900">&nbsp;</td>
</tr>
</table>
<? CloseDb() ?>

</td>
</tr>
</table>
</body>
</html>
<script language="javascript">window.print();</script>