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
require_once('include/errorhandler.php');
require_once('include/sessionchecker.php');
require_once('include/common.php');
require_once('include/rupiah.php');
require_once('include/config.php');
require_once('include/db_functions.php');
require_once('include/sessioninfo.php');
require_once('library/departemen.php');

OpenDb();

$departemen = "";
if (isset($_REQUEST['departemen']))
	$departemen = $_REQUEST['departemen'];
	
$idtahunbuku = "";
if (isset($_REQUEST['idtahunbuku']))
	$idtahunbuku = $_REQUEST['idtahunbuku'];
	
$idkategori = -1;
if (isset($_REQUEST['idkategori']))
	$idkategori = $_REQUEST['idkategori'];

$tgl1 = 0;
if (isset($_REQUEST['tgl1']))
	$tgl1 = (int)$_REQUEST['tgl1'];

$bln1 = 0;
if (isset($_REQUEST['bln1']))
	$bln1 = (int)$_REQUEST['bln1'];

$thn1 = 0;
if (isset($_REQUEST['thn1']))
	$thn1 = (int)$_REQUEST['thn1'];

$tgl2 = date("j");
if (isset($_REQUEST['tgl2']))
	$tgl2 = (int)$_REQUEST['tgl2'];

$bln2 = date("n");
if (isset($_REQUEST['bln2']))
	$bln2 = (int)$_REQUEST['bln2'];

$thn2 = date("Y");
if (isset($_REQUEST['thn2']))
	$thn2 = (int)$_REQUEST['thn2'];	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style/tooltips.css">
<title>Untitled Document</title>
<script language="javascript" src="script/tooltips.js"></script>
<script language="javascript" src="script/ajax.js"></script>
<script language="javascript" src="script/validasi.js"></script>
<script language="javascript">
function change_sel() 
{
	parent.content.location.href = "jurnalpenerimaan_blank.php";
}

function change_dep() 
{
	var departemen = document.getElementById('departemen').value;
	var tgl1 = document.getElementById('tgl1').value;
	var bln1 = document.getElementById('bln1').value;
	var thn1 = document.getElementById('thn1').value;
	var tgl2 = document.getElementById('tgl2').value;
	var bln2 = document.getElementById('bln2').value;
	var thn2 = document.getElementById('thn2').value;
	var idkategori = document.getElementById('idkategori').value;
		
	document.location.href = "jurnalpenerimaan_header.php?tgl1="+tgl1+"&bln1="+bln1+"&thn1="+thn1+"&tgl2="+tgl2+"&bln2="+bln2+"&thn2="+thn2+"&departemen="+departemen+"&idkategori="+idkategori;
	parent.content.location.href = "jurnalpenerimaan_blank.php";
}

function change_tanggal()
{
	parent.content.location.href = "jurnalpenerimaan_blank.php";
}

function change_bulan()
{
	var departemen = document.getElementById('departemen').value;
	var bln1 = parseInt(document.getElementById('bln1').value);
	var thn1 = parseInt(document.getElementById('thn1').value);
	var bln2 = parseInt(document.getElementById('bln2').value);
	var thn2 = parseInt(document.getElementById('thn2').value);
	var idtahunbuku = document.getElementById("idtahunbuku").value;
	var idkategori = document.getElementById('idkategori').value;
	
	document.location.href = "jurnalpenerimaan_header.php?bln1="+bln1+"&thn1="+thn1+"&bln2="+bln2+"&thn2="+thn2+"&departemen="+departemen+"&idtahunbuku="+idtahunbuku+"&idkategori="+idkategori;
	parent.content.location.href = "jurnalpenerimaan_blank.php";
}

function change_tahunbuku()
{
	var departemen = document.getElementById("departemen").value;
	var idtahunbuku = document.getElementById("idtahunbuku").value;
	var idkategori = document.getElementById('idkategori').value;
	
	document.location.href = "jurnalpenerimaan_header.php?departemen="+departemen+"&idtahunbuku="+idtahunbuku+"&idkategori="+idkategori;
	parent.content.location.href = "jurnalpenerimaan_blank.php";
}

function change_kate() 
{
	parent.content.location.href = "jurnalpenerimaan_blank.php";
}

function show_laporan() 
{
	var idtahunbuku = document.getElementById('idtahunbuku').value;
	var idkategori = document.getElementById('idkategori').value;
	var departemen = document.getElementById('departemen').value;
	var tgl1 = parseInt(document.getElementById('tgl1').value);
	var bln1 = parseInt(document.getElementById('bln1').value);
	var thn1 = parseInt(document.getElementById('thn1').value);
	var tgl2 = parseInt(document.getElementById('tgl2').value);
	var bln2 = parseInt(document.getElementById('bln2').value);
	var thn2 = parseInt(document.getElementById('thn2').value);
	var tanggal1 = escape(thn1 + "-" + bln1 + "-" + tgl1);
	var tanggal2 = escape(thn2 + "-" + bln2 + "-" + tgl2);
	
	if (idtahunbuku.length == 0) 
	{
		alert ('Tahun buku tidak boleh kosong !');
		document.getElementById('departemen').focus();
		return false;
	} 
	else if (tgl1.length == 0) 
	{	
		alert ('Tanggal awal tidak boleh kosong!');	
		document.main.tgl1.focus();
		return false;	
	}
	else if (tgl2.length == 0) 
	{	
		alert ('Tanggal akhir tidak boleh kosong!');	
		document.main.tgl2.focus();
		return false;	
	}
	
	//return change_tgl1();
	var validasi = validateTgl(tgl1, bln1, thn1, tgl2, bln2, thn2);
	if (validasi) 
		parent.content.location.href="jurnalpenerimaan_content.php?idtahunbuku="+idtahunbuku+"&idkategori="+idkategori+"&tanggal1="+tanggal1+"&tanggal2="+tanggal2+"&departemen="+departemen;
}
</script>
</head>
<body topmargin="0" leftmargin="0" onload="document.getElementById('departemen').focus()">
<form method="post" name="main">
<table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
<tr>
<td rowspan="3" width="60%">
    <table border="0" width = "100%">
    <tr>
        <td width="15%"><strong>Departemen </strong></font></td>
        <td colspan="4">
        <select name="departemen" id="departemen" onchange="change_dep()" style="width:115px">
        <?	$dep = getDepartemen(getAccess());
            foreach ($dep as $value) { 
				if ($departemen == "")
              	$departemen = $value; ?>
	            <option value="<?=$value ?>" <?=StringIsSelected($value, $departemen) ?>><?=$value ?></option>
        <?  } ?>     
        </select>
        <strong>Tahun Buku&nbsp;</strong>
        <select name="idtahunbuku" id="idtahunbuku" onchange="change_tahunbuku()" style="width:160px">        
<? 		if ($departemen != "") 
			{ 
				 $sql = "SELECT replid, tahunbuku, DAY(tanggalmulai), MONTH(tanggalmulai), YEAR(tanggalmulai), aktif 
							FROM tahunbuku WHERE departemen='$departemen' ORDER BY replid DESC";
				 $result = QueryDb($sql);
				 while ($row = mysql_fetch_row($result))
				 {
					  if ($idtahunbuku == 0)
							$idtahunbuku = $row[0];
					  
					  $sel = "";
					  if ($idtahunbuku == $row[0])
					  {
							$sel = "selected";
							
							if ($tgl1 == 0)	$tgl1 = $row[2];
							if ($bln1 == 0) $bln1 = $row[3];
							if ($thn1 == 0) $thn1 = $row[4];
					  }
					  
					  $A = "";
					  if ($row[5] == 1)
							$A = "(A)";
					  
					  echo  "<option value='$row[0]' $sel>$row[1] $A</option>";
				 }
			} ?>
			</select>
        </td>
    </tr>
    <tr>
    	<td><strong>Kategori&nbsp;</strong></td>
      	<td colspan="4">    
        <select name="idkategori" id="idkategori" style="width:205px" onchange="change_kate()">
        <option value="-1">(Semua Kategori)</option>
        <?
        $sql = "SELECT kode, kategori FROM kategoripenerimaan ORDER BY urutan";
        $result = QueryDb($sql);
        while ($row = mysql_fetch_array($result)) {
            if ($idkategori == "")
                $idkategori = $row['kode']
        ?>
            <option value="<?=$row['kode'] ?>" <?=StringIsSelected($idkategori, $row['kode']) ?> > <?=$row['kategori'] ?></option>
        <?
        }
        ?>
        </select>
   		</td>
   	</tr>
    <tr>
<?		if ($tgl1 == 0) $tgl1 = $tgl2;
		if ($bln1 == 0) $bln1 = $bln2;
		if ($thn1 == 0) $thn1 = $thn2;
					
		$n1 = JmlHari($bln1, $thn1);
		$n2 = JmlHari($bln2, $thn2);	?>      
        <td><strong>Tanggal </strong></td>
        <td width="10">
        	<div id="InfoTgl1"> 
         <select name="tgl1" id = "tgl1" onchange="change_tanggal()" >  
			<? for($i = 1; $i <= $n1; $i++) { ?>
                <option value="<?=$i ?>" <?=IntIsSelected($i, $tgl1) ?> > <?=$i ?></option>
            <? } ?>
        	</select>
            </div>
       	</td>
        <td width="160">
            <select name="bln1" id="bln1" onchange="change_bulan()">
            <? for($i = 1; $i <= 12; $i++) { ?>
                <option value="<?=$i ?>" <?=IntIsSelected($i, $bln1) ?> > <?=$bulan[$i] ?></option>
            <? } ?>
            </select>
            <select name="thn1" id="thn1" onchange="change_bulan()">
            <? for($i = $G_START_YEAR; $i <= $thn1+1; $i++) { ?>
                <option value="<?=$i ?>" <?=IntIsSelected($i, $thn1) ?> > <?=$i ?></option>
            <? } ?>
            </select> s/d
        </td>
        <td width="10">
         	<div id="InfoTgl2">
            <select name="tgl2" id="tgl2" onchange="change_tanggal()">
            <? for($i = 1; $i <= $n2; $i++) { ?>
                <option value="<?=$i ?>" <?=IntIsSelected($i, $tgl2) ?> > <?=$i ?></option>
            <? } ?>
            </select>
            </div>
        </td>
        <td>
            <select name="bln2" id="bln2" onchange="change_bulan()">
            <? for($i = 1; $i <= 12; $i++) { ?>
                <option value="<?=$i ?>" <?=IntIsSelected($i, $bln2) ?> > <?=$bulan[$i]?></option>
            <? } ?>
            </select>
            <select name="thn2" id="thn2" onchange="change_bulan()">
            <? for($i = $G_START_YEAR; $i <= $thn2+1; $i++) { ?>
                <option value="<?=$i ?>" <?=IntIsSelected($i, $thn2) ?> > <?=$i ?></option>
            <? } ?>
            </select>
        </td>
    </tr>
    </table>
	</td>
 	<td rowspan="2" width="*" valign="middle">
        <a href="#" onclick="show_laporan()"><img src="images/view.png" border="0" height="48"  width="48" id="tabel" onmouseover="showhint('Klik untuk menampilkan data jurnal penerimaan!', this, event, '120px')"/></a>
    </td>
	<td width="40%" align="right" valign="top">
	<font size="4" face="Verdana, Arial, Helvetica, sans-serif" style="background-color:#ffcc66">&nbsp;</font>&nbsp;<font size="4" face="Verdana, Arial, Helvetica, sans-serif" color="Gray">Jurnal Penerimaan</font><br />
    <a target="_parent" href="penerimaan.php">
      <font size="1" color="#000000"><b>Penerimaan</b></font></a>&nbsp>&nbsp
        <font size="1" color="#000000"><b>Jurnal Penerimaan</b></font>
	</td>
</tr>
<tr>	
    <td align="right" valign="top">
   	</td>
</tr>
</table>
</form>
<?
CloseDb();
?>
</body>
</html>