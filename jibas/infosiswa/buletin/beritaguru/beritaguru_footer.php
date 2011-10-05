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
require_once('../../include/common.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/config.php');
require_once('../../include/getheader.php');
require_once('../../include/db_functions.php');
function delete($file) {
 if (file_exists($file)) {
   chmod($file,0777);
   if (is_dir($file)) {
     $handle = opendir($file); 
     while($filename = readdir($handle)) {
       if ($filename != "." && $filename != "..") {
         delete($file."/".$filename);
       }
     }
     closedir($handle);
     rmdir($file);
   } else {
     unlink($file);
   }
 }
}
//$mydir="../../upload/lampiranbg/200808/1.jpg";
//delete ($mydir);
$op="";
if (isset($_REQUEST['op']))
	$op=$_REQUEST['op'];

if ($op=="bzux834hx8x7x934983xihxf084"){
	//Hapus dulu file attachnya
	OpenDb();
	$sql="SELECT direktori, namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$_REQUEST[replid]'";
	$result=QueryDb($sql);
	$file="file";
	$cntdel=0;
	while ($row=@mysql_fetch_array($result)){
		$mydir[$cntdel]=$row['direktori'].$row['namafile'];
		$cntdel++;	
	}
	CloseDb();
	delete($mydir[0]);
	delete($mydir[1]);
	delete($mydir[2]);
	//Hapus tabel lampiranberitaguru
	OpenDb();
	$sql="DELETE FROM jbsvcr.lampiranberitaguru WHERE idberita='$_REQUEST[replid]'";
	$result=QueryDb($sql);
	CloseDb();
	//Hapus tabel beritaguru
	OpenDb();
	$sql="DELETE FROM jbsvcr.beritaguru WHERE replid='$_REQUEST[replid]'";
	$result=QueryDb($sql);
	CloseDb();
}
$bulan="";
if (isset($_REQUEST['bulan']))
	$bulan=$_REQUEST['bulan'];
$tahun="";
if (isset($_REQUEST['tahun']))
	$tahun=$_REQUEST['tahun'];
$idguru=SI_USER_ID();
$varbaris=10;
$page=0;
if (isset($_REQUEST['page']))
	$page = $_REQUEST['page'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="../../script/tables.js"></script>
<script language="javascript" src="../../script/tools.js"></script>
<script language="javascript">
function fill_month_and_year(){
	var bulan=parent.beritaguru_header.document.getElementById("bulan").value;
	var tahun=parent.beritaguru_header.document.getElementById("tahun").value;
	//alert ('Resend');
	document.location.href="beritaguru_footer.php?bulan="+bulan+"&tahun="+tahun;
}
function chg_page(){
	var page=document.getElementById("page").value;
	var bulan=parent.beritaguru_header.document.getElementById("bulan").value;
	var tahun=parent.beritaguru_header.document.getElementById("tahun").value;
	//var tahun=parent.beritaguru_header.document.getElementById("tahun").value;
	//alert ('Resend');
	document.location.href="beritaguru_footer.php?bulan="+bulan+"&tahun="+tahun+"&page="+page;
}
function ubah(replid){
	document.location.href="beritaguru_edit.php?replid="+replid;
}
function hapus(replid){
	var page=document.getElementById("page").value;
	var bulan=parent.beritaguru_header.document.getElementById("bulan").value;
	var tahun=parent.beritaguru_header.document.getElementById("tahun").value;
	if (confirm('Anda yakin akan menghapus berita ini dan lampiran-lampirannya ?')){ 
		document.location.href="beritaguru_footer.php?op=bzux834hx8x7x934983xihxf084&replid="+replid+"&bulan="+bulan+"&tahun="+tahun+"&page="+page;
	}
}
</script>
</head>
<body <? //if($bulan=="" && $tahun=="") { ?> <? //} ?>><!--onload="fill_month_and_year();"-->
<input type="hidden" name="bulan" id="bulan" value="<?=$bulan?>" />
<input type="hidden" name="tahun" id="tahun" value="<?=$tahun?>" />
<table width="100%" border="0" cellspacing="0">
  <tr>
  <? OpenDb();
  $sql_tot="SELECT b.replid as replid, b.judul as judul, DATE_FORMAT(b.tanggal, '%e %b %Y') as tanggal, TIME_FORMAT(b.tanggal, '%H:%i') as waktu, ".
  		"b.abstrak as abstrak, b.isi as isi, p.nama as nama, p.nip as nip FROM jbsvcr.beritaguru b, jbssdm.pegawai p ".
		"WHERE p.nip=b.idguru AND MONTH(b.tanggal)='$bulan' AND YEAR(b.tanggal)='$tahun' ORDER BY replid DESC";
  //echo $sql1;
  $result_tot=QueryDb($sql_tot);
  $total = ceil(mysql_num_rows($result_tot)/(int)$varbaris);
  CloseDb();
	?>
	<td scope="row" align="left">
	<?
	if ($total!=0){
	?>
    Halaman : <select name="page" id="page" onchange="chg_page()">
	<? for ($p=1;$p<=$total;$p++){ ?>
		<option value="<?=$p-1?>" <?=StringIsSelected($page,$p-1)?>><?=$p;?></option>
	<? } ?>
	</select>&nbsp;dari&nbsp;<?=$total?>    
    <? } ?>
	<table width="100%" border="1" cellspacing="0" class="tab" id="table">
  <tr>
    <th width="22" height="30" class="header" scope="row"><div align="center">No</div></th>
    <td width="69" height="30" class="header"><div align="center">Tanggal</div></td>
    <td width="*" height="30" class="header"><div align="center">Berita</div></td>
    <td width="125" height="30" class="header"><div align="center">Penulis</div></td>
    <td width="150" height="30" class="header"><div align="center">Lampiran</div></td>
    <td width="70" height="30" class="header">&nbsp;</td>
  </tr>
  <?
  OpenDb();
  

  $sql1="SELECT b.replid as replid, b.judul as judul, DATE_FORMAT(b.tanggal, '%e %b %Y') as tanggal, TIME_FORMAT(b.tanggal, '%H:%i') as waktu, ".
  		"b.abstrak as abstrak, b.isi as isi, p.nama as nama, p.nip as nip FROM jbsvcr.beritaguru b, jbssdm.pegawai p ".
		"WHERE p.nip=b.idguru AND MONTH(b.tanggal)='$bulan' AND YEAR(b.tanggal)='$tahun' ORDER BY replid DESC LIMIT ".(int)$page*(int)$varbaris.",$varbaris";
  //echo $sql1;
  $result1=QueryDb($sql1);
  if (@mysql_num_rows($result1)>0){
  if ($page==0){
  $cnt=1;
  } else {
  $cnt=(int)$page*(int)$varbaris+1;
  }
  while ($row1=@mysql_fetch_array($result1)){
  ?>
  <tr>
    <td scope="row"><div align="center"><?=$cnt;?></div></th>
    <td><div align="center"><?=$row1['tanggal']?><br><?=$row1['waktu']?></div></td>
    <td><?=$row1['judul']?><br />
	<?  $is=$row1['isi'];
	    echo removetag($is);
	?></td>
    <td><?=$row1['nip']?>-<?=$row1['nama']?></td>
    <td>
    <?
	$sql2="SELECT direktori,namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$row1[replid]'";
	$result2=QueryDb($sql2);
	while ($row2=@mysql_fetch_array($result2)){
		echo "<a title='Buka lampiran ini!' href=\"#\" onclick=newWindow('".$row2[direktori].$row2[namafile]."','View',640,480,'resizable=1'); ><img border='0' src='../../images/ico/titik.png' width='5' heiht='5'/> ".$row2['namafile']."</a><br>";
	}
	?>
    </td>
    <td><div align="center">
    <? if ($row1[nip]==$idguru){ ?>
    <img src="../../images/ico/ubah.png" border="0" onclick="ubah('<?=$row1[replid]?>')" style="cursor:pointer;" title="Ubah Berita ini !" />&nbsp;<img src="../../images/ico/hapus.png" border="0" onclick="hapus('<?=$row1[replid]?>')" style="cursor:pointer;" title="Hapus Berita ini !" />
    <? } ?>
	</div></td>
  </tr>
  <? 
  $cnt++;
  } 
  } else {?>
   <tr>
    <td scope="row" colspan="6"><div align="center">Tidak ada berita</div></th>
   </tr>
  <? } ?>
</table>

		<script language='JavaScript'>
			//Tables('table', 1, 0);
		</script>

	</td>
  </tr>
</table>

</body>
</html>