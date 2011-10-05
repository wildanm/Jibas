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
require_once('../include/common.php');
require_once('../include/sessioninfo.php');
require_once('../include/config.php');
require_once('../include/getheader.php');
require_once('../include/db_functions.php');
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
$idguru=SI_USER_ID();	
if (isset($_REQUEST['simpan'])){
	$dt=0;
$st=0;
if (isset($_REQUEST['dotnet']))
	$dt=1;
if (isset($_REQUEST['situs']))
	$st=1;
if ($dt==1){
	if ($st==1)
		$tampil=3;
	else
		$tampil=2;
} else {
	if ($st==1)
		$tampil=1;
	else
		$tampil=0;
}
$tgl=explode("-",$_REQUEST['tanggal']);
$tanggal=$tgl[2]."-".$tgl[1]."-".$tgl[0];
	$foto=$_FILES["gambar"];
  	$uploadedfile = $foto['tmp_name'];
	$uploadedtypefile = $foto['type'];
  	$uploadedsizefile = $foto['size'];
	if (strlen($uploadedfile)!=0){
  	if($uploadedtypefile=='image/jpeg')
    	$src = imagecreatefromjpeg($uploadedfile);
OpenDb();
$sql="SELECT replid,buletin FROM jbsvcr.buletin ORDER BY replid DESC LIMIT 1";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);
$fname = (int)$row[replid]+1;
CloseDb();
	$filename = $fname.".jpg";
	list($width,$height)=getimagesize($uploadedfile);
   	if ($width<$height){
	$newheight=640;
   	$newwidth=480;
	} else if ($width>$height){
	$newwidth=640;
   	$newheight=480;
	}
	$tmp=imagecreatetruecolor($newwidth,$newheight);
  	imagecopyresampled($tmp,$src,0,0,0,0,$newwidth,$newheight,$width,$height);
  	imagejpeg($tmp,$filename,50);
	imagedestroy($src);
  	imagedestroy($tmp); // NOTE: menghapus file di temp
	$foto_data=addslashes(fread(fopen($filename,"r"),filesize($filename)));
	}
	if ($foto_data!=""){
		$gambar=",gambar='$foto_data'";
	}
OpenDb();
$bln=date(m);
if (strLen($bln)<2){
$bln="0".$bln;
}
$thn=date(Y);
$tgl=date(j);
if (strLen($tgl)<2){
$tgl="0".$tgl;
}
$jam=date(H).":".date(i).":00";
$sql_client="SELECT * FROM jbsclient.localinfo ORDER BY region,location,clientid";
$result_client=QueryDb($sql_client);
$row_client=@mysql_fetch_array($result_client);
$sql="INSERT INTO jbsvcr.buletin SET region='$row_client[region]',location='$row_client[location]',clientid='$row_client[clientid]', tempatbuletin='$_REQUEST[tempat]',tanggalinput='".$thn."-".$bln."-".$tgl." ".$jam."',tanggalbuletin='$tanggal',judul='$_REQUEST[judul]',idpengirim='$idguru',buletin='$_REQUEST[buletin]',approved=0,tampil=$tampil $gambar";
//echo $sql;
//exit;
$result=QueryDb($sql);
$sql2="SELECT replid,buletin FROM jbsvcr.buletin ORDER BY replid DESC LIMIT 1";
$result2=QueryDb($sql2);
$row2=@mysql_fetch_array($result2);
$bul=str_replace('../upload/imagetiny/','../library/gambar.php?replid=',$row2[buletin]);
$bul2=str_replace('.jpg','&table=jbsvcr.gambarbuletin',$bul);
$sql3="UPDATE jbsvcr.buletin SET buletin='$bul2' WHERE replid=$row2[replid]";
QueryDb($sql3);
$sql5="SELECT filename FROM jbsvcr.gambarbuletin ORDER BY replid ";
$result5=QueryDb($sql5);
while ($row5=@mysql_fetch_array($result5)){
delete ($row5[filename]);
}
if ($result){
	
	?><script language="javascript" type="text/javascript">
		//alert ('Buletin sudah disimpan,\nBuletin akan ditampilkan setelah di ACC oleh Administrator');
		opener.get_fresh();	
		window.close();
	</script><?
}
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="../style/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../style/calendar-win2k-1.css">
<script type="text/javascript" src="../script/calendar.js"></script>
<script type="text/javascript" src="../script/lang/calendar-en.js"></script>
<script type="text/javascript" src="../script/calendar-setup.js"></script>
<script language="javascript" src="../script/ajax.js"></script>
<script src="../script/SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
<link href="../script/SpryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
<script src="../script/SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="../script/SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../script/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		skin : "o2k7",
		skin_variant : "silver",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",		
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect,forecolor,backcolor,fullscreen,print",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,|,search,replace,|,bullist,numlist,|,hr,removeformat,|,sub,sup,|,charmap,image,|,tablecontrols",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : false,
		content_css : "../../style/content.css"
	});
	
	
	function OpenUploader() {
	    var addr = "UploaderMain.aspx";
	    newWindow(addr, 'Uploader','720','630','resizable=1,scrollbars=1,status=0,toolbar=0');
    }
function validate(){
	var judul=document.getElementById('judul').value;
	var tempat=document.getElementById('tempat').value;
	var buletin=tinyMCE.get('buletin').getContent();
	if (judul.length==0){
		alert ('Anda harus mengisikan data untuk Judul Buletin');
		document.getElementById('judul').focus();
		return false;
	}
	if (tempat.length==0){
		alert ('Anda harus mengisikan data untuk Tempat Buletin');
		document.getElementById('tempat').focus();
		return false;
	}
	if (buletin.length==0){
		alert ('Anda harus mengisikan data untuk Buletin');
		document.getElementById('buletin').focus();
		return false;
	}
	var ext=document.getElementById("ext").value;
	var gambar=document.getElementById("gambar").value;
		if (gambar.length>0){
			if (ext!='.JPG' && ext!='.jpg' && ext!='.Jpg' && ext!='.JPg' && ext!='.JPEG' && ext!='.jpeg'){
				alert ('Format Gambar harus ber-extensi jpg atau JPG !');
				document.getElementById("gambar").value='';
				document.getElementById("tr").style.background = "#FF8080" ;
				return false;
			} 
		}
	return true;
}
function chg(){
	var x=document.getElementById("gambar").value;
	if (x.length>0){
		var result = '';
		var i=0;
		var xxx='';
		while (i <= x.length - 1){
			if (x.charAt(i)=='.'){
				xxx=x.charAt(i);
			}
			if (xxx.length>0){
				result = result + x.charAt(i);
			}
			i++;
		}
	document.getElementById("ext").value = result;
	document.getElementById("tr").style.background = "#e7e7cf" ;
	}
}
function chg_kat(){
	show_wait("subkat_info");
	var kat = document.getElementById("kat").value;
	sendRequestText("get_sub.php", show_content, "kat="+kat);
}
function show_content(x) {
	document.getElementById("subkat_info").innerHTML = x;
}
function show_wait(areaId) {
	var x = document.getElementById("waitBox").innerHTML;
	document.getElementById(areaId).innerHTML = x;
}
</script>
</head>
<body onLoad="document.getElementById('kat').focus();">
<div id="waitBox" style="position:absolute; visibility:hidden;">
<img src="../images/ico/movewait.gif" border="0" />Silahkan&nbsp;tunggu...
</div>
<form name="frmbuletin" id="frmbuletin" action="buletin_add.php" method="post" onSubmit="return validate()" enctype="multipart/form-data">
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td scope="row" align="left"><strong><font size="2" color="#999999">Berita Baru :</font></strong><br /><br /></td>
  </tr>
  <tr>
    <td scope="row" align="left">
    <table width="100%" border="0" cellspacing="0" >
  <tr>
    <td height="25" scope="row"><div align="left">Kategori</div></td>
    <td height="25" colspan="2">
    <!--<select name="kat" size="1" id="kat" onChange="chg_kat()">
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
    </select>-->
    <input type="text" id="kat" name="kat" />     </td>
  </tr>
  <tr>
    <th height="25" rowspan="2" scope="row">&nbsp;</th>
    <td width="2%" height="12">
    <input type="checkbox" name="dotnet" id="dotnet" /></td>
    
    <td width="86%">Tampilkan di Jibas[dot]Net </td>
  </tr>
  <tr>
    <td height="13"><input type="checkbox" name="situs" id="situs" /></td>
    <td height="13">Tampilkan di Situs Sekolah</td>
    <td width="0%">&nbsp;</td>
  </tr>
	<!--  <tr>
    <th height="25" scope="row"><div align="left"></div></th>
    <td height="25" colspan="2">
    <? //if ($numkat!=0){ ?>
<div id="subkat_info">
    <select name="subkat" size="1" id="subkat">
    	<? 
		/*OpenDb();
		$sql="SELECT * FROM jbsvcr.subkategoribuletin WHERE kategori='$kat' ORDER BY subkategori";
		$result=QueryDb($sql);
		if (@mysql_num_rows($result)>0){
		while ($row=@mysql_fetch_array($result)){
		if ($subkat=="")
			$subkat=$row[replid];
		*/
		?>
        <option value="<?=$row[replid]?>" <?=StringIsSelected($row[replid],$subkat)?>><?=$row[subkategori]?></option>
        <?
		//}
		//} else {
		?>
        <option value="">Tidak ada sub kategori</option>
        <?
		//}
		//CloseDb();
		?>
    </select>
	</div>
    <? //} ?>    </td>
  </tr>-->
  <tr>
    <th width="12%" height="25" scope="row"><div align="left">Judul</div></th>
    <td colspan="2"><input type="text" name="judul" id="judul" size="50" /></td>
  </tr>
  <tr>
    <th height="25" scope="row"><div align="left">Tanggal</div></th>
    <td colspan="2"><input title="Klik untuk membuka kalender !" type="text" name="tanggal" id="tanggal" size="25" readonly="readonly" class="disabled" value="<?=date(d)."-".date(m)."-".date(Y); ?>"/><img title="Klik untuk membuka kalender !" src="../images/ico/calendar_1.png" name="btntanggal" width="16" height="16" border="0" id="btntanggal"/></td>
  </tr>
  <tr>
    <th height="25" valign="top" scope="row"><div align="left">Tempat</div></th>
    <td colspan="2"><input name="tempat" type="text" id="tempat" value="" /></td>
  </tr>
  <tr>
    <th valign="top" scope="row"><div align="left">Buletin</div></th>
    <td colspan="2"><textarea name="buletin" id="buletin" rows="20"></textarea></td>
  </tr>
  <tr id="tr" style="visibility:hidden;">
    <th valign="top" scope="row"><div align="left">Gambar</div></th>
    <td colspan="2"><label>
      <input type="file" name="gambar" id="gambar" onChange="chg()" /><input type="hidden" name="ext" id="ext" />
    </label></td>
  </tr>
  <tr>
    <th colspan="3" scope="row" align="center" bgcolor="#FFFFFF" height="30">
      <input class="but" type="submit" name="simpan" id="simpan" value="Simpan" title="Simpan buletin ini !"/>
    &nbsp;<input style="visibility:hidden;" class="but" type="button" name="batal" id="batal" value="Batal" onClick="window.close();" title="Batalkan Tutup jendela ini"/></th>
    </tr>
</table>
    </td>
  </tr>
</table>
</form>
</body>
<script type="text/javascript">
  Calendar.setup(
    {
	  inputField  : "tanggal",         
      ifFormat    : "%d-%m-%Y",  
      button      : "btntanggal"    
    }
   );
   Calendar.setup(
    {
	  inputField  : "tanggal",      
      ifFormat    : "%d-%m-%Y",   
      button      : "tanggal"     
    }
   );
  
</script>
</html>
<script language="javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("judul");
var sprytextfield2 = new Spry.Widget.ValidationTextField("tempat");
var sprytextfield3 = new Spry.Widget.ValidationTextField("kat");

</script>