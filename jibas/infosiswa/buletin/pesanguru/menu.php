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
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" src="../../script/tools.js"></script>
<script language="javascript">
function tampil(replid) {
	newWindow('../../library/pegawai_view.php?replid='+replid, 'DetailSiswa','800','650','resizable=1,scrollbars=1,status=0,toolbar=0')
}
function go(content) {
	parent.kanan.location.href=content+".php";
}

/*function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}*/
</script>
<style type="text/css">
<!--
.style3 {font-family: Verdana; color: #666666; font-size: 12px;}
.style6 {font-family: Arial, Helvetica, sans-serif; font-size: 12px; color:#FF6633;}
.style7 {
	font-family: Calibri;
	font-weight: bold;
	font-size: 24px;
	color: #996600;
}
.style8 {
	font-family: Verdana;
	font-size: 14px;
	font-weight: bold;
}
.style9 {color: #000000}
.style10 {font-family: Verdana; font-size: 14px; font-weight: bold; color: #000000; }
-->
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" ><!--onload="MM_preloadImages('inbox_on.png','compose_on.png','sent_on.png','draft_on.png','inbox_off.png')">-->
<table width="150" border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td colspan="2"><span class="style7">.: Pesan Guru</span><br />
    <br /><br /></td>
  </tr>
  <!--<tr>
    <td><a href="pesanguru_footer.php" target="kanan" onclick="MM_nbGroup('down','group1','inbox2','inbox_on.png',1)" onmouseover="MM_nbGroup('over','inbox2','inbox_on.png','inbox_on.png',1)" onmouseout="MM_nbGroup('out')"><img src="inbox_on.png" alt="" name="inbox2" border="0" id="inbox2" onload="MM_nbGroup('init','group1','inbox2','inbox_off.png',1)" /></a></td>
  </tr>
  <tr>
    <td><a href="pesanguru_add_main.php" target="kanan" onclick="MM_nbGroup('down','group1','compose2','compose_on.png',0)" onmouseover="MM_nbGroup('over','compose2','compose_on.png','compose_on.png',0)" onmouseout="MM_nbGroup('out')"><img src="compose_off.png" alt="" name="compose2" width="150" height="25" border="0" id="compose2" onload="" /></a></td>
  </tr>
  <tr>
    <td><a href="pesanguru_terkirim.php" target="kanan" onclick="MM_nbGroup('down','group1','sent2','sent_on.png',0)" onmouseover="MM_nbGroup('over','sent2','sent_on.png','sent_on.png',0)" onmouseout="MM_nbGroup('out')"><img src="sent_off.png" alt="" name="sent2" width="150" height="25" border="0" id="sent2" onload="" /></a></td>
  </tr>
  <tr>
    <td><a href="pesanguru_draft.php" target="kanan" onclick="MM_nbGroup('down','group1','draft2','draft_on.png',0)" onmouseover="MM_nbGroup('over','draft2','draft_on.png','draft_on.png',0)" onmouseout="MM_nbGroup('out')"><img src="draft_off.png" alt="" name="draft2" width="150" height="25" border="0" id="draft2" onload="" /></a></td>
  </tr>-->
  <tr>
	<td width="31"><a href="#" onclick="go('pesanguru_footer');" title="Kotak Masuk Anda" ><img src="../../images/ico/inbox.png" border="0" /></a></td>
    <td width="119" class="style8"><a href="#" title="Kotak Masuk Anda" onclick="go('pesanguru_footer');" >Kotak Masuk</a></td>
  </tr>
  <tr>
    <td><a href="#" onclick="go('pesanguru_add_main');" title="Tulis Pesan Baru" ><img src="../../images/ico/compose.png" width="31" height="25" border="0" /></a></td>
    <td class="style8"><a href="#" title="Tulis Pesan Baru" onclick="go('pesanguru_add_main');" >Tulis Pesan</a></td>
  </tr>
  <tr>
    <td><a href="#" onclick="go('pesanguru_terkirim');" title="Daftar Pesan Terkirim" ><img src="../../images/ico/sent.png" width="31" height="25" border="0" /></a></td>
    <td class="style8"><a href="#" title="Daftar Pesan Terkirim" onclick="go('pesanguru_terkirim');" >Pesan Terkirim</a></td>
  </tr>
  <tr>
    <td><a href="#" onclick="go('pesanguru_draft');" title="Daftar Pesan Tersimpan" ><img src="../../images/ico/draft.png" width="31" height="25" border="0" /></a></td>
    <td class="style8"><a href="#" onclick="go('pesanguru_draft');" title="Daftar Pesan Tersimpan" >Draft</a></td>
  </tr>
</table>
<table width="150" border="0" cellspacing="0">
 
  <tr>
    <th  scope="row">&nbsp;</th>
  </tr>
  <tr>
    <th height="200" valign="top" scope="row">
    <span class="style3">.: Ulang Tahun Hari ini</span> <br />
    <hr /><span class="style6">
    <?
	$bulan=date("m");
	$tanggal=date("j");
	//echo $tanggal;
	//exit;
	OpenDb();
	$sql="SELECT replid,nip,nama FROM jbssdm.pegawai WHERE DAY(tgllahir)=$tanggal AND MONTH(tgllahir)=$bulan ORDER BY nama";
	$result=QueryDb($sql);
	if (@mysql_num_rows($result)>0){
	while ($row=@mysql_fetch_array($result)){
	echo "<a href='#' onclick=tampil('".$row[replid]."')>".$row[nip]."-".$row[nama]."</a><br><hr>";
	}
	} else {
	echo "Tidak Ada Guru yang berulang tahun hari ini";
	}
	?>
    </span><br /><hr /></th>
  </tr>
</table>
</body>
</html>