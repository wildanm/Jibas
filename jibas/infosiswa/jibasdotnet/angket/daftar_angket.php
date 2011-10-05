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
 require_once('../../include/sessioninfo.php');
 require_once('../../include/common.php');
 require_once('../../include/config.php');
require_once('../../include/getheader.php');
 require_once('../../include/db_functions.php');
 $op = $_REQUEST['op'];
 if ($op == "xm8r389xemx23xb2378e23") {
	OpenDb();
	$sql = "DELETE FROM jbsvcr.angket WHERE replid = '$_REQUEST[replid]'";	
	QueryDb($sql);		
	CloseDb();	
 }	
 $tahun=$_REQUEST['tahun'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" src="../../script/ajax.js"></script>
<script language="javascript" src="../../script/tables.js"></script>
<link rel="stylesheet" type="text/css" href="../../style/style.css">
<script language="javascript">
function tampil(replid,judul,tglmulai,tglakhir,jenis) {	
	parent.content.location.href = "list_angket.php?replid="+replid+"&judul="+judul+"&tglmulai="+tglmulai+"&tglakhir="+tglakhir+"&jenis="+jenis;
}
	var win = null;
function newWindow(mypage,myname,w,h,features) {
      var winl = (screen.width-w)/2;
      var wint = (screen.height-h)/2;
      if (winl < 0) winl = 0;
      if (wint < 0) wint = 0;
      var settings = 'height=' + h + ',';
      settings += 'width=' + w + ',';
      settings += 'top=' + wint + ',';
      settings += 'left=' + winl + ',';
      settings += features;
      win = window.open(mypage,myname,settings);
      win.window.focus();
}

function refresh() {	
	document.location.href = "daftar_angket.php";
}

function hapus(replid) {
	if (confirm("Apakah anda yakin akan menghapus judul angket ini?"))
		document.location.href = "daftar_angket.php?op=xm8r389xemx23xb2378e23&replid="+replid;
}
</script>
</head>
<body>
<table width="100%" border="0">
  <tr>
    <td colspan="3">Daftar Angket</td>
  </tr>
  <tr>
    <td width="45">Tahun : </td>
    <td width="118" align="left">
    <select name="tahun" id="tahun" onChange="change_thn()" style="width:100px">        	
       <option value="2008"> 2008 </option>
       <option value="2009"> 2009 </option>
       <option value="2009"> 2010 </option>
       <option value="2009"> 2011 </option>
       <option value="2009"> 2012 </option>
       <option value="2009"> 2013 </option>
       <option value="2009"> 2014 </option>
       <option value="2009"> 2015 </option>
	</select></td>
    <td width="37">    </td>
  </tr>
  <tr>
    <td colspan="3">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="right"><a href="#" onClick="newWindow('../angket/Angket_add.php','','500','250','resizable=0,scrollbars=1,status=0,toolbar=0')">
    	<img src="../../images/ico/tambah.png" alt="tambah" width="16" height="16" border="0"/>Tambah</a></td>
  </tr>
</table>

    <table class="tab" id="table" border="0" cellpadding="2" style="border-collapse:collapse" cellspacing="2" width="100%" align="left">
    <!-- TABLE CONTENT -->
    
    <tr height="30">    	
    	<td width="13%" class="header" align="center">No</td>
        <td colspan="2" align="center" class="header">Judul</td>
    </tr>
    <? 	OpenDb();		
	  $sql = "SELECT DISTINCT p.judul, p.tglmulai, p.tglakhir, p.jenis, p.replid FROM jbsvcr.angket p ORDER BY replid DESC";
		//echo '<br> sql '.$sql;
		$result = QueryDb($sql); 				
		while ($row = @mysql_fetch_array($result)) {
	?>
    <tr>   	
       	<td height="25" align="center" style="cursor:pointer"><?=++$cnt?></td>
        <td height="25" style="cursor:pointer" width="65%" onclick="tampil('<?=$row[4]?>','<?=$row[0]?>','<?=$row[1]?>','<?=$row[2]?>','<?=$row[3]?>')"><?=$row[0]?></td>
        <td width="22%" style="cursor:pointer"><a href="#" onclick="newWindow('../angket/Angket_edit.php?replid=<?=$row[4]?>','','500','250','resizable=0,scrollbars=1,status=0,toolbar=0')" style="cursor:pointer;" title="Edit Berita ini !">
           <img src="../../images/ico/ubah.png" alt="edit" style="border:0"/></a>&nbsp;&nbsp;<a href="#" onclick="hapus('<?=$row[4]?>')" style="cursor:pointer;" title="Hapus Berita ini !"><img src="../../images/ico/hapus.png" alt="hapus" style="border:0px;"/></a></td>
    </tr>
    <? 	} ?>
    <!-- END TABLE CONTENT -->
	</table>
   	<script language='JavaScript'>
	    Tables('table', 1, 0);
    </script>
    </td>
  </tr>
</table>
</body>
</html>