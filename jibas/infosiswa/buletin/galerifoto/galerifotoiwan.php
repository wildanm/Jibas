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
require_once('../../sessionchecker.php');
require_once('../../include/common.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/config.php');
require_once('../../include/db_functions.php');
$view="thumbnail";
if (isset($_REQUEST['view']))
	$view=$_REQUEST['view'];
$gambar=0;
if (isset($_REQUEST['gambar']))
	$gambar=(int)$_REQUEST['gambar'];
header("Cache-Control: no-cache");
sleep(2);

$p = $_GET['page'];
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="JavaScript" src="../../script/tools.js"></script>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function tambah(){
	newWindow('../../jibasdotnet/tambahfoto.php?source=galeri','TambahFoto','663','316','resizable=1,scrollbars=0,status=0,toolbar=0');
}
function tampil(replid){
	newWindow('../../library/gambar.php?replid='+replid+'&table=jbsvcr.galerifoto','LihatFoto','663','316','resizable=1,scrollbars=0,status=0,toolbar=0');
}
function get_fresh(){
	//newWindow('tambahfoto.php','TambahFoto','663','316','resizable=1,scrollbars=0,status=0,toolbar=0');
	document.location.href="galerifoto.php?view=thumbnail";
}
function thumbnail(){
	document.location.href="galerifoto.php?view=thumbnail&gambar=0#fragment-1";
}
function filmstrip(){
	document.location.href="galerifoto.php?view=filmstrip&gambar=0#fragment-3";
}
function slideshow(){
	document.location.href="galerifoto.php?view=slideshow&gambar=0#fragment-2";
}
function slide(gambar){
	document.location.href="galerifoto.php?view=slideshow&gambar="+gambar+"#fragment-2";
}
function startslide(gambar){
	var jum=parseInt(document.getElementById('jumlah').value);
	var gambar=parseInt(gambar);
	if (gambar==jum){
		gambar=0;
	} else {
		gambar +=1;
		document.location.href="galerifoto.php?view=slideshow&gambar="+gambar+"#fragment-2";
	}
	//document.location.href="galerifoto.php?view=slideshow&gambar="+gambar+"#fragment-2";
}


function next(gambar){
	var jum=parseInt(document.getElementById('jumlah').value);
	var gambar=parseInt(gambar);
	if (gambar==jum){
		gambar=0;
	} else {
		gambar=gambar+1;
	}
	document.location.href="galerifoto.php?view=filmstrip&gambar="+gambar;
}
function prev(gambar){
	var jum=parseInt(document.getElementById('jumlah').value);
	var gambar=parseInt(gambar);
	if (gambar==0){
		gambar=jum;
	} else {
		gambar=gambar-1;
	}
	document.location.href="galerifoto.php?view=filmstrip&gambar="+gambar;
}
</script>
<script type="text/javascript" src="../../script/niftycube.js"></script>
<script type="text/javascript" language="javascript" src="../style/lytebox.js"></script>
<script src="../../script/jquery-1.2.6.js" type="text/javascript"></script>
 <script>
  // When the document loads do everything inside here ...
     $(document).ready(function(){
	 Nifty("#menu a","small top transparent");
	 Nifty("#outcontent","medium bottom transparent");
	 $('.content').load('boo.php');	//by default initally load text from boo.php
         $('#menu a').click(function() { //start function when any link is clicked
		 				$(".content").slideUp("slow");
						 var content_show = $(this).attr("title"); //retrieve title of link so we can compare with php file
							$.ajax({
							method: "get",url: "gambar.php",data: "page="+content_show,
							beforeSend: function(){$("#loading").show("fast");}, //show loading just when link is clicked
							complete: function(){ $("#loading").hide("fast");}, //stop showing loading when the process is complete
							success: function(html){ //so, if data is retrieved, store it in html
							$(".content").show("slow"); //animation
							$(".content").html(html); //show the html inside .content div
					 }
				 }); //close $.ajax(
         }); //close click(
	 }); //close $(
</script>
<style type="text/css">
body { margin:0 auto 0 auto; color:#000; font-family:Georgia, "Times New Roman", Times, serif; font-size:16px; background-color:#CCCCCC; background-image:url(bg5.jpg)}

.page { margin:0px auto 0 auto; width:95%; }

#menu  { list-style:none; margin:0px; padding:0px; width:auto; background-image:url(bg5.jpg)}

#menu li { list-style:none; display:inline; }
li.active a { background-color:#FFF; }

#menu li a,#menu li a:link { float:left; background-color:#3c3c3c; margin-right:5px; padding:7px; color:#FFFFFF; text-decoration:none; width:6em; text-align:center;} 
#menu li a:visited { }
#menu li a:hover { background-color:#327cc8 }
#menu li a:active { background-color:#FFF;color: }

.content { 
 padding:10px; height:400px; margin:0px; background-image:url(bg.gif)}

#loading { clear:both; background:url(wait.gif) center top no-repeat; text-align:center;padding:33px 0px 0px 0px; font-size:10px;display:none; font-family:Verdana, Arial, Helvetica, sans-serif; }

#outcontent {clear:both; background-color:#FFFFFF; background:url(bg_profil80_08.png)}

</style>



</head>
<body background="../../images/bg1.jpg">
<div align="right">
<font size="4" style="background-color:#ffcc66">&nbsp;</font>&nbsp;<font size="4" color="Gray">Galeri Foto</font><br />
<a href="../../home.php" style="color:#0000FF" target="framecenter">Home</a> > <strong>Galeri Foto</strong><br /><br /><br />
</div>
<table width="98%">
 <tr>
  <td></td>
  <td style="float:right;font-size:12px;font-family: "Trebuchet MS", Trebuchet, Verdana, Helvetica, Arial, sans-serif;
            "><div align="right"><img src="../../images/ico/tambah.png" alt="tambah gambar"/>
            <a href="JavaScript:tambah()">Tambah</a></div> </td>
 </tr>
</table>
<div class="page">
<div>
<ul id="menu" style="background-image:url(bg.gif)">   
             <li id="about"><a href="#" title="about">About Me</a></li>
             <li id="galeri"><a href="#" title="galeri">My galeri</a></li>
            <!--<li id="contact"><a href="#" title="contact">Kontak</a></li>-->  
</ul>
<br style="clear:both;" />
</div>
<div id="outcontent">
<div id="loading"><strong>HARAP TUNGGU</strong></div>
<div class="content"></div>
</div>
</div>
</body>
</html>