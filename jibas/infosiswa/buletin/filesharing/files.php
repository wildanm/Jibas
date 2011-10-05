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
require_once("../../include/config.php");
require_once("../../include/common.php");
require_once("../../include/sessioninfo.php");
require_once("../../include/db_functions.php");

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

$iddir = (int)$_REQUEST['iddir'];
if (($iddir == 0))
	exit();
$op = $_REQUEST['op'];
if ($op=="34983xihxf084bzux834hx8x7x93"){
$numdel = (int)$_REQUEST['numdel']-1;
$fileall=$_REQUEST["listdel"];
$x=0;
$file=explode("|",$fileall);
while ($x<=$numdel){
if ($file[$x]!=""){
		OpenDb();
		$sql = "SELECT d.dirfullpath,f.filename FROM jbsvcr.dirshare d, jbsvcr.fileshare f WHERE f.replid='$file[$x]' AND f.iddir=d.replid";
		//echo $sql;
		//exit;$UPLOAD_DIR = "C:\\\sharing\\";       $WEB_UPLOAD_DIR = "http://localhost/filesharing/";
		$result = QueryDb($sql);
		$row = @mysql_fetch_row($result);
		$dir = str_replace($WEB_UPLOAD_DIR,$UPLOAD_DIR,$row[0]);
		$phisycaldir = str_replace("/","\\",$dir);
		//echo $phisycaldir;
		//echo $phisycaldir.$row[1];
		//echo $fname;
		
		//exit;
		delete($phisycaldir.$row[1]);
		$sql3="DELETE FROM jbsvcr.fileshare WHERE replid='$file[$x]'";
		$result3=QueryDb($sql3);
}
$x++;
}
}

function FormatSize($value) {
	if (!is_numeric($value)) 
		return $value;
	
	$value = (int)$value;
	$negatif = false;
	if ($value < 0) {
		$negatif = true;
		$value = abs($value);
	}
		
	$duit = (string)$value;
	$duit = trim($duit);
	if (strlen($duit) == 0) return "";
	$len = strlen($duit);
	$nPoint = (int)($len / 3);
	if (($nPoint == 0) || ($len == 3))
		return $duit;
	//echo $nPoint . " --> ";
	//echo ($len % 3) . " --> ";
	if (($len % 3) == 0) 
		$nPoint--;
		
	$rp = "";
	for ($i = 0; $i < $nPoint; $i++) {
		$j = 0;
		$temp = "";
		while((strlen($duit) >= 0) && ($j++ < 3)) {
			$temp = substr($duit, strlen($duit) - 1, 1) . $temp;
			if (strlen($duit) >= 2)
				$duit = substr($duit, 0, strlen($duit) - 1);
			else
				$duit = "";
		}
		if (strlen($rp) > 0)
			$rp = $temp . "." . $rp;
		else
			$rp = $temp;		
	}
	if (strlen($duit) > 0)
		$rp = $duit . "." . $rp;
	
	return $rp;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="../../style/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" src="../../script/tools.js"></script>
<script language="javascript" src="../../script/tables.js"></script>
<script language="javascript">
function tambahfile(iddir){
	//alert (' '+fullpath+' '+dirfullpath);
	newWindow('addfile.php?iddir='+iddir,'InputFile','556','189','resizable=1,scrollbars=0,status=0,toolbar=0');
}
function openfile(addr){
	//alert ('Address '+addr);
	newWindow(addr,'OpenFile','556','189','resizable=1,scrollbars=0,status=0,toolbar=0');
}
function get_fresh(){
	document.location.href="files.php?iddir=<?=$iddir?>";
	//parent.dirs.get_fresh();
}
function cek_all() {
	var x;
	var jum = document.getElementById("numfile").value;
	var ceked = document.getElementById("cek").checked;
	for (x=1;x<=jum;x++){
		if (ceked==true){
			document.getElementById("cekfile"+x).checked=true;
		} else {
			document.getElementById("cekfile"+x).checked=false;
		}
	}
}
function del_all(){
	var x;
	var jum = document.getElementById("numfile").value;
	if (jum.length>0){
	if (confirm('Anda yakin akan menghapus seluruh file yang ada dalam folder ini?')){
		for (x=1;x<=jum;x++){
			document.getElementById("cekfile"+x).checked=true;
		}
		del();
	}
	}
	
}
function del_file(){
	if (confirm('Anda yakin akan menghapus file ini ?'))
	del();
}
function del(){
	var x;
	var y=0;
	var iddir = document.getElementById("iddir").value;
	var jum = document.getElementById("numfile").value;
		for (x=1;x<=jum;x++){
		var ceked = document.getElementById("cekfile"+x).checked;
		var rep = document.getElementById("rep"+x).value;
		var listdel=document.getElementById('listdel').value;
		if (ceked==true){
			if (y==0)
				y=y+1;
			document.getElementById('listdel').value=listdel+rep+"|";
			document.getElementById('numdel').value=y++;
		}
	}
	var num = document.getElementById("numdel").value;
	var list = document.getElementById("listdel").value;
	if (list.length==0){
		alert ('Minimal ada satu file yang akan dihapus');
		return false;
	} 
			document.location.href="files.php?op=34983xihxf084bzux834hx8x7x93&listdel="+list+"&numdel="+num+"&iddir="+iddir;
	
}
</script>
</head>
<body>
<form name="file_list">
<input type="hidden" name="iddir" id="iddir" value="<?=$iddir?>">
<br /><br />
<?
OpenDb();
$sql = "SELECT dirfullpath FROM jbsvcr.dirshare WHERE idroot=0";
$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$rootname = $row[0];

$sql = "SELECT dirfullpath,idguru FROM jbsvcr.dirshare WHERE replid='$iddir'";
$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$idguru = $row[1];
$dfullpath = $row[0];
$fullpath = str_replace($rootname, "", $dfullpath);
//echo $dfullpath;
?>
<font size="3" color="#000033">f i l e s</font>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
	<td width="46%" align="left">Content of: <font size="2" color="#990000"><em><strong>&nbsp;<?="(root)/".$fullpath; ?></strong></em></font></td>
    <td width="54%" align="right"><? if (SI_USER_ID()==$idguru){?><a href="#" onclick="tambahfile('<?=$iddir?>')"><img src="../../images/ico/tambah.png" border="0" />&nbsp;Tambah File</a><? } ?>&nbsp;&nbsp;<a href="#" onclick="document.location.reload()"><img src="../../images/ico/refresh.png" border="0" />&nbsp;Refresh</a>&nbsp;&nbsp;</td>
</tr>
<tr>
  <td align="left">&nbsp;</td>
  <td align="right"></td>
</tr>
</table>
<br />
<table border="1" style="border-collapse:collapse" cellpadding="2" cellspacing="2" width="100%" class="tab" id="table">
<tr height="30">
	<td width="2%" align="center" class="header">No</td>
    <? if (SI_USER_ID()==$idguru){ ?>
	<td width="3%" align="center" class="header">
	<input type="checkbox" name="cek" id="cek" onClick="cek_all()" title="Pilih semua" onMouseOver="showhint('Pilih semua', this, event, '120px')"/>
	</td>
	<? } ?>
    <td width="60%" align="center" class="header">Name</td>
    <td width="12%" class="header" align="center">Size</td>
    <td width="22%" align="center" class="header">Date</td>
</tr>
<?
$sql = "SELECT replid,filename, filesize, date_format(filetime, '%d-%b-%Y %h:%i:%s') as filetime FROM jbsvcr.fileshare WHERE iddir='$iddir' ORDER BY filename";
$result = QueryDb($sql);
$numfile = @mysql_num_rows($result);
$cnt = 1;
if ($numfile>0){
while ($row = mysql_fetch_array($result)) {
?>
<tr height="25">
	<td align="center"><?=$cnt ?></td>
    <? if (SI_USER_ID()==$idguru){ ?>
	<td align="center">
	<input type="checkbox" onclick="chg('<?=$cnt?>')" name="cekfile<?=$cnt?>" id="cekfile<?=$cnt?>"/>
	<input type="hidden" name="delete<?=$cnt?>" id="delete<?=$cnt?>"/>
	<input type="hidden" name="rep<?=$cnt?>" id="rep<?=$cnt?>" value="<?=$row[replid]?>"/>
	</td>
	<? } ?>
    <td align="left"><a href="<?=$WEB_UPLOAD_DIR?>fileshare/<?=$fullpath.$row[filename]?>" target="_blank"><?=$row['filename'] ?></a></td>
    <td align="right"><!---->
<? 
	$filesize = $row['filesize'];
	if ($filesize < 1024) {
		echo $filesize . " B";
	} else {
		$filesize = round($filesize / 1024);
		
		echo FormatSize($filesize) . " KB";
	}	
?></td>
    <td align="center"><?=$row['filetime'] ?></td>
</tr>
<?
$cnt++; } } else {
?>
<tr><td colspan="5" align="center">Tidak ada file dalam folder ini</td></tr>
<?
}
CloseDb();
?>
<input type="hidden" name="numfile" id="numfile" value="<?=$numfile?>">
<input type="hidden" name="listdel" id="listdel">
<input type="hidden" name="numdel" id="numdel">

</table>
<? if ($numfile>0 && SI_USER_ID()==$idguru){ ?>
<input type="button" class="but" name="del" id="del" value="Hapus Semua" onClick="del_all()">
<input type="button" class="but" name="del2" id="del2" value="Hapus yang dipilih" onClick="del_file()">
<? } ?>
</form>
<script language='JavaScript'>
	    Tables('table', 1, 0);
</script>
</body>
</html>