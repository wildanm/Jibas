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

$idkategori = "";
if (isset($_REQUEST['idkategori']))
	$idkategori = $_REQUEST['idkategori'];

$idpenerimaan = 0;
if (isset($_REQUEST['idpenerimaan']))
	$idpenerimaan = (int)$_REQUEST['idpenerimaan'];

$departemen = "";
if (isset($_REQUEST['departemen']))
	$departemen = $_REQUEST['departemen'];
	
$idangkatan = 0;
if (isset($_REQUEST['idangkatan']))
	$idangkatan = (int)$_REQUEST['idangkatan'];
	
$idtingkat = -1;
if (isset($_REQUEST['idtingkat']))
	$idtingkat = (int)$_REQUEST['idtingkat'];

$idkelas = -1;
if (isset($_REQUEST['idkelas']))
	$idkelas = (int)$_REQUEST['idkelas'];

$statuslunas = -1;
if (isset($_REQUEST['lunas']))
	$statuslunas = (int)$_REQUEST['lunas'];

$varbaris=10;
if (isset($_REQUEST['varbaris']))
	$varbaris = $_REQUEST['varbaris'];

$page=0;
if (isset($_REQUEST['page']))
	$page = $_REQUEST['page'];
	
$hal=0;
if (isset($_REQUEST['hal']))
	$hal = $_REQUEST['hal'];

$kat="";
if (isset($_REQUEST['kat']))
	$kat = $_REQUEST['kat'];

$urut = "nama";	
if (isset($_REQUEST['urut']))
	$urut = $_REQUEST['urut'];	

$urutan = "ASC";	
if (isset($_REQUEST['urutan']))
	$urutan = $_REQUEST['urutan'];

$dis = "";
if ($idtingkat == -1)
	$dis = "disabled";

$dis1 = "";	
if ($idkategori == "SKR")
	$dis1 = "disabled";


OpenDb();

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" src="../script/tools.js"></script>
<script language="javascript" src="../script/tables.js"></script>
<script language="javascript">
function change_kate() {
	var idkategori = document.getElementById('idkategori').value;
	var dep = document.getElementById('departemen').value;
	var idang = document.getElementById('idangkatan').value;
	var idtingkat = document.getElementById('idtingkat').value;
	var idkel = document.getElementById('idkelas').value;
	var lunas = document.getElementById('lunas').value;
	
	document.location.href = "lapbayarsiswa_kelas.php?idkategori="+idkategori+"&departemen="+dep+"&idangkatan="+idang+"&idkelas="+idkel+"&lunas="+lunas+"&idtingkat="+idtingkat;
	
	//parent.content.location.href = "lapbayarsiswa_kelas_blank.php";
}

function change_dep() {
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var dep = document.getElementById('departemen').value;
	var lunas = document.getElementById('lunas').value;
	
	document.location.href = "lapbayarsiswa_kelas.php?idkategori="+idkategori+"&idpenerimaan="+idpenerimaan+"&departemen="+dep+"&lunas="+lunas;
	
	//parent.content.location.href = "lapbayarsiswa_kelas_blank.php";
}

function change_ang() {
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var dep = document.getElementById('departemen').value;
	var idtingkat = document.getElementById('idtingkat').value;
	var idang = document.getElementById('idangkatan').value;
	var lunas = document.getElementById('lunas').value;
	
	
	document.location.href = "lapbayarsiswa_kelas.php?idkategori="+idkategori+"&idpenerimaan="+idpenerimaan+"&departemen="+dep+"&idangkatan="+idang+"&lunas="+lunas+"&idtingkat="+idtingkat;
	
	//parent.content.location.href = "lapbayarsiswa_kelas_blank.php";
}

function change_penerimaan() {
	//parent.content.location.href = "lapbayarsiswa_kelas_blank.php";
}

function change_kelas() {
	//parent.content.location.href = "lapbayarsiswa_kelas_blank.php";
}

function change_status() {
	//parent.content.location.href = "lapbayarsiswa_kelas_blank.php";
}

function show_pembayaran() {
	var dep = document.getElementById('departemen').value;
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var idangkatan = document.getElementById('idangkatan').value;
	var idtingkat = document.getElementById('idtingkat').value;
	var idkelas = document.getElementById('idkelas').value;
	var lunas = document.getElementById('lunas').value;
	
	if (idangkatan.length == 0) {	
		alert ('Pastikan angkatan sudah ada!');	
		document.getElementById('idangkatan').focus();
		return false;		
	} else if (idkategori.length == 0) {
		alert ('Pastikan kategori pembayaran sudah ada!');
		document.getElementById('idkategori').focus();
		return false;	
	} else if (idpenerimaan.length == 0) {
		alert ('Pastikan penerimaan pembayaran sudah ada!');
		document.getElementById('idpenerimaan').focus();
		return false;	
	}
		
	if (idkategori == 'JTT')
		document.location.href = "lapbayarsiswa_kelas.php?idpenerimaan="+idpenerimaan+"&idkelas="+idkelas+"&idangkatan="+idangkatan+"&lunas="+lunas+"&idkategori="+idkategori+"&idtingkat="+idtingkat+"&showpembayaran=true&kat=jtt&departemen="+dep;
		//parent.content.location.href = "lapbayarsiswa_kelas_jtt.php?idpenerimaan="+idpenerimaan+"&idkelas="+idkelas+"&idangkatan="+idangkatan+"&lunas="+lunas+"&idtingkat="+idtingkat;
	else 
		//parent.content.location.href = "lapbayarsiswa_kelas_skr.php?idpenerimaan="+idpenerimaan+"&idkelas="+idkelas+"&idangkatan="+idangkatan+"&idtingkat="+idtingkat;
		document.location.href = "lapbayarsiswa_kelas.php?idpenerimaan="+idpenerimaan+"&idkelas="+idkelas+"&idangkatan="+idangkatan+"&lunas="+lunas+"&idkategori="+idkategori+"&idtingkat="+idtingkat+"&showpembayaran=true&kat=skr&departemen="+dep;
	
		
}
function change_page(page) {
	var dep = document.getElementById('departemen').value;
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var idangkatan = document.getElementById('idangkatan').value;
	var idtingkat = document.getElementById('idtingkat').value;
	var idkelas = document.getElementById('idkelas').value;
	var lunas = document.getElementById('lunas').value;
	if (page=="XX")
		page = document.getElementById("page").value;
	if (idkategori == 'JTT')
		var kat = "jtt";
	else  	
		var kat = "skr";
	//alert (kat);
	document.location.href="lapbayarsiswa_kelas.php?idkelas="+idkelas+"&idangkatan="+idangkatan+"&idpenerimaan="+idpenerimaan+"&lunas="+lunas+"&idtingkat="+idtingkat+"&page="+page+"&showpembayaran=true&kat="+kat+"&departemen="+dep+"&idkategori="+idkategori;
}
function refresh(){
	var dep = document.getElementById('departemen').value;
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var idangkatan = document.getElementById('idangkatan').value;
	var idtingkat = document.getElementById('idtingkat').value;
	var idkelas = document.getElementById('idkelas').value;
	var lunas = document.getElementById('lunas').value;
	var page = document.getElementById("page").value;
	var kat;
	if (idkategori == 'JTT')
		kat = "jtt";
	else  	
		kat = "skr";
	document.location.href="lapbayarsiswa_kelas.php?idkelas="+idkelas+"&idangkatan="+idangkatan+"&idpenerimaan="+idpenerimaan+"&lunas="+lunas+"&idtingkat="+idtingkat+"&page="+page+"&showpembayaran=true&kat="+kat+"&departemen="+dep+"&idkategori="+idkategori;
}
function focusNext(elemName, evt) {
	evt = (evt) ? evt : event;
	var charCode = (evt.charCode) ? evt.charCode :
		((evt.which) ? evt.which : evt.keyCode);
	if (charCode == 13) {
		if (elemName == "tampil") 
			show_pembayaran();
		else 
			document.getElementById(elemName).focus();
		return false;
	}
	return true;
}
function cetak(){
	var dep = document.getElementById('departemen').value;
	var idkategori = document.getElementById('idkategori').value;
	var idpenerimaan = document.getElementById('idpenerimaan').value;
	var idangkatan = document.getElementById('idangkatan').value;
	var idtingkat = document.getElementById('idtingkat').value;
	var idkelas = document.getElementById('idkelas').value;
	var lunas = document.getElementById('lunas').value;

	if (idkategori == 'JTT')
		var addr = "lapbayarsiswa_kelas_jtt_cetak.php?idpenerimaan="+idpenerimaan+"&idkelas="+idkelas+"&idangkatan="+idangkatan+"&lunas="+lunas+"&idkategori="+idkategori+"&idtingkat="+idtingkat+"&departemen="+dep;
		//parent.content.location.href = "lapbayarsiswa_kelas_jtt.php?idpenerimaan="+idpenerimaan+"&idkelas="+idkelas+"&idangkatan="+idangkatan+"&lunas="+lunas+"&idtingkat="+idtingkat;
	else 
		//parent.content.location.href = "lapbayarsiswa_kelas_skr.php?idpenerimaan="+idpenerimaan+"&idkelas="+idkelas+"&idangkatan="+idangkatan+"&idtingkat="+idtingkat;
		var addr = "lapbayarsiswa_kelas_skr_cetak.php?idpenerimaan="+idpenerimaan+"&idkelas="+idkelas+"&idangkatan="+idangkatan+"&lunas="+lunas+"&idkategori="+idkategori+"&idtingkat="+idtingkat+"&departemen="+dep;
	
	newWindow(addr, 'CetakLapBayarSiswaKelas','800','650','resizable=1,scrollbars=1,status=0,toolbar=0');	
	
}
</script>
</head>

<body topmargin="0" leftmargin="0" onload="document.getElementById('departemen').focus()">
<table border="0" width="100%" cellpadding="0" cellspacing="0">
<!-- TABLE TITLE -->
<tr>
    <td rowspan="3" width="52%">
    <table width = "100%" border = "0">
	<tr>
        <td width="18%" class="news_content1">Departemen </td>
        <td>
    	<select name="departemen" class="cmbfrm" id="departemen" style="width:188px" onchange="change_dep()" onKeyPress="return focusNext('idangkatan', event)">
   		<? 	$sql = "SELECT departemen FROM departemen WHERE aktif = 1 ORDER BY urutan";
            $result = QueryDb($sql);
            while($row = mysql_fetch_row($result)) {
                if ($departemen == "")
                    $departemen = $row[0]; ?>
                <option value="<?=$row[0]?>" <?=StringIsSelected($row[0], $departemen)?> > <?=$row[0]?></option>
        <? } ?>
		</select>
        <span class="news_content1">Angkatan </span> </td>
        <td>
        <select name="idangkatan" class="cmbfrm" id="idangkatan" style="width:100px" onchange="change_ang()" onKeyPress="return focusNext('idtingkat', event)">
        <? 	$sql = "SELECT replid, angkatan FROM angkatan WHERE departemen = '$departemen' AND aktif = 1 ORDER BY angkatan";
            $result = QueryDb($sql);
            while($row = mysql_fetch_row($result)) {
                if ($idangkatan == 0)
                    $idangkatan = $row[0]; ?>
              <option value="<?=$row[0]?>" <?=IntIsSelected($row[0], $idangkatan)?> > <?=$row[1]?></option>
        <? } ?>
        </select>
        </td>
    </tr>
     <tr>
    	<td class="news_content1">Kelas </td>
        <td>
        <select name="idtingkat" class="cmbfrm" id="idtingkat" style="width:80px;" onChange="change_ang()" onkeypress="return focusNext('lunas', event)" >
        <option value="-1" <?=IntIsSelected(-1, $idtingkat)?>>(Semua)</option>
        <?
           
			$sql="SELECT * FROM tingkat WHERE departemen='$departemen' AND aktif = 1 ORDER BY urutan";
            $result=QueryDb($sql);
			
            while ($row=@mysql_fetch_array($result)){
				
        ?> 
            <option value="<?=$row['replid']?>" <?=IntIsSelected($row['replid'], $idtingkat)?>><?=$row['tingkat']?></option>
        <? 	} ?> 
        </select>
       
        <select name="idkelas" class="cmbfrm" id="idkelas" style="width:103px" onchange="change_kelas()" <?=$dis?> onkeypress="return focusNext('lunas', event)">
        <option value="-1">(Semua)</option>
		<?  $sql = "SELECT DISTINCT k.replid, k.kelas FROM tahunajaran t, kelas k WHERE t.replid = k.idtahunajaran AND k.aktif = 1 AND k.idtingkat = '$idtingkat' AND t.aktif = 1 ORDER BY k.kelas";
            $result = QueryDb($sql);
            while($row = mysql_fetch_row($result)) {
        ?>       
                <option value="<?=$row[0]?>" <?=IntIsSelected($row[0], $idkelas)?> > <?=$row[1]?></option>
        <? 	} ?>
        </select>
        <span class="news_content1">Status </span> </td>
        <td>
        <select name="lunas" class="cmbfrm" id="lunas" style="width:100px" onchange="change_status()" <?=$dis1?> onkeypress="return focusNext('idkategori', event)">
            <option value="-1" <?=IntIsSelected(-1, $statuslunas) ?> >(Semua)</option>
            <option value="0" <?=IntIsSelected(0, $statuslunas) ?> >Belum Lunas</option>
            <option value="1" <?=IntIsSelected(1, $statuslunas) ?> >Lunas</option>
            <option value="2" <?=IntIsSelected(2, $statuslunas) ?> >Gratis</option>
        </select>
        
    	</td>
    </tr>
    <tr>
        <td class="news_content1">Pembayaran </td>
        <td colspan="2"> 
        <select name="idkategori" class="cmbfrm" id="idkategori" style="width:188px;" onchange="change_kate()" onkeypress="return focusNext('idpenerimaan', event)">
        <?  $sql = "SELECT kode, kategori FROM $db_name_fina.kategoripenerimaan WHERE kode IN ('JTT','SKR') ORDER BY urutan";
            $result = QueryDb($sql);
            while ($row = mysql_fetch_array($result)) {
                if ($idkategori == "")
                    $idkategori = $row['kode']  ?>
              <option value="<?=$row['kode'] ?>" <?=StringIsSelected($idkategori, $row['kode']) ?> > <?=$row['kategori'] ?></option>
        <? } ?>
        </select>       
        <select name="idpenerimaan" class="cmbfrm" id="idpenerimaan" style="width:175px;" onchange="change_penerimaan()" onkeypress="return focusNext('tampil', event)">
        <?  $sql = "SELECT replid, nama FROM $db_name_fina.datapenerimaan WHERE aktif = 1 AND idkategori = '$idkategori' AND departemen = '$departemen' ORDER BY replid DESC";
            $result = QueryDb($sql);
            while ($row = mysql_fetch_array($result)) {
                if ($idpenerimaan == 0) 
                    $idpenerimaan = $row['replid'];  ?>
              <option value="<?=$row['replid'] ?>" <?=IntIsSelected($row['replid'], $idpenerimaan) ?> > <?=$row['nama'] ?></option>
        <? } ?>
        </select>
        &nbsp;        
        
        </td>
    </tr>
   
    </table>
	</td>
 	<td width="*" rowspan="2" valign="middle">
    	<a href="#" onclick="show_pembayaran()"><img src="../img/view.png" border="0" height="48" width="48" onmouseover="showhint('Klik untuk menampilkan data laporan pembayaran per kelas!', this, event, '180px')"/></a>    </td>
	<td width="45%" colspan="3" align="right" valign="top">
<font size="4" face="Verdana, Arial, Helvetica, sans-serif" style="background-color:#ffcc66">&nbsp;</font>&nbsp;<font color="Gray" size="4" face="Verdana, Arial, Helvetica, sans-serif" class="news_title2">Laporan Pembayaran Per Kelas</font>
	</td>
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
	OpenDb();
	
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
						 	 	   FROM jbsfina.penerimaanjtt p RIGHT JOIN jbsfina.besarjtt b ON p.idbesarjtt = b.replid, jbsakad.siswa s 
								  WHERE b.nis = s.nis AND s.idangkatan = '$idangkatan' AND b.idpenerimaan = '$idpenerimaan' 
									AND b.lunas = '$statuslunas' AND s.idkelas = '$idkelas' GROUP BY s.nis) AS x)";												
			}
		}
	}
	
	$result = QueryDb($sql);
	$row = mysql_fetch_row($result);
	$max_n_cicilan = $row[0];
	$ndata = $row[1];
	
	$siswajtt = $row[1];
	$table_width = 810 + $max_n_cicilan * 90;
	
	//Dapatkan namapenerimaan
	$sql = "SELECT d.nama, d.departemen FROM jbsfina.datapenerimaan d WHERE d.replid='$idpenerimaan'";
	$result = QueryDb($sql);
	$row = mysql_fetch_row($result);
	$namapenerimaan = $row[0];
	$departemen = $row[1];
	
	if ($idkelas <> -1 && $idtingkat <> -1) {
		$sql = "SELECT kelas FROM kelas WHERE replid='$idkelas'";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$namakelas = $row[0];
	} else {
		$sql = "SELECT tingkat FROM tingkat WHERE replid='$idtingkat'";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$namatingkat = $row[0];
	} 
	
	
	?>
	
	<table border="0" width="100%" align="center" background="" style="background-repeat:no-repeat; background-attachment:fixed">
	<!-- TABLE CENTER -->
	<tr>
		<td>
	<? if ($max_n_cicilan > 0 || $siswajtt > 0) { ?>
		<input type="hidden" name="total" id="total" value="<?=$total?>"/>
		<table width="100%" border="0" align="center">
		<tr>
			<td align="right" valign="bottom">
		<!--<a href="#" onClick="refresh()"><img src="../img/refresh.png" border="0" onMouseOver="showhint('Refresh!', this, event, '50px')"/>&nbsp;Refresh</a>&nbsp;&nbsp;-->
		<a href="JavaScript:cetak()"><img src="../img/print.png" border="0" onMouseOver="showhint('Cetak!', this, event, '50px')"/>&nbsp;Cetak</a>&nbsp;			</td>
		</tr>
		</table>
		<br />
		<table class="tab" id="table" border="1" cellpadding="5" style="border-collapse:collapse" cellspacing="0" width="<?=$table_width?>" align="left" bordercolor="#000000">
			<tr height="30" align="center" class="header">
			<td width="30">No</td>
			<td width="80">N I S </td>
			<td width="140">Nama </td>
			<td width="75">Kls </td>
			<? 	for($i = 0; $i < $max_n_cicilan; $i++) { 
					$n = $i + 1; ?>
					<td class="header" width="120" align="center"><?="Bayaran-$n" ?></td>	
			<?  } ?>
			<td width="90">Status  </td>
			<td width="125"><?=$namapenerimaan ?> </td>
			<td width="125">Total Pembayaran</td>
			<td width="125">Total Tunggakan</td>
			<td class="header" width="200">Keterangan</td>
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
				   ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
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
					  ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
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
					   ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
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
					ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
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
					   ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
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
					   ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
			}
		}
	}
	
	$result_tot = QueryDb($sql_tot);
	$total=ceil(mysql_num_rows($result_tot)/(int)$varbaris);
	$jumlah = mysql_num_rows($result_tot);
	$akhir = ceil($jumlah/5)*5;
	
	//$TotalBayarAll=0;
	while ($x=@mysql_fetch_row($result_tot)){
		$sql5 = "SELECT jumlah FROM $db_name_fina.penerimaanjtt WHERE idbesarjtt = '$x[4]' ORDER BY tanggal";
		$result5 = QueryDb($sql5);
		while ($row5 = @mysql_fetch_row($result5)) {
			$TotalBayarSemua+=$row5[0];
		}
		//echo "<br>".$TotalBayarAll;
		$TotalBesarJTT+=$x[5];
	}
	
	$result = QueryDb($sql);
	if ($page==0)
		$cnt = 0;
	else 
		$cnt = (int)$page*(int)$varbaris;
	
	//$totalbiayaall = 0;
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
			
	?>
		<tr height="40">
			<td align="center"><?=++$cnt ?></td>
			<td align="center" ><?=$row['nis'] ?></td>
			<td><?=$row['nama'] ?></td>
			<td align="center"><? if ($idkelas == -1) echo $row['tingkat']." - "; ?><?=$row['kelas'] ?> </td>
		<?
		$sql = "SELECT count(*) FROM $db_name_fina.penerimaanjtt WHERE idbesarjtt = '$idbesarjtt'";
		$result2 = QueryDb($sql);
		$row2 = mysql_fetch_row($result2);
		$nbayar = $row2[0];
		$nblank = $max_n_cicilan - $nbayar;
		$totalbayar = 0;
		
		if ($nbayar > 0) {
			$sql = "SELECT date_format(tanggal, '%d-%b-%y'), jumlah FROM $db_name_fina.penerimaanjtt WHERE idbesarjtt = '$idbesarjtt' ORDER BY tanggal";
			$result2 = QueryDb($sql);
			while ($row2 = mysql_fetch_row($result2)) {
				$totalbayar = $totalbayar + $row2[1]; ?>
				<td>
					<table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse " bordercolor="#000000">
					<tr height="20"><td align="center"><?=FormatRupiah($row2[1]) ?></td></tr>
					<tr height="20"><td align="center"><?=$row2[0] ?></td></tr>
					</table>
				</td>
	 <?		}
			$totalbayarall += $totalbayar;
			//echo "totalbayarall=".$totalbayarall;
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
	while ($row_tot = mysql_fetch_array($result_tot)) {
			$jum = $row_tot['jumlah'];
			if ($row_tot == NULL) $jum = 0;
			$totbiayaall += $row_tot['besar'];
			//$totalbayarall += $jum;
			//$sql4 = "SELECT date_format(tanggal, '%d-%b-%y'), jumlah FROM $db_name_fina.penerimaanjtt WHERE idbesarjtt = //$row_tot[id]";
			//echo $sql4;
			//$result4 = QueryDb($sql4);
			//$row4 = @mysql_fetch_array($result4);
			//$totalbayarall += $row4[jumlah];
	}
	if ($total-1 == $page) {
		//$totbiayaall = 0;
		//$totbayarall = 0;
		
		
	
	?>    
		<tr height="40">
			<td align="center" colspan="<?=5 + $max_n_cicilan ?>" bgcolor="#999900"><font color="#FFFFFF"><strong>T O T A L</strong></font></td>
			<td align="right" bgcolor="#999900"><font color="#FFFFFF"><strong><?=FormatRupiah($TotalBesarJTT) ?></strong></font></td>
			<td align="right" bgcolor="#999900"><font color="#FFFFFF"><strong><?=FormatRupiah($TotalBayarSemua) ?></strong></font></td>
			<td align="right" bgcolor="#999900"><font color="#FFFFFF"><strong><?=FormatRupiah($TotalBesarJTT - $TotalBayarSemua) ?></strong></font></td>
			<td bgcolor="#999900">&nbsp;</td>
		</tr>
	<? } ?>
		<input type="hidden" name="tes" id="tes" value="<?=$total?>"/>
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
			<td width="30%" align="left"><span class="news_content1">Halaman</span>
			<select name="page" class="cmbfrm" id="page" onChange="change_page('XX')">
			<?	for ($m=0; $m<$total; $m++) {?>
				 <option value="<?=$m ?>" <?=IntIsSelected($page,$m) ?>><?=$m+1 ?></option>
			<? } ?>
			</select>
			<span class="news_content1">dari 
			<?=$total?> 
			halaman
			
			<? 
		 // Navigasi halaman berikutnya dan sebelumnya
			?>
			</span> </td>
			<td align="center">
		<!--input <?=$disback?> type="button" class="cmbfrm2" name="back" value=" << " onClick="change_page('<?=(int)$page-1?>')" onMouseOver="showhint('Sebelumnya', this, event, '75px')">
			<?
			for($a=0;$a<$total;$a++){
                if ($page==$a){
                    echo "<font face='verdana' color='red' size='4'><strong>".($a+1)."</strong></font> "; 
                } else { 
                    echo "<a href='#' onClick=\"change_page('".$a."')\"><font face='verdana' color='green'>".($a+1)."</font></a> "; 
                }
                     
            }
			?>
			 <input <?=$disnext?> type="button" class="cmbfrm2" name="next" value=" >> " onClick="change_page('<?=(int)$page+1?>')" onMouseOver="showhint('Berikutnya', this, event, '75px')"-->
			</td>
			<td width="30%" align="right" class="news_content1"><!--Jumlah baris per halaman
			<select name="varbaris" class="cmbfrm" id="varbaris" onChange="change_baris()">
			<? 	for ($m=5; $m <= $akhir; $m=$m+5) { ?>
				<option value="<?=$m ?>" <?=IntIsSelected($varbaris,$m) ?>><?=$m ?></option>
			<? 	} ?>
			</select>--></td>
		</tr>
		</table>
	<? } else { ?>
	<table width="100%" border="0" align="center">          
	<tr>
		<td align="center" valign="middle" height="250">
			<font color ="red" size = "2" class="err"><b>Tidak ditemukan adanya data.
			<br />
			Tambah data pembayaran pada 
			<? 	if ($idtingkat <> -1) {	
					if ($idkelas <> -1) 
						echo "kelas ".$namakelas; 
					else 
							echo "tingkat ".$namatingkat;
				} else {
					echo "departemen ".$departemen;
				}	
			?> dan kategori <?=$namapenerimaan?> di menu Penerimaan Pembayaran pada bagian Penerimaan.
			
			</b></font>		</td>
	</tr>
	</table>  
	
	<? } ?>
		</td>
	</tr>
	</table>
	
	</form>
<?	} 
	elseif ($_REQUEST[kat]=="skr")
	{
		// DISINI BUAT SKR++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		OpenDb();
		
		$sql = "SELECT replid FROM jbsfina.tahunbuku WHERE departemen='$departemen' AND aktif=1";
		$idtahunbuku = FetchSingle($sql);
		
		if ($idtingkat == -1) 
		{
			$sql = "SELECT MAX(jml) FROM ((SELECT p.nis, COUNT(p.replid) as jml 
											 FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s
											WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku'
											  AND p.nis = s.nis AND s.idangkatan = '$idangkatan'
											  AND p.idpenerimaan = '$idpenerimaan' GROUP BY p.nis) as X)";
		} 
		else 
		{
			if ($idkelas == -1)
				$sql = "SELECT MAX(jml) FROM ((SELECT p.nis, COUNT(p.replid) as jml 
												 FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k 
												WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
												  AND p.nis = s.nis AND s.idangkatan = '$idangkatan' AND p.idpenerimaan = '$idpenerimaan' 
												  AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' GROUP BY p.nis) as X)";
			else
				$sql = "SELECT MAX(jml) FROM ((SELECT p.nis, COUNT(p.replid) as jml 
												 FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s 
												WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
												  AND p.nis = s.nis AND s.idkelas = '$idkelas' AND s.idangkatan = '$idangkatan' 
												  AND p.idpenerimaan = '$idpenerimaan' GROUP BY p.nis) as X)";
		}
		
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$max_n_bayar = $row[0];
		$table_width = 520 + $max_n_bayar * 100;
		
		$sql = "SELECT nama FROM jbsfina.datapenerimaan WHERE replid = '$idpenerimaan'";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$namapenerimaan = $row[0];	?>
	
	<table border="0" width="100%" align="center" background="" style="background-repeat:no-repeat; background-attachment:fixed">
	<!-- TABLE CENTER -->
	<tr>
		<td>
	<? if ($max_n_bayar > 0) { ?>
		<table width="100%" border="0" align="center">
		<tr>
			<td align="right">
			<!--<a href="#" onClick="refresh()"><img src="../img/refresh.png" border="0" onMouseOver="showhint('Refresh!', this, event, '50px')"/>&nbsp;Refresh</a>&nbsp;-->
			<a href="JavaScript:cetak()"><img src="../img/print.png" border="0" onMouseOver="showhint('Cetak!', this, event, '50px')"/>&nbsp;Cetak</a>&nbsp;			</td>
		</tr>
		</table>
		<br />
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
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
					   AND p.nis = s.nis AND s.idkelas = k.replid AND s.idangkatan = '$idangkatan' 
					   AND p.idpenerimaan = '$idpenerimaan' AND k.idtingkat = t.replid ORDER BY s.nama";
		
		$sql = "SELECT DISTINCT p.nis, s.nama, k.kelas, t.tingkat 
				  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
				 WHERE p.nis = s.nis AND s.idkelas = k.replid AND s.idangkatan = '$idangkatan' 
				   AND p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
				   AND p.idpenerimaan = '$idpenerimaan' AND k.idtingkat = t.replid 
			  ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
	} 
	else 
	{
		if ($idkelas == -1)
		{
			$sql_tot = "SELECT DISTINCT p.nis, s.nama, k.kelas, t.tingkat 
						  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
						 WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
						   AND p.nis = s.nis AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' 
						   AND s.idangkatan = '$idangkatan' AND p.idpenerimaan = '$idpenerimaan' AND k.idtingkat = t.replid ORDER BY s.nama";
			
			$sql = "SELECT DISTINCT p.nis, s.nama, k.kelas, t.tingkat 
					  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k, jbsakad.tingkat t 
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
					   AND p.nis = s.nis AND s.idkelas = k.replid AND k.idtingkat = '$idtingkat' AND s.idangkatan = '$idangkatan' 
					   AND p.idpenerimaan = '$idpenerimaan' AND k.idtingkat = t.replid ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
		} 
		else 
		{
			$sql_tot = "SELECT DISTINCT p.nis, s.nama, k.kelas 
						  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k 
						 WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
						   AND p.nis = s.nis AND s.idkelas = k.replid AND s.idkelas = '$idkelas' 
						   AND s.idangkatan = '$idangkatan' AND p.idpenerimaan = '$idpenerimaan' ORDER BY s.nama";
			
			$sql = "SELECT DISTINCT p.nis, s.nama, k.kelas 
					  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j, jbsakad.siswa s, jbsakad.kelas k 
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
					   AND p.nis = s.nis AND s.idkelas = k.replid AND s.idkelas = '$idkelas' 
					   AND s.idangkatan = '$idangkatan' AND p.idpenerimaan = '$idpenerimaan' ORDER BY $urut $urutan LIMIT ".(int)$page*(int)$varbaris.",$varbaris"; 
		}
	}
	
	$result_tot = QueryDb($sql_tot);
	$total=ceil(mysql_num_rows($result_tot)/(int)$varbaris);
	$jumlah = mysql_num_rows($result_tot);
	$akhir = ceil($jumlah/5)*5;
	
	$totalall = 0;
	while ($rowall = @mysql_fetch_array($result_tot)) 
	{
		$sqlall2 = "SELECT jumlah 
	          		  FROM jbsfina.penerimaaniuran p, jbsfina.jurnal j
			         WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
			          AND nis = '$rowall[nis]' AND idpenerimaan = '$idpenerimaan'";
			$resall2 = QueryDb($sqlall2);
			while ($rowall2 = @mysql_fetch_row($resall2)) 
			{
				$totalall += $rowall2[0];
			}
	}
	
	$result = QueryDb($sql);
	if ($page==0)
		$cnt = 0;
	else 
		$cnt = (int)$page*(int)$varbaris;
	
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
					 WHERE p.idjurnal = j.replid AND j.idtahunbuku = '$idtahunbuku' 
					   AND nis = '$nis' AND idpenerimaan = '$idpenerimaan'";
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
			//$totalall += $totalbayar;
	
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
		<? if ($page==$total-1){ ?>
		<tr height="30">
			<td bgcolor="#999900" align="center" colspan="<?=4 + $max_n_bayar ?>"><font color="#FFFFFF"><strong>T O T A L</strong></font></td>
			<td bgcolor="#999900" align="right"><font color="#FFFFFF"><strong><?=FormatRupiah($totalall) ?></strong></font></td>
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
			<td width="30%" align="left"><span class="news_content1">Halaman</span>
			<select name="page" class="cmbfrm" id="page" onChange="change_page('XX')">
			<?	for ($m=0; $m<$total; $m++) {?>
				 <option value="<?=$m ?>" <?=IntIsSelected($page,$m) ?>><?=$m+1 ?></option>
			<? } ?>
			</select>
			<span class="news_content1">dari 
			<?=$total?> 
			halaman
			
			<? 
		 // Navigasi halaman berikutnya dan sebelumnya
			?>
			</span> </td>
			<td align="center">
		<!--input <?=$disback?> type="button" class="cmbfrm2" name="back" value=" << " onClick="change_page('<?=(int)$page-1?>')" onMouseOver="showhint('Sebelumnya', this, event, '75px')">
			<?
			for($a=0;$a<$total;$a++){
				if ($page==$a){
					echo "<font face='verdana' color='red'><strong>".($a+1)."</strong></font> "; 
				} else { 
					echo "<a href='#' onClick=\"change_page('".$a."')\">".($a+1)."</a> "; 
				}
					 
			}
			?>
			 <input <?=$disnext?> type="button" class="cmbfrm2" name="next" value=" >> " onClick="change_page('<?=(int)$page+1?>')" onMouseOver="showhint('Berikutnya', this, event, '75px')"-->
			</td>
			<td width="30%" align="right"><!--Jumlah baris per halaman
			<select name="varbaris" id="varbaris" onChange="change_baris()">
			<? 	for ($m=5; $m <= $akhir; $m=$m+5) { ?>
				<option value="<?=$m ?>" <?=IntIsSelected($varbaris,$m) ?>><?=$m ?></option>
			<? 	} ?>
		   
			</select>--></td>
		</tr>
		</table>
	<? } else { ?>
	<table width="100%" border="0" align="center">          
	<tr>
		<td align="center" valign="middle" height="250">
			<font color ="red" size = "2" class="err"><b>Tidak ditemukan adanya data.
			<br />
			Tambah data pembayaran pada departemen <?=$departemen?> <? if ($namakelas) echo ", kelas ".$namakelas ?> dan kategori <?=$namapenerimaan?> di menu Penerimaan Pembayaran pada bagian Penerimaan.
			
			</b></font>		</td>
	</tr>
	</table>  
	
	<? } ?>
		</td>
	</tr>
	</table>
	<?
	//

} 

} ?>
</div>
<? CloseDb() ?>
</body>
</html>