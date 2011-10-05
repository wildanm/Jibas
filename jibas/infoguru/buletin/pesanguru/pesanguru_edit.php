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
require_once('../../include/db_functions.php');
$replid="";
if (isset($_REQUEST['replid']))
	$replid=$_REQUEST['replid'];
$hapus="";
if (isset($_REQUEST['hapus']))
	$hapus=$_REQUEST['hapus'];
$del1="0";
if (isset($_REQUEST['del1']))
	$del1=$_REQUEST['del1'];
$del2="0";
if (isset($_REQUEST['del2']))
	$del2=$_REQUEST['del2'];
$del3="0";
if (isset($_REQUEST['del3']))
	$del3=$_REQUEST['del3'];
$idguru=SI_USER_ID();
OpenDb();
$sql="SELECT judul,isi,replid,abstrak,DATE_FORMAT(tanggal,'%d-%m-%Y') as tanggal FROM jbsvcr.beritaguru WHERE replid='$replid'";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);

$sql1="SELECT namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$replid' LIMIT 0,1";
$result1=QueryDb($sql1);
$row1=@mysql_fetch_array($result1);

$sql2="SELECT namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$replid' LIMIT 1,1";
$result2=QueryDb($sql2);
$row2=@mysql_fetch_array($result2);

$sql3="SELECT namafile FROM jbsvcr.lampiranberitaguru WHERE idberita='$replid' LIMIT 2,1";
$result3=QueryDb($sql3);
$row3=@mysql_fetch_array($result3);
//echo $sql1."<br>".$sql2."<br>".$sql3;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../../style/calendar-win2k-1.css">
<script type="text/javascript" src="../../script/calendar.js"></script>
<script type="text/javascript" src="../../script/lang/calendar-en.js"></script>
<script type="text/javascript" src="../../script/calendar-setup.js"></script>
<script language="javascript" src="../../script/tables.js"></script>
<script src="../../script/SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<link href="../../script/SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="../../script/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",		
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect,forecolor,backcolor,fullscreen,print",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,code,|,preview,|,forecolor,backcolor",
		theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,iespell,media,advhr",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : false,
		content_css : "style/word.css"
	});
	
	
	function OpenUploader() {
	    var addr = "UploaderMain.aspx";
	    newWindow(addr, 'Uploader','720','630','resizable=1,scrollbars=1,status=0,toolbar=0');
    }
function validate(){
	var judul=document.getElementById('judul').value;
	var abstrak=tinyMCE.get('abstrak').getContent();
	var isi=tinyMCE.get('isi').getContent();
	if (judul.length==0){
		alert ('Anda harus mengisikan data untuk Judul Berita');
		document.getElementById('judul').focus();
		return false;
	}
	if (abstrak.length==0){
		alert ('Anda harus mengisikan data untuk Abstraksi Berita');
		document.getElementById('abstrak').focus();
		return false;
	}
	if (isi.length==0){
		alert ('Anda harus mengisikan data untuk Isi Berita');
		document.getElementById('isi').focus();
		return false;
	}
	return true;
}
function hapusfile1(){
	var d1 = document.getElementById('d1').value ;
	if(d1 == 0){
	   document.getElementById('d1').value = 1;
	   document.getElementById('tr1').style.background = "#FF8080" ;
	} else {
	   document.getElementById('d1').value = 0;
	   document.getElementById('tr1').style.background = "#FFFFFF" ;
	}
}
function hapusfile2(){
	var d2 = document.getElementById('d2').value ;
	if(d2 == 0){
	   document.getElementById('d2').value = 1;
	   document.getElementById('tr2').style.background = "#FF8080" ;
	} else {
	   document.getElementById('d2').value = 0;
	   document.getElementById('tr2').style.background = "#FFFFFF" ;
	}
}
function hapusfile3(){
	var d3 = document.getElementById('d3').value ;
	if(d3 == 0){
	   document.getElementById('d3').value = 1;
	   document.getElementById('tr3').style.background = "#FF8080" ;
	} else {
	   document.getElementById('d3').value = 0;
	   document.getElementById('tr3').style.background = "#FFFFFF" ;
	}
}
</script>
</head>
<body onload="document.getElementById('judul').focus();">
<form name="beritaguru" id="beritaguru" action="beritaguru_add_simpan.php" method="post" onsubmit="return validate()" enctype="multipart/form-data">
<input type="hidden" name="replid" id="replid" value="<?=$replid?>" />
<input type="hidden" name="sender" id="sender" value="ubah" />

<table width="100%" border="0" cellspacing="0">
  <tr>
    <td scope="row" align="center"><strong>Ubah Berita</strong></td>
  </tr>
  <tr>
    <td scope="row" align="left">
    <table width="100%" border="1" cellspacing="0" class="tab" id="table">
  <tr style="background-color:#e7e7cf;">
    <th width="6%" scope="row">Judul</th>
    <td colspan="2"><input type="text" name="judul" id="judul" size="50" value="<?=$row['judul']?>"/></td>
  </tr>
  <tr>
    <th scope="row">Tanggal</th>
    <td colspan="2"><input title="Klik untuk membuka kalender !" type="text" name="tanggal" id="tanggal" size="25" readonly="readonly" class="disabled" value="<?=$row['tanggal']?>"/><img title="Klik untuk membuka kalender !" src="../../images/ico/calendar_1.png" name="btntanggal" width="16" height="16" border="0" id="btntanggal"/></td>
  </tr>
  <tr>
    <th valign="top" scope="row">Abstrak</th>
    <td colspan="2"><textarea name="abstrak" id="abstrak"><?=$row['abstrak']?></textarea></td>
  </tr>
  <tr>
    <th valign="top" scope="row">Isi</th>
    <td colspan="2"><textarea name="isi" id="isi"><?=$row['isi']?></textarea></td>
  </tr>
  <tr>
    <th colspan="3" scope="row" align="left" bgcolor="#FFFFFF" height="30"><fieldset><legend>Lampiran</legend>
    <table width="100%" border="1" cellspacing="0">
  <tr id="tr1" >
    <th width="2%" scope="row">#1</th>
    <th width="36%" scope="row"><?=$row1['namafile']?></th>
    <th width="62%" scope="row"><div align="left"><img src="../../images/ico/hapus.png" onclick="hapusfile1()" title="Hapus file ini !" style="cursor:pointer" /><input type="hidden" size="1" name="d1" id="d1" value="0"/></div></th>
  </tr>
  <tr id="tr2" >
    <th scope="row">#2</th>
    <th scope="row"><?=$row2['namafile']?></th>
    <th scope="row"><div align="left"><img src="../../images/ico/hapus.png" onclick="hapusfile2()" title="Hapus file ini !" style="cursor:pointer" /><input type="hidden" name="d2" id="d2" size="1" value="0" /></div></th>
  </tr>
  <tr id="tr3" >
    <th scope="row">#3</th>
    <th scope="row"><?=$row3['namafile']?></th>
    <th scope="row"><div align="left"><img src="../../images/ico/hapus.png" onclick="hapusfile3()" title="Hapus file ini !" style="cursor:pointer" />
<input type="hidden" name="d3" size="1" id="d3" value="0" /></div></th>
  </tr>
</table>
 </fieldset></th>
  </tr>
  <tr>
    <th colspan="3" scope="row" align="left" bgcolor="#FFFFFF">
  	Lampiran Baru :   </th>
    </tr>
  <tr>
    <th colspan="2" scope="row" align="center" bgcolor="#FFFFFF"><div align="right">#1</div></th>
    <th width="89%" align="center" bgcolor="#FFFFFF" scope="row">
      <div align="left">
        <input size="25" type="file" name="file1" />
      </div></th>
  </tr>
  <tr>
    <th colspan="2" align="center" bgcolor="#FFFFFF" scope="row"><div align="right">#2</div></th>
    <th scope="row" align="center" bgcolor="#FFFFFF">
      <div align="left">
        <input size="25" type="file" name="file2" />
      </div></th>
  </tr>
  <tr>
    <th colspan="2" align="center" bgcolor="#FFFFFF" scope="row"><div align="right">#3</div></th>
    <th scope="row" align="center" bgcolor="#FFFFFF">
      <div align="left">
        <input size="25" type="file" name="file3" />
      </div></th>
  </tr>
  <tr>
    <th colspan="3" scope="row" align="center" bgcolor="#FFFFFF" height="30">
      <input class="but" type="submit" name="simpan" id="simpan" value="Simpan" title="Simpan berita ini !"/>
    &nbsp;<input class="but" type="button" name="batal" id="batal" value="Batal" onclick="window.self.history.back();" title="Batalkan dan kembali ke Halaman Berita"/></th>
    </tr>
</table>
<script language='JavaScript'>
			Tables('table', 1, 0);
		</script>

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
</script>