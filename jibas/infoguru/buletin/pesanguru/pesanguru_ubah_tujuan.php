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
require_once('../../include/config.php');
require_once('../../include/db_functions.php');
require_once('../../include/sessioninfo.php');
$bulan="";
if (isset($_REQUEST['bulan']))
	$bulan=$_REQUEST['bulan'];
$idpesan="";
if (isset($_REQUEST['idpesan']))
	$idpesan=$_REQUEST['idpesan'];
$bagian="-1";
if (isset($_REQUEST['bagian']))
	$bagian=$_REQUEST['bagian'];

if ($bagian!="-1"){
$bag="WHERE bagian='$bagian'";
} else {
$bag="";
}	

$tahun="";
if (isset($_REQUEST['tahun']))
	$tahun=$_REQUEST['tahun'];

$xxx="";
if (isset($_REQUEST['xxx']))
	$xxx=$_REQUEST['xxx'];

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="../../script/tables.js"></script>
<script language="javascript" type="text/javascript">
function batal(){
	var bulan=document.getElementById('bulan').value;
	var tahun=document.getElementById('tahun').value;
	parent.location.href="pesanguru_footer.php?bulan="+bulan+"&tahun="+tahun;
}
function chg_bag(){
	var idpesan=document.getElementById('idpesan').value;
	var bulan=document.getElementById('bulan').value;
	var tahun=document.getElementById('tahun').value;
	var bagian=document.getElementById('bagian').value;
	document.location.href="pesanguru_ubah_tujuan.php?bulan="+bulan+"&tahun="+tahun+"&bagian="+bagian+"&idpesan="+idpesan;
}
function ambil(){
	var jumkirim=0;
	var jum = document.tujuan.numpegawai.value;
	for (x=1;x<=jum;x++){
		var nis=document.getElementById("ceknip"+x).checked;
		if (nis==true){
			document.getElementById("kirimin"+x).value="1";
			jumkirim++;	
		} else {
			document.getElementById("kirimin"+x).value="0";
		}
	}
	if (jumkirim>0 && jumkirim==1){
		document.getElementById("numpegawaikirim").value=jumkirim;
		if (confirm('Kirimkan pesan kepada pegawai ini ?')){
			parent.pesanguru_ubah.validate();
		}
	} else if (jumkirim>1){
		document.getElementById("numpegawaikirim").value=jumkirim;
		if (confirm('Kirimkan pesan kepada pegawai-pegawai ini ?')){
			parent.pesanguru_ubah.validate();
		}
	} else if (jumkirim==0) {
		alert ('Setidaknya harus ada 1 penerima untuk melanjutkan !');
		return false;
	}
}
function cek_all() {
	var x;
	var jum = document.tujuan.numpegawai.value;
	var ceked = document.tujuan.cek.checked;
	for (x=1;x<=jum;x++){
		if (ceked==true){
			document.getElementById("ceknip"+x).checked=true;
		} else {
			document.getElementById("ceknip"+x).checked=false;
		}
	}
}
</script>
</head>
<body style="margin-bottom:0px; margin-left:0px; margin-right:0px; margin-top:0px; background-color:#CCCCCC">
<form name="tujuan" id="tujuan" action="pesansimpan.php">
<input type="hidden" name="tahun" id="tahun" value="<?=$tahun?>" />
<input type="hidden" name="bulan" id="bulan" value="<?=$bulan?>"/>
<input type="hidden" name="idpesan" id="idpesan" value="<?=$idpesan?>"/>

<table width="100%" border="0" cellspacing="0">
  <tr>
    <th colspan="2" scope="row">
        </th>
  </tr>
  <tr height="80" bgcolor="#CCCCCC">
    <th scope="row" ><input title="Kirim pesan !" type="button" class="but" onclick="ambil();" name="kirim" id="kirim" value="Kirim" />&nbsp;&nbsp;
    <input title="Kembali ke Halaman Kotak Pesan !" type="button" class="but" onclick="batal();" name="cancel" id="cancel" value="Batal" />
    	    </th>
    <th scope="row">&nbsp;<select name="bagian" id="bagian" onchange="chg_bag()">
        	<option value="-1" <?=StringIsSelected("-1",$bagian)?>>Semua Bagian</option>
        	<? 
			OpenDb();
			$sql="SELECT * FROM jbssdm.bagianpegawai ORDER BY bagian";
			$result=QueryDb($sql);
			while ($row=@mysql_fetch_array($result)){
			?>
            <option value="<?=$row['bagian']?>" <?=StringIsSelected($bagian,$row['bagian'])?>><?=$row['bagian']?></option>
            <?
			}
			CloseDb();
			?>
        </select></th>
  </tr>
  <tr>
    <th colspan="2" scope="row">
    
    <table width="100%" border="0" cellspacing="0" class="tab" id="table">
  <tr>
    <th width="18%" height="30" class="header" scope="row">No</th>
    <td width="3%" height="30" class="header"><input type="checkbox" name="cek" id="cek" onClick="cek_all()" title="Pilih semua" onMouseOver="showhint('Pilih semua', this, event, '120px')"/></td>
    <td width="26%" height="30" class="header">NIP</td>
    <td width="53%" height="30" class="header">Nama</td>
  </tr>
  <? 
			OpenDb();
			$sql="SELECT * FROM jbssdm.pegawai $bag ORDER BY bagian";
			$result=QueryDb($sql);
			$cnt=1;
			while ($row=@mysql_fetch_array($result)){
				$sql1="SELECT idguru FROM jbsvcr.tujuanpesanguru WHERE idguru='$row[nip]' AND idpesan='$idpesan'";
				$result1=QueryDb($sql1);
				$num=@mysql_num_rows($result1);
				$ceked="";
				if ($num>0)
					$ceked="checked";
  ?>
   <tr>
    <th height="25" scope="row"><?=$cnt?></th>
    <td height="25"><input <?=$ceked?> type="checkbox" name="ceknip<?=$cnt?>" id="ceknip<?=$cnt?>"/></td>
    <td height="25"><?=$row['nip']?><input type="hidden" name="nip<?=$cnt?>" id="nip<?=$cnt?>" value="<?=$row['nip']?>"/>
      <input type="hidden" name="kirimin<?=$cnt?>" id="kirimin<?=$cnt?>"/></td>
    <td height="25"><?=$row['nama']?></td>
  </tr>
  <? 
  $cnt++;
  } 
  ?>
</table>
<input type="hidden" name="numpegawai" id="numpegawai" value="<?=$cnt-1?>" />
<input type="hidden" name="numpegawaikirim" id="numpegawaikirim"/>    </th>
  </tr>
</table>
</form>
</body>
</html>
<script language='JavaScript'>
			Tables('table', 1, 0);
</script>