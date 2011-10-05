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
require_once('../../include/db_functions.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/common.php');
require_once('../../include/config.php');
$op="";
if (isset($_REQUEST[op]))
	$op=$_REQUEST[op];
if ($op=="tambahkategori"){
	OpenDb();
	$sql="SELECT * FROM jbsvcr.chat";
	$result=QueryDb($sql);
	$i=0;
	while ($row=@mysql_fetch_array($result)){
	$chatkat[$i]=$row[kategori];
	$i++;
	}
	CloseDb();
}
if ($op=="hsa73hbjas7dbqi8d23hhhsda3"){
	$katbaru=$_REQUEST[kategoribaru];
	OpenDb();
	$sql="INSERT INTO jbsvcr.chat SET kategori='$katbaru'";
	$result=QueryDb($sql);
	if ($result){
	?>
	<script language="javascript">
		newWindow('chat.php?kat=<?=$katbaru?>','ChattingBaru','650','569','resizable=0,scrollbars=0,status=0,toolbar=0');
		window.close();
	</script>
	<?
	}
	CloseDb();
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<script language="javascript1.2" type="text/javascript" src="../../script/tools.js"></script>
<script language="javascript">
function simpankatbaru(){
	var jum=document.getElementById("numkat").value;
	//alert ('Jumlah '+jum);
	if (jum>0){
	for (x=0;x<=jum;x++){
		var katbaru=document.getElementById("kat").value;
		var kat=document.getElementById("listkat"+x).value;
		if (kat==katbaru){
			alert ('Kategori '+katbaru+' sudah digunakan\nSilakan gabung atau buat dengan nama lain !');
			document.getElementById("kat").value="";
			document.getElementById('kat').focus();
		} else {
			document.location.href="kategori.php?op=hsa73hbjas7dbqi8d23hhhsda3&kategoribaru="+katbaru;
		}
	}
	} else {
		var katbaru=document.getElementById("kat").value;
		document.location.href="kategori.php?op=hsa73hbjas7dbqi8d23hhhsda3&kategoribaru="+katbaru;
	}
}
function tambah_kat(){
	document.location.href="kategori.php?op=tambahkategori";
}
function pilihkat(){
	var katbaru=document.getElementById("kat").value;
	//alert ('Kate='+katbaru);
	newWindow('chat.php?kat='+katbaru,'ChattingBaru','650','569','resizable=0,scrollbars=0,status=0,toolbar=0');
	window.close();
}
</script>
</head>
<body>
<table width="261" border="1">
  <tr>
    <td colspan="2" class="header"><div align="center">Kategori Chatting</div></td>
  </tr>
  <? if ($op==""){ ?>
  <tr>
    <td width="48">Kategori</td>
    <td width="197"><label>
      <select name="kat" id="kat">
	  <?
	  OpenDb();
	  $sql="SELECT * FROM jbsvcr.chat";
	  $result=QueryDb($sql);
	  if (@mysql_num_rows($result)>0){
	  while ($row=@mysql_fetch_array($result)){
	  ?>
	  <option value="<?=$row[kategori]?>"><?=$row[kategori]?></option>
      <? 
		  } } else {
	  $dis=" disabled='disabled' ";
	  ?>
	  <option value="">Belum Ada kategori</option>
      <? } ?>
	  </select>
    </label><img src="../../images/ico/tambah.png" width="16" height="16" title="Tambah kategori" style="cursor:pointer;" onClick="tambah_kat();"/></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input name="pilih" type="button" class="but" id="pilih" value="Pilih" onclick="pilihkat()" <?=$dis?>/>      
      <input name="button" type="button" class="but" id="button" onClick="window.close();" value="Tutup"/>
    </div></td>
  </tr>
  <? } ?>

  <? if ($op=="tambahkategori"){ 
	for ($cnt=0;$cnt<=$i-1;$cnt++){
  ?>
  <input type="hidden" name="listkat<?=$cnt?>" id="listkat<?=$cnt?>" value="<?=$chatkat[$cnt]?>">
  <? } ?>
  <tr>
    <td width="48">Kategori</td>
    <td width="197"><input type="text" name="kat" id="kat" ><input type="hidden" name="numkat" id="numkat" value="<?=$i-1?>" ></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input name="pilih" type="button" class="but" id="pilih" value="Simpan & Pilih" onClick="simpankatbaru()"/>      
      <input name="button" type="button" class="but" id="button" onClick="window.close();" value="Batal"/>
    </div></td>
  </tr>
  <? } ?>
</table>

</body>
</html>