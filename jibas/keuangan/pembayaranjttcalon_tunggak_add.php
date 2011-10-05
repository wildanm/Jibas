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
require_once('include/theme.php');
require_once('include/sessioninfo.php');
require_once('library/jurnal.php');
require_once('library/repairdatajttcalon.php');

$replid = $_REQUEST['replid'];
$idkategori = $_REQUEST['idkategori'];
$idpenerimaan = $_REQUEST['idpenerimaan'];
$idtahunbuku = $_REQUEST['idtahunbuku'];
$idtahunbuku_aktif = $_REQUEST['idtahunbuku_aktif'];

OpenDb();

//// Ambil informasi calon siswa
$sql = "SELECT nama, nopendaftaran FROM jbsakad.calonsiswa WHERE replid = '$replid'";
$row = FetchSingleRow($sql);
$nama = $row[0];
$no = $row[1];

//// Ambil nama penerimaan
$sql = "SELECT nama FROM datapenerimaan WHERE replid = $idpenerimaan";
$namapenerimaan = FetchSingle($sql);

$tanggal = date('d-m-Y');
if (isset($_REQUEST['tcicilan']))
	$tanggal = $_REQUEST['tcicilan'];
	
if (isset($_REQUEST['jcicilan']))
	$jbayar = UnformatRupiah($_REQUEST['jcicilan']);
	
if (isset($_REQUEST['Simpan'])) 
{
	$petugas = getUserName();
	$idbesarjtt = (int)$_REQUEST['idbesarjtt'];
	$tcicilan = $_REQUEST['tcicilan'];
	$tcicilan = MySqlDateFormat($tcicilan);
	$jcicilan = $_REQUEST['jcicilan'];
	$jcicilan = UnformatRupiah($jcicilan);
	$kcicilan = $_REQUEST['kcicilan'];
		
	//// Ambil nama penerimaan
	$sql = "SELECT nama, rekkas, rekpendapatan, rekpiutang FROM datapenerimaan WHERE replid = $idpenerimaan";
	$row = FetchSingleRow($sql);
	$namapenerimaan = $row[0];
	$rekkas = $row[1];
	$rekpendapatan = $row[2];
	$rekpiutang = $row[3];
	
	//// Ambil nama calon siswa
	$sql = "SELECT nama, nopendaftaran FROM jbsakad.calonsiswa WHERE replid = $replid";
	$row = FetchSingleRow($sql);
	$namasiswa = $row[0];
	$no = $row[1];
	
	//// Cari tahu besar pembayaran
	// FIXED: 27 Agustus 2010
	$sql = "SELECT b.replid AS id, b.besar, b.keterangan, b.lunas 
			    FROM besarjttcalon b
			   WHERE b.idcalon = $replid AND b.idpenerimaan = $idpenerimaan AND b.info2 = '$idtahunbuku'";
	$res = QueryDb($sql);
	$row = mysql_fetch_row($res);
	$idbesarjtt = $row[0];
	$besarjtt = $row[1];
	
	//// Cari tahu jumlah pembayaran cicilan yang sudah terjadi
	$jml = 0;
	$cicilan = 1;
	$sql = "SELECT jumlah FROM penerimaanjttcalon WHERE idbesarjttcalon = $idbesarjtt";
	$result = QueryDb($sql);
	while ($row = mysql_fetch_row($result)) 
	{
		$jml += $row[0];
		$cicilan++;
	}

	//// Cek jumlah cicilan dengan besar pembayaran yang mesti dilunasi
	$ketjurnal = "";
	if ($jml + $jcicilan > $besarjtt) 
	{		
		$errmsg = "Maaf, pembayaran tidak dapat dilakukan! Jumlah bayaran cicilan lebih besar daripada pembayaran yang harus dilunasi!";		
	} 
	else if ($jml + $jcicilan == $besarjtt) 
	{		
		$ketjurnal = "Pelunasan $namapenerimaan calon siswa $namasiswa ($no)";
		$lunas = 1; //udah lunas
	} 
	else 
	{
		$ketjurnal = "Pembayaran cicilan ke-$cicilan $namapenerimaan calon siswa $namasiswa ($no)";
		$lunas = 0; //blum lunas
	}
		
	//// Ambil awalan dan cacah tahunbuku untuk bikin nokas;
	$sql = "SELECT awalan, cacah FROM jbsfina.tahunbuku WHERE replid = $idtahunbuku";
	$row = FetchSingleRow($sql);
	$awalan = $row[0];
	$cacah = $row[1];
	
	$cacah += 1;  // increment counter
	$nokas = $awalan . rpad($cacah, "0", 6);  // form nokas
	
	//// Begin Database Transaction
	BeginTrans();
	$success = true;

	//// Simpan ke jurnal
	$idjurnal = 0;
	$success = SimpanJurnal($idtahunbuku_aktif, $tcicilan, $ketjurnal, $nokas, "", $petugas, "penerimaanjttcalon", $idjurnal);
	
	//// Simpan ke jurnaldetail
	if ($success) 
		$success = SimpanDetailJurnal($idjurnal, "D", $rekkas, $jcicilan);
	if ($success) 
		$success = SimpanDetailJurnal($idjurnal, "K", $rekpiutang, $jcicilan);
	
	//increment cacah di tahunbuku
	$sql = "UPDATE tahunbuku SET cacah=cacah+1 WHERE replid=$idtahunbuku";
	if ($success) 
		QueryDbTrans($sql, $success);
	
	//simpan data cicilan di penerimaanjtt
	$sql = "INSERT INTO penerimaanjttcalon SET idbesarjttcalon=$idbesarjtt, idjurnal=$idjurnal, tanggal='$tcicilan', 
	        jumlah='$jcicilan', keterangan='$kcicilan', petugas='$petugas'";
	if ($success) 
		QueryDbTrans($sql, $success);
	
	//jika lunas ubah statusnya di besarjtt
	if ($lunas) 
	{
		if ($success) 
		{
			$sql = "SET @DISABLE_TRIGGERS = 1;";
			QueryDb($sql);
			
			$sql = "UPDATE besarjttcalon SET lunas=1 WHERE replid=$idbesarjtt";
			QueryDbTrans($sql, $success);
			
			$sql = "SET @DISABLE_TRIGGERS = NULL;";
			QueryDb($sql);
		}
	}
	
	if (strlen($errmsg) == 0) 
	{
		if ($success) 
		{			
			CommitTrans();
			CloseDb();
			echo  "<script language='javascript'>";			
			echo  "opener.refresh();";
			echo  "window.close();";
			echo  "</script>";
			exit();
		} 
		else 
		{
			echo  $sql;
			RollbackTrans();
			CloseDb();			
			echo  "<script language='javascript'>";
			echo  "alert('Gagal menyimpan data!);";
			echo  "</script>";
		}
	}
}
CloseDb();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style/style.css">
<link rel="stylesheet" type="text/css" href="style/calendar-green.css">
<link rel="stylesheet" type="text/css" href="style/tooltips.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS KEU [Tambah Pembayaran Cicilan]</title>
<script src="script/SpryValidationTextField.js" type="text/javascript"></script>
<link href="script/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<script src="script/SpryValidationTextarea.js" type="text/javascript"></script>
<link href="script/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
<script src="script/tooltips.js" language="javascript"></script>
<script language="javascript" src="script/tables.js"></script>
<script language="javascript" src="script/tools.js"></script>
<script language="javascript" src="script/rupiah.js"></script>
<script language="javascript" src="script/validasi.js"></script>
<script type="text/javascript" src="script/calendar.js"></script>
<script type="text/javascript" src="script/lang/calendar-en.js"></script>
<script type="text/javascript" src="script/calendar-setup.js"></script>
<script language="javascript">
function validasi() 
{
	return validateEmptyText('jcicilan', 'Besarnya Cicilan') &&
		    validasiAngka() &&
		    validateEmptyText('tcicilan', 'Tanggal Cicilan') &&
		    validateMaxText('kcicilan', 255, 'Keterangan Cicilan');
}

function validasiAngka() 
{
	angka = document.getElementById('angkacicilan').value;
	if(isNaN(angka)) 
	{
		alert ('Besarnya cicilan harus berupa bilangan!');
		document.getElementById('jcicilan').focus();
		return false;
	}
	else if (angka <= 0)
	{
		alert ('Besarnya cicilan harus positif!');
		document.getElementById('jcicilan').focus();
		return false;
	}
	
	return true;
}

function salinangka()
{	
	var angka = document.getElementById("jcicilan").value;
	document.getElementById("angkacicilan").value = angka;
}

function focusNext(elemName, evt) 
{
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode :((evt.which) ? evt.which : evt.keyCode);
    if (charCode == 13) 
	 {
		document.getElementById(elemName).focus();
    	return false;
    }
    return true;
}
</script>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" background="" style='background-color:#dfdec9' onLoad="document.getElementById('jcicilan').focus();">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr height="58">
	<td width="28" background="<?=GetThemeDir() ?>bgpop_01.jpg">&nbsp;</td>
    <td width="*" background="<?=GetThemeDir() ?>bgpop_02a.jpg">
	<div align="center" style="color:#FFFFFF; font-size:16px; font-weight:bold">
    .: Tambah Pembayaran Cicilan :.
    </div>
	</td>
    <td width="28" background="<?=GetThemeDir() ?>bgpop_03.jpg">&nbsp;</td>
</tr>
<tr height="150">
	<td width="28" background="<?=GetThemeDir() ?>bgpop_04a.jpg">&nbsp;</td>
    <td width="0" style="background-color:#FFFFFF">
    
    <form name="main" method="post" onsubmit="return validasi()">
    <input type="hidden" name="idkategori" id="idkategori" value="<?=$idkategori ?>" />
	 <input type="hidden" name="idpenerimaan" id="idpenerimaan" value="<?=$idpenerimaan ?>" />
	 <input type="hidden" name="replid" id="replid" value="<?=$replid ?>" />
	 <input type="hidden" name="idtahunbuku" id="idtahunbuku" value="<?=$idtahunbuku ?>" />
    <input type="hidden" name="idtahunbuku_aktif" id="idtahunbuku_aktif" value="<?=$idtahunbuku_aktif ?>" />
       
   	<table border="0" width="95%" cellpadding="2" cellspacing="2" align="center">
	<!-- TABLE CONTENT -->
    <tr>
        <td width="50%"><strong>Pembayaran</strong></td>
        <td colspan="2"><input type="text" readonly="readonly" size="30" value="<?=$namapenerimaan?>" style="background-color:#CCCC99"/></td>
    </tr>
    <tr>
        <td><strong>Nama</strong></td>
        <td colspan="2"><input type="text" size="30" value="<?=$no . " - " . $nama ?>" readonly style="background-color:#CCCC99"/></td>
    </tr>
    <tr>
        <td><strong>Jumlah Cicilan</strong></td>
        <td colspan="2"><input type="text" name="jcicilan" id="jcicilan" value="<?=FormatRupiah($jbayar) ?>" onblur="formatRupiah('jcicilan')" onfocus="unformatRupiah('jcicilan')" onKeyPress="return focusNext('kcicilan', event)" onkeyup="salinangka()"/>
        <input type="hidden" name="angkacicilan" id="angkacicilan" value="<?=$jcicilan?>" /></td>
    </tr>
    <tr>
        <td><strong>Tanggal</strong></td>
        <td>
        <input type="text" name="tcicilan" id="tcicilan" readonly size="15" value="<?=$tanggal ?>" onKeyPress="return focusNext('kcicilan', event)" onClick="Calendar.setup()" style="background-color:#CCCC99"> </td>
        <td width="45%">
        <img src="images/calendar.jpg" name="tabel" border="0" id="btntanggal" onMouseOver="showhint('Buka kalendar!', this, event, '100px')"/>
	    </td>        
    </tr>
    <tr>
        <td valign="top">Keterangan</td>
        <td colspan="2"><textarea id="kcicilan" name="kcicilan" rows="3" cols="30" onKeyPress="return focusNext('Simpan', event)"><?=$_REQUEST['kcicilan'] ?></textarea>
        </td>
    </tr>
    <tr>
        <td colspan="3" align="center">
        <input type="submit" name="Simpan" id="Simpan" class="but" value="Simpan" />
        <input type="button" name="tutup" id="tutup" class="but" value="Tutup" onclick="window.close()" />
        </td>
    </tr>
    </table>
    </form>
   
<!-- END OF CONTENT //--->
    </td>
    <td width="28" background="<?=GetThemeDir() ?>bgpop_06a.jpg">&nbsp;</td>
</tr>
<tr height="28">
	<td width="28" background="<?=GetThemeDir() ?>bgpop_07.jpg">&nbsp;</td>
    <td width="*" background="<?=GetThemeDir() ?>bgpop_08a.jpg">&nbsp;</td>
    <td width="28" background="<?=GetThemeDir() ?>bgpop_09.jpg">&nbsp;</td>
</tr>
</table>
<? if (strlen($errmsg) > 0) {
	echo  "<script language='javascript'>";
	echo  "alert('$errmsg');";
	echo  "</script>";
} ?>
</body>
</html>
<script language="javascript">
  Calendar.setup(
    {
      //inputField  : "tanggalshow","tanggal"
	  inputField  : "tcicilan",         // ID of the input field
      ifFormat    : "%d-%m-%Y",    // the date format
      button      : "btntanggal"       // ID of the button
    }
   );
    Calendar.setup(
    {
      inputField  : "tcicilan",        // ID of the input field
      ifFormat    : "%d-%m-%Y",    // the date format	  
	  button      : "tcicilan"       // ID of the button
    }
  );
var sprytextfield1 = new Spry.Widget.ValidationTextField("tcicilan");
var sprytextfield1 = new Spry.Widget.ValidationTextField("jcicilan");
var sprytextarea1 = new Spry.Widget.ValidationTextarea("kcicilan");
</script>