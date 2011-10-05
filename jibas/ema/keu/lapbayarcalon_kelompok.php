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
require_once('../inc/common.php');
require_once('../inc/rupiah.php');
require_once('../inc/config.php');
require_once('../inc/sessionchecker.php');
require_once('../inc/getheader.php');
require_once('../inc/db_functions.php');

$idkategori = "";
if (isset($_REQUEST['idkategori']))
	$idkategori = $_REQUEST['idkategori'];

$idpenerimaan = 0;
if (isset($_REQUEST['idpenerimaan']))
	$idpenerimaan = (int)$_REQUEST['idpenerimaan'];

$departemen = "";
if (isset($_REQUEST['departemen']))
	$departemen = $_REQUEST['departemen'];

$kelompok = -1;
if (isset($_REQUEST['kelompok']))
	$kelompok = (int)$_REQUEST['kelompok'];

$statuslunas = -1;
if (isset($_REQUEST['lunas']))
	$statuslunas = (int)$_REQUEST['lunas'];

$varbaris=10;
if (isset($_REQUEST['varbaris']))
	$varbaris = $_REQUEST['varbaris'];

$page=0;
if (isset($_REQUEST['page']))
	$page = $_REQUEST['page'];
	
$urut = "nama";	
if (isset($_REQUEST['urut']))
	$urut = $_REQUEST['urut'];	

$urutan = "ASC";	
if (isset($_REQUEST['urutan']))
	$urutan = $_REQUEST['urutan'];
OpenDb();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" src="../script/tools.js"></script>
<script language="javascript">
function change_kate() 
{
	var idkategori = document.getElementById('idkategori').value;
	var dep = document.getElementById('departemen').value;
	var kelompok = document.getElementById('kelompok').value;
	var lunas = document.getElementById('lunas').value;

	document.location.href = "lapbayarcalon_kelompok.php?idkategori="+idkategori+"&kelompok="+kelompok+"&lunas="+lunas+"&departemen="+dep;
}

function change_dep() 
{
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var dep = document.getElementById('departemen').value;
	var lunas = document.getElementById('lunas').value;
	
	document.location.href = "lapbayarcalon_kelompok.php?idkategori="+idkategori+"&idpenerimaan="+idpenerimaan+"&departemen="+dep+"&lunas="+lunas;
}

function change_penerimaan() { }

function change() { }

function change_status() { }

function show_pembayaran() 
{
	var dep = document.getElementById('departemen').value;
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var kelompok = document.getElementById('kelompok').value;
	var lunas = document.getElementById('lunas').value;
	
	if (kelompok.length == 0) 
	{	
		alert ('Pastikan kelompok sudah ada!');	
		document.getElementById('kelompok').focus();
		return false;		
	} 
	else if (idkategori.length == 0) 
	{
		alert ('Pastikan kategori pembayaran sudah ada!');
		document.getElementById('idkategori').focus();
		return false;	
	} 
	else if (idpenerimaan.length == 0) 
	{
		alert ('Pastikan penerimaan pembayaran sudah ada!');
		document.getElementById('idpenerimaan').focus();
		return false;	
	}
	
	var kat;
	if (idkategori == 'CSWJB')	
		kat="jtt";
	else
		kat="skr";	
	//if (idkategori == 'CSWJB')
		document.location.href = "lapbayarcalon_kelompok.php?idpenerimaan="+idpenerimaan+"&kelompok="+kelompok+"&lunas="+lunas+"&departemen="+dep+"&idkategori="+idkategori+"&showpembayaran=true&kat="+kat;
	//else 
		//parent.content.location.href = "lapbayarcalon_kelompok_skr.php?idpenerimaan="+idpenerimaan+"&kelompok="+kelompok;
}
function cetak() 
{
	var dep = document.getElementById('departemen').value;
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var kelompok = document.getElementById('kelompok').value;
	var lunas = document.getElementById('lunas').value;
	
	var kat;
	if (idkategori == 'CSWJB')	
		var addr = "lapbayarcalon_kelompok_jtt_cetak.php?idpenerimaan="+idpenerimaan+"&kelompok="+kelompok+"&lunas="+lunas+"&departemen="+dep+"&idkategori="+idkategori+"&showpembayaran=true&kat="+kat;
	else
		var addr = "lapbayarcalon_kelompok_skr_cetak.php?idpenerimaan="+idpenerimaan+"&kelompok="+kelompok+"&lunas="+lunas+"&departemen="+dep+"&idkategori="+idkategori+"&showpembayaran=true&kat="+kat;

	newWindow(addr, 'CetakNeraca','790','630','resizable=1,scrollbars=1,status=0,toolbar=0');
}

function change_page(page) 
{
	var dep = document.getElementById('departemen').value;
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var kelompok = document.getElementById('kelompok').value;
	var lunas = document.getElementById('lunas').value;
	
	var kat;
	if (idkategori == 'CSWJB')	
		kat="jtt";
	else
		kat="skr";
	if (page == 'XX')	
		page=document.getElementById('page').value;
	
	document.location.href = "lapbayarcalon_kelompok.php?idpenerimaan="+idpenerimaan+"&kelompok="+kelompok+"&lunas="+lunas+"&departemen="+dep+"&idkategori="+idkategori+"&showpembayaran=true&kat="+kat+"&page="+page;
}

function focusNext(elemName, evt) 
{
	evt = (evt) ? evt : event;
	var charCode = (evt.charCode) ? evt.charCode :
		((evt.which) ? evt.which : evt.keyCode);
	if (charCode == 13) 
	{
		if (elemName == "tampil") 
			show_pembayaran();
		else 
			document.getElementById(elemName).focus();
		return false;
	}
	return true;
}

</script>
</head>

<body topmargin="0" leftmargin="0" onload="document.getElementById('departemen').focus()">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<!-- TABLE TITLE -->
<tr>
    <td rowspan="3" width="55%">
    <table width = "100%" border = "0">
	<tr>
        <td width="11%" class="news_content1">Departemen </td>
        <td width="89%">
    	<select name="departemen" class="cmbfrm" id="departemen" style="width:188px" onchange="change_dep()">
    	        <? 	$sql = "SELECT departemen FROM departemen WHERE aktif = 1 ORDER BY urutan";
            $result = QueryDb($sql);
            while($row = mysql_fetch_row($result)) {
                if ($departemen == "")
                    $departemen = $row[0]; ?>
    	      <option value="<?=$row[0]?>" <?=StringIsSelected($row[0], $departemen)?> > 
    	        <?=$row[0]?>
   	          </option>
   	              <? } ?>
          </select>        </td>
    </tr>
     <tr>
    	<td class="news_content1">Kelompok </td>
        <td>
        <select name="kelompok" class="cmbfrm" id="kelompok" style="width:188px;" onChange="change()"  >
        <option value="-1">(Semua Kelompok)</option>
        <?
           $sql = "SELECT k.replid,kelompok FROM kelompokcalonsiswa k, prosespenerimaansiswa p  WHERE k.idproses = p.replid AND p.aktif = 1 AND p.departemen = '$departemen' ORDER BY kelompok";
			
            $result=QueryDb($sql);
			
            while ($row=@mysql_fetch_array($result)){
        ?> 
            <option value="<?=$row['replid']?>" <?=IntIsSelected($row['replid'], $kelompok)?>><?=$row['kelompok']?></option>
        <? 	} ?> 
        </select>
        <span class="news_content1">Status </span>
        <select name="lunas" class="cmbfrm" id="lunas" style="width:130px" onchange="change_status()" >
            <option value="-1" <?=IntIsSelected(-1, $statuslunas) ?> >(Semua)</option>
            <option value="0" <?=IntIsSelected(0, $statuslunas) ?> >Belum Lunas</option>
            <option value="1" <?=IntIsSelected(1, $statuslunas) ?> >Lunas</option>
            <option value="2" <?=IntIsSelected(2, $statuslunas) ?> >Gratis</option>
        </select>    	</td>
    </tr>
    <tr>
        <td class="news_content1">Pembayaran </td>
        <td> 
        <select name="idkategori" class="cmbfrm" id="idkategori" style="width:188px;" onchange="change_kate()" >
        <?  $sql = "SELECT kode, kategori FROM $db_name_fina.kategoripenerimaan WHERE kode IN ('CSWJB','CSSKR') ORDER BY urutan";
            $result = QueryDb($sql);
            while ($row = mysql_fetch_array($result)) {
                if ($idkategori == "")
                    $idkategori = $row['kode']  ?>
                <option value="<?=$row['kode'] ?>" <?=StringIsSelected($idkategori, $row['kode']) ?> > <?=$row['kategori'] ?></option>
        <? } ?>
        </select>       
        <select name="idpenerimaan" class="cmbfrm" id="idpenerimaan" style="width:175px;" onchange="change_penerimaan()" >
        <?  $sql = "SELECT replid, nama FROM $db_name_fina.datapenerimaan WHERE aktif = 1 AND idkategori = '$idkategori' AND departemen = '$departemen' ORDER BY replid DESC";
            $result = QueryDb($sql);
            while ($row = mysql_fetch_array($result)) {
                if ($idpenerimaan == 0) 
                    $idpenerimaan = $row['replid'];  ?>
                <option value="<?=$row['replid'] ?>" <?=IntIsSelected($row['replid'], $idpenerimaan) ?> > <?=$row['nama'] ?></option>
        <? } ?>
        </select>&nbsp;        </td>
    </tr>
    </table>
	</td>
 	<td width="*" rowspan="2" valign="middle">
    	<a href="#" onclick="show_pembayaran()"><img src="../img/view.png" border="0" height="48" width="48" onmouseover="showhint('Klik untuk menampilkan data laporan pembayaran per kelas!', this, event, '180px')"/></a>    </td>
	<td width="45%" colspan="3" align="right" valign="top">
<font size="4" face="Verdana, Arial, Helvetica, sans-serif" style="background-color:#ffcc66">&nbsp;</font>&nbsp;<font color="Gray" size="4" face="Verdana, Arial, Helvetica, sans-serif" class="news_title2">Laporan Pembayaran Per Kelompok Calon Siswa</font>    </td>
</tr>
<tr>	
    <td align="right" valign="top">
   	</td>
</tr>
</table>
<div id="contentarea">
<? 
if (isset($_REQUEST[showpembayaran]))
{
	if ($_REQUEST[kat]=="jtt")
	{
		$sql = "SELECT replid FROM jbsfina.tahunbuku WHERE departemen='$departemen' AND aktif=1";
		$idtahunbuku = FetchSingle($sql);
		
		// Dapatkan banyaknya pembayaran yang telah terjadi untuk pembayaran terpilih di kelas terpilih
		if ($statuslunas == -1)
			if ($kelompok == -1)
				$sql = "SELECT MAX(jumlah) 
						  FROM ((SELECT c.replid, count(p.replid) as jumlah 
								   FROM jbsfina.penerimaanjttcalon p, jbsfina.besarjttcalon b, jbsakad.calonsiswa c 
								  WHERE p.idbesarjttcalon = b.replid AND b.idcalon = c.replid AND b.info2='$idtahunbuku'
								    AND b.idpenerimaan = $idpenerimaan GROUP BY c.replid) AS x);";
			else
				$sql = "SELECT MAX(jumlah) 
						  FROM ((SELECT c.replid, count(p.replid) as jumlah 
								   FROM jbsfina.penerimaanjttcalon p, jbsfina.besarjttcalon b, jbsakad.calonsiswa c 
								  WHERE p.idbesarjttcalon = b.replid AND b.idcalon = c.replid AND b.info2='$idtahunbuku'
								    AND c.idkelompok = $kelompok AND b.idpenerimaan = $idpenerimaan GROUP BY c.replid) AS x);";
		else
			if ($kelompok == -1)
				$sql = "SELECT MAX(jumlah) 
						  FROM ((SELECT c.replid, count(p.replid) as jumlah 
								   FROM jbsfina.penerimaanjttcalon p, jbsfina.besarjttcalon b, jbsakad.calonsiswa c 
								  WHERE p.idbesarjttcalon = b.replid AND b.idcalon = c.replid AND b.info2='$idtahunbuku' 
								    AND b.idpenerimaan = $idpenerimaan AND b.lunas = $statuslunas GROUP BY c.replid) AS x);";
			else
				$sql = "SELECT MAX(jumlah) 
						  FROM ((SELECT c.replid, count(p.replid) as jumlah 
								   FROM jbsfina.penerimaanjttcalon p, jbsfina.besarjttcalon b, jbsakad.calonsiswa c 
								  WHERE p.idbesarjttcalon = b.replid AND b.idcalon = c.replid AND b.info2='$idtahunbuku' 
								    AND c.idkelompok = $kelompok AND b.idpenerimaan = $idpenerimaan AND b.lunas = $statuslunas GROUP BY c.replid) AS x);";
		
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$max_n_cicilan = $row[0];
		$table_width = 810 + $max_n_cicilan * 90;
		
		//Dapatkan namapenerimaan
		$sql = "SELECT d.nama, d.departemen FROM jbsfina.datapenerimaan d WHERE d.replid=$idpenerimaan";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$namapenerimaan = $row[0];
		$departemen = $row[1];
		
		$sql = "SELECT kelompok FROM jbsakad.kelompokcalonsiswa WHERE replid=$kelompok";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$namakelompok = $row[0];
		
		?>
		
		<table border="0" width="100%" align="center" background="" style="background-repeat:no-repeat; background-attachment:fixed">
		<!-- TABLE CENTER -->
		<tr>
			<td>
		<? if ($max_n_cicilan > 0 || $statuslunas == 2) { ?>
			
			<table width="100%" border="0" align="center">
			<tr>
				<td valign="bottom" align="right">
			<!--<a href="#" onClick="refresh()"><img src="images/ico/refresh.png" border="0" onMouseOver="showhint('Refresh!', this, event, '50px')"/>&nbsp;Refresh</a>&nbsp;-->
			<a href="JavaScript:cetak()"><img src="../img/print.png" border="0" onMouseOver="showhint('Cetak!', this, event, '50px')"/>&nbsp;Cetak</a>&nbsp;				</td>
			</tr>
			</table>
			<br />
			<table class="tab" id="table" border="1" cellpadding="5" style="border-collapse:collapse" cellspacing="0" width="<?=$table_width?>" align="left" bordercolor="#000000">
				<tr height="30" align="center" class="header">
				<td width="30">No</td>
				<td width="90">No. Reg</td>
				<td width="140">Nama</td>
				<td width="65">Kel</td>
				<? 	for($i = 0; $i < $max_n_cicilan; $i++) { 
						$n = $i + 1; ?>
						<td width="120" ><?="Bayaran-$n" ?></td>	
				<?  } ?>
				<td width="95">Status </td>
				<td width="125"><?=$namapenerimaan ?></td>
				<td width="125">Total Pembayaran</td>
				<td width="125">Total Tunggakan</td>
				<td width="200">Keterangan</td>
			</tr>
		
		<?
		if ($statuslunas == -1) 
		{
			if ($kelompok == -1) 
			{
				$sql_tot = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
							  FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, jbsfina.besarjttcalon b 
							 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku' AND c.idkelompok = k.replid 
							 ORDER BY c.nama";
				
				$sql = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
						  FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, jbsfina.besarjttcalon b 
						 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
						   AND c.idkelompok = k.replid ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
			} 
			else 
			{
				$sql_tot = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
							  FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, jbsfina.besarjttcalon b 
							 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
							   AND c.idkelompok = $kelompok AND c.idkelompok = k.replid ORDER BY c.nama";
				
				$sql = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
						  FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, jbsfina.besarjttcalon b 
						 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku' 
						   AND c.idkelompok = $kelompok AND c.idkelompok = k.replid ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
			}
		} 
		else 
		{
			if ($kelompok == -1) 
			{
				$sql_tot = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
							  FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, jbsfina.besarjttcalon b 
							 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
							   AND c.idkelompok = k.replid AND b.lunas = $statuslunas";
			
				$sql = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
						  FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, jbsfina.besarjttcalon b
						 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku' 
						   AND c.idkelompok = k.replid AND b.lunas = $statuslunas ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
			} 
			else 
			{
				$sql_tot = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas
							  FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, jbsfina.besarjttcalon b
							 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
							   AND c.idkelompok = $kelompok AND c.idkelompok = k.replid AND b.lunas = $statuslunas"; 
				
				$sql = "SELECT c.nopendaftaran, c.nama, k.kelompok, b.replid AS id, b.besar, b.keterangan, b.lunas 
						  FROM jbsakad.calonsiswa c, jbsakad.kelompokcalonsiswa k, jbsfina.besarjttcalon b 
						 WHERE c.replid = b.idcalon AND b.idpenerimaan = $idpenerimaan AND b.info2='$idtahunbuku'
					 	   AND c.idkelompok = $kelompok AND c.idkelompok = k.replid AND b.lunas = $statuslunas ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
			}
		}
		
		$result_tot = QueryDb($sql_tot);
		$total=ceil(mysql_num_rows($result_tot)/(int)$varbaris);
		$jumlah = mysql_num_rows($result_tot);
		$akhir = ceil($jumlah/5)*5;
		
		$result = QueryDb($sql);
		if ($page==0)
			$cnt = 0;
		else 
			$cnt = (int)$page*(int)$varbaris;
		$totalbiayaall = 0;
		$totalbayarall = 0;
		
		while ($rowall = mysql_fetch_array($result_tot)) {
			$totalbesarjtt += $rowall['besar'];
			$sqlall2 = "SELECT jumlah FROM jbsfina.penerimaanjttcalon WHERE idbesarjttcalon = $rowall[id] ORDER BY tanggal";
			$resall2 = QueryDb($sqlall2);
			while ($rowall2 = mysql_fetch_row($resall2)) {
				$totalbiayaall2 += $rowall2[0];
			}
		}

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
				<td align="center"><?=$row['nopendaftaran'] ?></td>
				<td><?=$row['nama'] ?></td>
				<td align="center"><?=$row['kelompok'] ?></td>
			<?
			$sql = "SELECT count(*) FROM jbsfina.penerimaanjttcalon WHERE idbesarjttcalon = $idbesarjtt";
			$result2 = QueryDb($sql);
			$row2 = mysql_fetch_row($result2);
			$nbayar = $row2[0];
			$nblank = $max_n_cicilan - $nbayar;
			$totalbayar = 0;
			
			if ($nbayar > 0) {
				$sql = "SELECT date_format(tanggal, '%d-%b-%y'), jumlah FROM jbsfina.penerimaanjttcalon WHERE idbesarjttcalon = $idbesarjtt ORDER BY tanggal";
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
				<td><?=$ketjtt ?></td>
			</tr>
		<?
		}
		?>
			<input type="hidden" name="tes" id="tes" value="<?=$total?>"/>
			<? if ($page==$total-1){ ?>
			<tr height="40">
				<td align="center" colspan="<?=5 + $max_n_cicilan ?>" bgcolor="#999900"><font color="#FFFFFF"><strong>T O T A L</strong></font></td>
				<td align="right" bgcolor="#999900"><font color="#FFFFFF"><strong><?=FormatRupiah($totalbesarjtt) ?></strong></font></td>
				<td align="right" bgcolor="#999900"><font color="#FFFFFF"><strong><?=FormatRupiah($totalbiayaall2) ?></strong></font></td>
				<td align="right" bgcolor="#999900"><font color="#FFFFFF"><strong><?=FormatRupiah($totalbesarjtt - $totalbiayaall2) ?></strong></font></td>
				<td bgcolor="#999900">&nbsp;</td>
			</tr>
			<? } ?>
			</table>
			<script language='JavaScript'>
				Tables('table', 1, 0);
			</script>
			<? CloseDb() ?>
			<?	if ($page==0){ 
				$disback="style='visibility:hidden;'";
				$disnext="style='visibility:visible;'";
				}
				if ($page<$total && $page>0){
				$disback="style='visibility:visible;'";
				$disnext="style='visibility:visible;'";
				}
				if ($page==$total-1 && $page>0){
				$disback="style='visibility:visible;'";
				$disnext="style='visibility:hidden;'";
				}
				if ($page==$total-1 && $page==0){
				$disback="style='visibility:hidden;'";
				$disnext="style='visibility:hidden;'";
				}
			?>
			</td>
		</tr> 
		<tr>
			<td>
			<table border="0"width="100%" align="center"cellpadding="0" cellspacing="0">	
			<tr>
				<td width="30%" align="left" class="news_content1">Halaman
				<select name="page" class="cmbfrm" id="page" onChange="change_page('XX')">
				<?	for ($m=0; $m<$total; $m++) {?>
					 <option value="<?=$m ?>" <?=IntIsSelected($page,$m) ?>><?=$m+1 ?></option>
				<? } ?>
				</select>
				dari <?=$total?> halaman
				
				<? 
			 // Navigasi halaman berikutnya dan sebelumnya
				?>			  </td>
				<td align="center">
			</td>
			</tr>
			</table>
		<? } else { ?>
		<table width="100%" border="0" align="center">          
		<tr>
			<td align="center" valign="middle" height="200">
				<font color ="red" size = "2" class="err"><b>Tidak ditemukan adanya data.</b></font>			
            </td>
		</tr>
		</table>  
		
		<? } ?>
			</td>
		</tr>
		</table>
		<?
	} 
	else 
	{
	//DISINI /u skr=====================================================================================================
		$sql = "SELECT replid FROM jbsfina.tahunbuku WHERE departemen='$departemen' AND aktif=1";
		$idtahunbuku = FetchSingle($sql);

		if ($kelompok == -1)
			$sql = "SELECT max(jml) FROM ((SELECT s.replid, COUNT(p.replid) as jml 
											 FROM jbsfina.penerimaaniurancalon p, jbsfina.jurnal j, jbsakad.calonsiswa s 
											WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
											  AND p.idcalon = s.replid AND p.idpenerimaan = $idpenerimaan GROUP BY s.replid) as X)";
		else
			$sql = "SELECT max(jml) FROM ((SELECT s.replid, COUNT(p.replid) as jml 
											 FROM jbsfina.penerimaaniurancalon p, jbsfina.jurnal j, jbsakad.calonsiswa s 
											WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
											  AND p.idcalon = s.replid AND s.idkelompok = $kelompok AND p.idpenerimaan = $idpenerimaan GROUP BY s.replid) as X)";
		
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$max_n_bayar = $row[0];
		$table_width = 520 + $max_n_bayar * 100;
		
		//Dapatkan namapenerimaan
		$sql = "SELECT d.nama, d.departemen FROM jbsfina.datapenerimaan d WHERE d.replid=$idpenerimaan";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$namapenerimaan = $row[0];
		$departemen = $row[1];
		
		$sql = "SELECT kelompok FROM jbsakad.kelompokcalonsiswa WHERE replid=$kelompok";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$namakelompok = $row[0];
		?>
		
		<table border="0" width="100%" align="center" background="" style="background-repeat:no-repeat; background-attachment:fixed">
		<!-- TABLE CENTER -->
		<tr>
			<td>
		<? if ($max_n_bayar > 0) { ?>
			<table width="100%" border="0" align="center">
			<tr>
				<td align="right">
				<!--<a href="#" onClick="refresh()"><img src="images/ico/refresh.png" border="0" onMouseOver="showhint('Refresh!', this, event, '50px')"/>&nbsp;Refresh</a>&nbsp;-->
				<a href="JavaScript:cetak()"><img src="../img/print.png" border="0" onMouseOver="showhint('Cetak!', this, event, '50px')"/>&nbsp;Cetak</a>&nbsp;				</td>
			</tr>
			</table>
			<br />
			<table class="tab" id="table" border="1" cellpadding="5" style="border-collapse:collapse" cellspacing="0" width="<?=$table_width ?>" align="left" bordercolor="#000000">
			<tr height="30" align="center">
				<td class="header" width="30">No</td>
				<td class="header" width="90">No. Reg </td>
				<td class="header" width="160">Nama </td>
				<td class="header" width="75">Kel </td>
			<?	for($i = 0; $i < $max_n_bayar; $i++) { ?>
				<td class="header" width="125">Bayaran-<?=$i + 1 ?></td>
			<?  } ?>
				<td class="header" width="125">Total Pembayaran</td>
				<!--<td class="header" width="200">Keterangan</td>-->
			</tr>
		<?
		
		if ($kelompok == -1) 
		{
			$sql_tot = "SELECT DISTINCT s.replid, s.nopendaftaran, s.nama, k.kelompok 
						  FROM jbsfina.penerimaaniurancalon p, jbsfina.jurnal j, jbsakad.calonsiswa s, jbsakad.kelompokcalonsiswa k 
						 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
						   AND p.idcalon = s.replid AND s.idkelompok = k.replid AND p.idpenerimaan = $idpenerimaan ORDER BY s.nama";
			
			$sql = "SELECT DISTINCT s.replid, s.nopendaftaran, s.nama, k.kelompok 
					  FROM jbsfina.penerimaaniurancalon p, jbsfina.jurnal j, jbsakad.calonsiswa s, jbsakad.kelompokcalonsiswa k 
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
					   AND p.idcalon = s.replid AND s.idkelompok = k.replid AND p.idpenerimaan = $idpenerimaan 
				  ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
		} 
		else 
		{
			$sql_tot = "SELECT DISTINCT s.replid, s.nopendaftaran, s.nama, k.kelompok 
						  FROM jbsfina.penerimaaniurancalon p, jbsfina.jurnal j, jbsakad.calonsiswa s, jbsakad.kelompokcalonsiswa k 
						 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku
						   AND p.idcalon = s.replid AND s.idkelompok = k.replid AND s.idkelompok = $kelompok AND p.idpenerimaan = $idpenerimaan ORDER BY s.nama";
			
			$sql = "SELECT DISTINCT s.replid, s.nopendaftaran, s.nama, k.kelompok 
					  FROM jbsfina.penerimaaniurancalon p, jbsfina.jurnal j, jbsakad.calonsiswa s, jbsakad.kelompokcalonsiswa k 
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku
					   AND p.idcalon = s.replid AND s.idkelompok = k.replid AND s.idkelompok = $kelompok AND p.idpenerimaan = $idpenerimaan 
				  ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
		}
		
		$result_tot = QueryDb($sql_tot);
		$total=ceil(mysql_num_rows($result_tot)/(int)$varbaris);
		$jumlah = mysql_num_rows($result_tot);
		$akhir = ceil($jumlah/5)*5;
		
		$totalall2 = 0;
		while ($rowall = mysql_fetch_array($result_tot)) {
			$sqlall2 = "SELECT jumlah 
					      FROM jbsfina.penerimaaniurancalon p, jbsfina.jurnal j 
						 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku
						   AND idcalon = $rowall[replid] AND idpenerimaan = $idpenerimaan";
			$resall2 = QueryDb($sqlall2);
			while ($rowall2 = mysql_fetch_row($resall2)) {
				$totalall2 += $rowall2[0]; 
			}
		}
		$result = QueryDb($sql);
		if ($page==0)
			$cnt = 0;
		else 
			$cnt = (int)$page*(int)$varbaris;
		$totalall = 0;
		while ($row = mysql_fetch_array($result)) { 
			$replid = $row['replid'];
		?>
			
			<tr height="40">
				<td align="center"><?=++$cnt ?></td>
				<td align="center"><?=$row['nopendaftaran'] ?></td>
				<td align="left"><?=$row['nama'] ?></td>
				<td align="center"><?=$row['kelompok'] ?></td>
		<?		$sql = "SELECT date_format(p.tanggal, '%d-%b-%y') as tanggal, jumlah 
						  FROM jbsfina.penerimaaniurancalon p, jbsfina.jurnal j
						 WHERE p.idjurnal = j.replid AND j.idtahunbuku = $idtahunbuku 
						   AND idcalon = $replid AND idpenerimaan = $idpenerimaan";
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
						<table border="1" width="100%" style="border-collapse:collapse" bordercolor="#000000" cellpadding="0" cellspacing="0">
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
			<? if ($page==$total-1){ ?>
			<tr height="30">
				<td bgcolor="#999900" align="center" colspan="<?=4 + $max_n_bayar ?>"><font color="#FFFFFF"><strong>T O T A L</strong></font></td>
				<td bgcolor="#999900" align="right"><font color="#FFFFFF"><strong><?=FormatRupiah($totalall2) ?></strong></font></td>
				<!--<td bgcolor="#999900">&nbsp;</td>-->
			</tr>
			<? } ?>
			</table>
			<?
			CloseDb();
			?>
			<script language='JavaScript'>
				Tables('table', 1, 0);
			</script>
			 <?	if ($page==0){ 
				$disback="style='visibility:hidden;'";
				$disnext="style='visibility:visible;'";
				}
				if ($page<$total && $page>0){
				$disback="style='visibility:visible;'";
				$disnext="style='visibility:visible;'";
				}
				if ($page==$total-1 && $page>0){
				$disback="style='visibility:visible;'";
				$disnext="style='visibility:hidden;'";
				}
				if ($page==$total-1 && $page==0){
				$disback="style='visibility:hidden;'";
				$disnext="style='visibility:hidden;'";
				}
			?>
			</td>
		</tr> 
		<tr>
			<td>
			<table border="0"width="100%" align="center"cellpadding="0" cellspacing="0">	
			<tr>
				<td width="30%" align="left" class="news_content1">Halaman
				<select name="page" class="cmbfrm" id="page" onChange="change_page('XX')">
				<?	for ($m=0; $m<$total; $m++) {?>
				  <option value="<?=$m ?>" <?=IntIsSelected($page,$m) ?>><?=$m+1 ?></option>
				<? } ?>
				</select>
				dari <?=$total?> halaman
				
				<? 
			 // Navigasi halaman berikutnya dan sebelumnya
				?>			  </td>
				<td align="center">
			</td>
			</tr>
			</table>
		<? } else { ?>
		<table width="100%" border="0" align="center">          
		<tr>
			<td align="center" valign="middle" height="250">
				<font color ="red" size = "2" class="err"><b>Tidak ditemukan adanya data.
				<br />
				Tambah data pembayaran pada departemen <?=$departemen?> <? if ($namakelompok) echo ", kelompok ".$namakelompok ?> dan kategori <?=$namapenerimaan?> di menu Penerimaan Pembayaran pada bagian Penerimaan.
			  </b></font>			</td>
		</tr>
		</table>  
		
		<? } ?>
			</td>
		</tr>
		</table> 
		<?
	//
	}
}
?>
</div>
<? CloseDb() ?>
</body>
</html>