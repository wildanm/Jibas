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
require_once("../include/sessioninfo.php");
require_once("../include/db_functions.php");
require_once("../include/config.php");
require_once("../include/common.php");
require_once("../sessionchecker.php");
$kat="";
if (isset($_REQUEST[kat]))
	$kat=$_REQUEST[kat];
$subkat="";
if (isset($_REQUEST[subkat]))
	$subkat=$_REQUEST[subkat];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="../script/tools.js"></script>
<script language="javascript" type="text/javascript">
function tambah(){
	newWindow('buletin_add.php', 'TambahBuletin','648','472','resizable=1,scrollbars=0,status=0,toolbar=0')
}
function get_fresh(){
	document.location.href="buletin.php";
}
function bacabuletin(replid){
	document.location.href="baca_buletin.php?replid="+replid;
}
function chg_kat(){
	var kat=document.getElementById("kat").value;
	document.location.href="buletin.php?kat="+kat;
}
function chg_sub_kat(){
	var kat=document.getElementById("kat").value;
	var subkat=document.getElementById("subkat").value;
	document.location.href="buletin.php?kat="+kat+"&subkat="+subkat;
}
</script>
<link href="../style/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {color: #666666}
-->
</style>
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0">
  <tr>
    <th scope="row" align="right">&nbsp;&nbsp;<font size="5" style="background-color:#ffcc66">&nbsp;</font>&nbsp;<font size="3" face="Arial" color="Gray"><strong>BULETIN JIBAS.NET</strong></font><br /><br /></th>
  </tr><br />
  <tr>
    <th scope="row">
    <div align="left">
    <table width="320" border="0" cellspacing="0">
  <tr>
    <th width="140" scope="row"><div align="left">Kategori</div></th>
    <td width="172"><select name="kat" size="1" id="kat" onchange="chg_kat()">
    	<? 
		OpenDb();
		$sql="SELECT * FROM jbsvcr.kategoribuletin ORDER BY replid";
		$result=QueryDb($sql);
		$numkat=@mysql_num_rows($result);
		if ($numkat>0){
		while ($row=@mysql_fetch_array($result)){
		if ($kat=="")
			$kat=$row[kategori];
		?>
        <option value="<?=$row[kategori]?>" <?=StringIsSelected($row[kategori],$kat)?>><?=$row[kategori]?></option>
        <?
		}
		} else {
		?>
        <option value="">Tidak ada kategori</option>
        <?
		}
		CloseDb();
		?>
    </select></td>
  </tr>
  <tr>
    <th width="140" scope="row"><div align="left">Sub Kategori</div></th>
    <td><select name="subkat" size="1" id="subkat" onchange="chg_sub_kat()">
    	<? 
		OpenDb();
		$sql="SELECT * FROM jbsvcr.subkategoribuletin WHERE kategori='$kat' ORDER BY subkategori";
		$result=QueryDb($sql);
		if (@mysql_num_rows($result)>0){
		while ($row=@mysql_fetch_array($result)){
		if ($subkat=="")
			$subkat=$row[replid];
		?>
        <option value="<?=$row[replid]?>" <?=StringIsSelected($row[replid],$subkat)?>><?=$row[subkategori]?></option>
        <?
		}
		} else {
		?>
        <option value="">Tidak ada sub kategori</option>
        <?
		}
		CloseDb();
		?>
	</select></td>
  </tr>
</table>
    </div><br />

<table width="100%" border="0" cellspacing="0" id="bul_content">
  
<? if ($subkat!=""){ ?>    
<?
OpenDb();
$sql="SELECT *,DATE_FORMAT(tanggalinput, '%H:%i:%s') as jam FROM jbsvcr.buletin WHERE approved=1 AND idkategori=$subkat ORDER BY tanggalbuletin DESC";
$result=QueryDb($sql);
$numbul=@mysql_num_rows($result);
if ($numbul>0){
while ($row=@mysql_fetch_array($result)){
$sql2="SELECT nama FROM jbsakad.siswa WHERE nis='$row[idpengirim]'";
$result2=QueryDb($sql2);
if (@mysql_num_rows($result2)>0){
	$row2=@mysql_fetch_array($result2);
	$nama=$row2[nama];
} else {
	$sql3="SELECT nama FROM jbssdm.pegawai WHERE nip='$row[idpengirim]'";
	$result3=QueryDb($sql3);
	if (@mysql_num_rows($result3)>0){
	$row3=@mysql_fetch_array($result3);
	$nama=$row3[nama];
	} else {
	$nama="Administrator JIBAS INFOGURU";
	}
}
?>
<tr>
    <th scope="row">
<table width="80%" border="1" style="border:dotted; border-color:#999999;" align="center">
  <tr>
    <td>
	  <div align="left"><em><font color="#006666" size="1" face="Verdana, Arial, Helvetica, sans-serif"><?=$row['tempatbuletin']?>, <?=LongDateFormat($row['tanggalbuletin'])?></font></em><br />
      <em><a style="text-decoration:none; text-shadow:#00FF00;" href="#" onclick="bacabuletin('<?=$row[replid]?>')" ><font color="#0000FF"><?=$row['judul']?></font></a></em><br /><br />
      <font size="2" face="Arial">
	  <?=removetag($row['buletin'],500)."..."?>
	  <?//=$row['buletin']?>
	  </font><br /><br />
      </div>
	  
	  </td>
  </tr>
  <tr style="border:none;">
  <td><div align="right"><img src="../images/ico/arr1.gif" />&nbsp;&nbsp;<a href="#" onclick="bacabuletin('<?=$row[replid]?>')" >Baca Selengkapnya</a></div><div align="left"><font color="#666666" size="1" face="Arial"><br /><em>Posted By : <?=$nama?>&nbsp; ,On : <?=LongDateFormat($row['tanggalbuletin'])?>&nbsp;<?=$row['jam']?></em></font></div></td>
  </tr>
</table>
	</th>
  		</tr>
  	<tr>
    	<th scope="row">&nbsp;</th>
  	</tr>
<? 
}
}
} else {
?>
<tr>
    <th scope="row">
<table width="80%" border="1" style="border:dotted; border-color:#999999;" align="center">
  <tr>
    <td><br /><div align="center"><span class="style1">Tidak ada Buletin yang sesuai dengan sub kategori terpilih</span></div><br /></td>
  </tr>
</table>
	</th>
  		</tr>
  	<tr>
    	<th scope="row">&nbsp;</th>
  	</tr>
<? } ?>
</table>
    </th>
  </tr>
</table>
</body>
</html>
<? CloseDb(); ?>