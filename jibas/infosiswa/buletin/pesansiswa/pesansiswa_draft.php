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
$op="";
if (isset($_REQUEST['op']))
	$op=$_REQUEST['op'];
if ($op=="bzux834hx8x7x934983xihxf084"){
	$numdel=(int)$_REQUEST["numdel"]-1;
	$msgall=$_REQUEST["listdel"];
	$x=0;
	$msg=explode("|",$msgall);
	while ($x<=$numdel){
		if ($msg[$x]!=""){
		OpenDb();
			$sql="SELECT idpesan,direktori, namafile FROM jbsvcr.lampirandraft WHERE idpesan=".$msg[$x];
			$result=QueryDb($sql);
			while ($row=@mysql_fetch_array($result)){
				$mydirs[$cntdel]=$UPLOAD_DIR."pesan\\".$row['direktori'].$row['namafile'];
				$mydir[$cntdel]=str_replace("/","\\",$mydirs[$cntdel]);
				$cntdel++;	
			}
		CloseDb();
		//echo $mydir[0]."<br>";
		//echo $mydir[1]."<br>";
		//echo $mydir[2]."<br>";
		delete($mydir[0]);
		delete($mydir[1]);
		delete($mydir[2]);
		OpenDb();
		$sql="DELETE FROM jbsvcr.lampirandraft WHERE idpesan=".$msg[$x];
		$result=QueryDb($sql);
		CloseDb();
		//Hapus tabel beritaguru
		OpenDb();
		$sql="DELETE FROM jbsvcr.draft WHERE replid=".$msg[$x];
		$result=QueryDb($sql);
		CloseDb();
		}
	$x++;
	}
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
	var bulan=parent.pesanguru_header.document.getElementById("bulan").value;
	var tahun=parent.pesanguru_header.document.getElementById("tahun").value;
	document.location.href="pesanguru_footer.php?bulan="+bulan+"&tahun="+tahun;
}
function chg_page(){
	var page=document.getElementById("page").value;
	var bulan=parent.pesanguru_header.document.getElementById("bulan").value;
	var tahun=parent.pesanguru_header.document.getElementById("tahun").value;
	document.location.href="pesanguru_footer.php?bulan="+bulan+"&tahun="+tahun+"&page="+page;
}
function ubah(replid){
	document.location.href="pesanguru_ubah_main.php?replid="+replid;
}
function bacapesan(replid){
	document.location.href="pesansiswabaca_draft.php?replid="+replid;
}
function hapus(replid){
	var page=document.getElementById("page").value;
	var bulan=parent.pesanguru_header.document.getElementById("bulan").value;
	var tahun=parent.pesanguru_header.document.getElementById("tahun").value;
	if (confirm('Anda yakin akan menghapus pesan ini dan lampiran-lampirannya ?')){ 
		document.location.href="pesanguru_draft.php?op=bzux834hx8x7x934983xihxf084&replid="+replid+"&bulan="+bulan+"&tahun="+tahun+"&page="+page;
	}
}
function cek_all() {
	//alert ('Masuk');
	var x;
	var jum = document.inbox.numpesan.value;
	var ceked = document.inbox.cek.checked;
	//alert (''+ceked);
	for (x=1;x<=jum;x++){
		if (ceked==true){
			document.getElementById("cekpesan"+x).checked=true;
		} else {
			document.getElementById("cekpesan"+x).checked=false;
		}
	}
}
function delpesan(){
	//alert ('Masuk Hapus');
	var x;
	var y=0;
	var jum = document.inbox.numpesan.value;
	for (x=1;x<=jum;x++){
		var ceked = document.getElementById("cekpesan"+x).checked;
		var rep = document.getElementById("rep"+x).value;
		var listdel=document.getElementById('listdel').value;
		if (ceked==true){
			if (y==0)
				y=y+1;
			document.getElementById('listdel').value=listdel+rep+"|";
			document.getElementById('numdel').value=y++;
		}
	}
	var num = document.inbox.numdel.value;
	var list = document.inbox.listdel.value;
	if (list.length==0){
		alert ('Minimal ada satu pesan yang akan dihapus');
		return false;
	} else {
		if (confirm('Anda yakin akan menghapus pesan ini?')){
			document.location.href="pesansiswa_draft.php?op=bzux834hx8x7x934983xihxf084&listdel="+list+"&numdel="+num;
		} else {
			document.getElementById("listdel").value="";
		}
	}
}
function chg() {
	document.getElementById("cek").checked=false;
}
</script>
</head>
<body >
<form name="inbox" id="inbox"  action="pesanguru_footer.php">
<div align="right">
<font size="4" face="Verdana, Arial, Helvetica, sans-serif" style="background-color:#ffcc66">&nbsp;</font>&nbsp;<font size="4" face="Verdana, Arial, Helvetica, sans-serif" color="Gray">DRAFT</font><br />
    <a href="pesanguru.php" target="framecenter">
      <font size="1" color="#000000"><b>Pesan Guru</b></font></a>&nbsp>&nbsp
        <font size="1" color="#000000"><b>Draft</b></font>
</div><br />
<input type="hidden" name="bulan" id="bulan" value="<?=$bulan?>" />
<input type="hidden" name="tahun" id="tahun" value="<?=$tahun?>" />
<table width="100%" border="0" cellspacing="0">
  <tr>
  <? OpenDb();
  $sql_tot="SELECT * FROM jbsvcr.draft WHERE idpemilik='".SI_USER_ID()."'";
  $result_tot=QueryDb($sql_tot);
  $total = ceil(mysql_num_rows($result_tot)/(int)$varbaris);
  CloseDb();
	?>
	<td scope="row" align="left">
	<?
	if ($total!=0){
	?>
    Halaman : <select name="page" id="page" onChange="chg_page()">
	<? for ($p=1;$p<=$total;$p++){ ?>
		<option value="<?=$p-1?>" <?=StringIsSelected($page,$p-1)?>><?=$p;?></option>
	<? } ?>
	</select>&nbsp;dari&nbsp;<?=$total?>
	<? } ?>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tab" id="table">
  <tr>
    <th width="30" height="30" class="header" scope="row"><div align="center">No</div></th>
    <td width="56" height="30" class="header"><div align="center"><input type="checkbox" name="cek" id="cek" onClick="cek_all()" title="Pilih semua" onMouseOver="showhint('Pilih semua', this, event, '120px')"/></div></td>
    <td width="246" height="30" class="header"><div align="center">Pengirim</div></td>
    <td width="267" height="30" class="header" title="Lampiran"><div align="center">Lampiran</div></td>
    <td width="244" class="header"><div align="center">Judul</div></td>
    <!--<td width="191" height="30" class="header"><div align="center">Lampiran</div></td>-->
   	<td width="87" class="header"><div align="center">Tanggal</div></td>
   </tr>
  <?
  OpenDb();
  
  $sql1="SELECT d.replid as replid,d.judul as judul, d.pesan as pesan, d.idpengirim as nis, p.nama as nama,DATE_FORMAT(d.tanggalpesan, '%e %b %Y') as tanggal, TIME_FORMAT(d.tanggalpesan, '%H:%i') as waktu FROM jbsvcr.draft d, jbsakad.siswa p WHERE d.idpengirim=p.nis AND d.idpemilik='".SI_USER_ID()."' ORDER BY replid LIMIT ".(int)$page*(int)$varbaris.",$varbaris";
  //echo $sql1;
  $result1=QueryDb($sql1);
  if (@mysql_num_rows($result1)>0){
   if ($page==0){
  $cnt=1;
  } else {
  $cnt=(int)$page*(int)$varbaris+1;
  }
  $numpesan=@mysql_num_rows($result1);
  $count=1;
  while ($row1=@mysql_fetch_array($result1)){
  $depan="";
  $belakang="";
  $tr="";
  ?>
  <tr >
    <td height="25" scope="row"><div align="center">
      <?=$cnt;?>
    </div></th>
    <td height="25" align="center">
	<input type="checkbox" onclick="chg()" name="cekpesan<?=$count?>" id="cekpesan<?=$count?>"/>
	<input type="hidden" name="delete<?=$count?>" id="delete<?=$count?>"/>
	<input type="hidden" name="rep<?=$count?>" id="rep<?=$count?>" value="<?=$row1[replid]?>"/>	</td>
    <td height="25"><?=$depan?><?=$row1['nis']?>-<?=$row1['nama']?><?=$belakang?></td>
    <? 
	$sql2="SELECT direktori,namafile FROM jbsvcr.lampirandraft WHERE idpesan='$row1[replid]'";
	$result2=QueryDb($sql2); 
	?>
    <td width="267" height="25">
    <? while ($row2=@mysql_fetch_array($result2)){
		echo "<a title='Buka lampiran ini!' href=\"#\" onclick=newWindow('".$row2[direktori].$row2[namafile]."','View',640,480,'resizable=1'); ><img border='0' src='../../images/ico/titik.png' width='5' heiht='5'/> ".$row2['namafile']."</a><br>";
	} ?>    </td>
    <td height="25"><?=$depan?><a href="#" onClick="bacapesan('<?=$row1['replid']?>')">
	<? 
	$judul=substr($row1['judul'],0,20);
	if (strlen($row1['judul'])>20){
	echo $judul." ...";
	} else {
	echo $judul;
	}
	?></a><?=$belakang?></td>
    <td height="25"><?=$depan?><div align="center"><?=$row1['tanggal']?></div><?=$belakang?></td>
  </tr>
  <? 
  $cnt++;
	$count++;
  } 
  } else {?>
   <tr>
    <td scope="row" colspan="8"><div align="center">Tidak ada pesan siswa yang tersimpan di kotak Draft Anda</div></th>   </tr>
  <? } ?>
</table>
	</td>
  </tr>
</table>
<input type="hidden" name="numpesan" id="numpesan" value="<?=$numpesan?>">
<input type="hidden" name="listdel" id="listdel">
<input type="hidden" name="numdel" id="numdel">
<? if ($numpesan>0){ ?>
<input type="button" class="but" name="del_pesan" id="del_pesan" value="Hapus" onClick="delpesan()">
<? } ?>
</form>
</body>
</html>