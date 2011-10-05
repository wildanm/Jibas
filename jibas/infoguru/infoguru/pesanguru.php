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
require_once('../include/sessioninfo.php');
require_once('../include/db_functions.php');
require_once('../include/common.php');
require_once('../include/config.php');
OpenDb();
$tgl=date('j');
$bln=date('m');
$sql_ultah="SELECT nama FROM jbssdm.pegawai WHERE DATE(tgllahir)=$tgl AND MONTH(tgllahir)=$bln ORDER BY nama";
$result_ultah=QueryDb($sql_ultah);
CloseDb();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="../script/ajax.js"></script>
<script language="javascript" type="text/javascript" src="../script/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<style type="text/css"> 
<!-- 
body  {
	font: 100% Verdana, Arial, Helvetica, sans-serif;
	background: #666666;
	margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
	padding: 0;
	text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */
	color: #000000;
}
.twoColHybLt #container { 
	width: 99%;  /* this will create a container 80% of the browser width */
	background: #FFFFFF;
	margin: 0 auto; /* the auto margins (in conjunction with a width) center the page */
	border: none;
	text-align: left; /* this overrides the text-align: center on the body element. */
} 

/* Tips for sidebar1:
1. Since we are working in relative units, it's best not to use padding on the sidebar. It will be added to the overall width for standards compliant browsers creating an unknown actual width. 
2. Since em units are used for the sidebar value, be aware that its width will vary with different default text sizes.
3. Space between the side of the div and the elements within it can be created by placing a left and right margin on those elements as seen in the ".twoColHybLt #sidebar1 p" rule.
*/
.twoColHybLt #sidebar1 {
	float: left; 
	width: 12em; /* since this element is floated, a width must be given */
	background: #EBEBEB; /* the background color will be displayed for the length of the content in the column, but no further */
	padding: 15px 0; /* top and bottom padding create visual space within this div  */
}
.twoColHybLt #sidebar1 h3, .twoColHybLt #sidebar1 p {
	margin-left: 10px; /* the left and right margin should be given to every element that will be placed in the side columns */
	margin-right: 10px;
}

/* Tips for mainContent:
1. The space between the mainContent and sidebar1 is created with the left margin on the mainContent div.  No matter how much content the sidebar1 div contains, the column space will remain. You can remove this left margin if you want the #mainContent div's text to fill the #sidebar1 space when the content in #sidebar1 ends.
2. Be aware it is possible to cause float drop (the dropping of the non-floated mainContent area below the sidebar) if an element wider than it can contain is placed within the mainContent div. WIth a hybrid layout (percentage-based overall width with em-based sidebar), it may not be possible to calculate the exact width available. If the user's text size is larger than average, you will have a wider sidebar div and thus, less room in the mainContent div. You should be aware of this limitation - especially if the client is adding content with Contribute.
3. In the Internet Explorer Conditional Comment below, the zoom property is used to give the mainContent "hasLayout." This may help avoid several IE-specific bugs.
*/
.twoColHybLt #mainContent { 
	margin: 0 20px 0 13em; /* the right margin can be given in percentages or pixels. It creates the space down the right side of the page. */
} 

/* Miscellaneous classes for reuse */
.fltrt { /* this class can be used to float an element right in your page. The floated element must precede the element it should be next to on the page. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* this class can be used to float an element left in your page */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* this class should be placed on a div or break element and should be the final element before the close of a container that should fully contain a float */
	clear:both;
    height:0;
    font-size: 1px;
    line-height: 0px;
}
--> 
</style><!--[if IE]>
<style type="text/css"> 
/* place css fixes for all versions of IE in this conditional comment */
.twoColHybLt #sidebar1 { padding-top: 30px; }
.twoColHybLt #mainContent { zoom: 1; padding-top: 15px; }
/* the above proprietary zoom property gives IE the hasLayout it may need to avoid several bugs */
</style>
<![endif]-->
<script type="text/javascript">
<!--

function MM_preloadImages() { //v3.0
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
}
function inbox(){
	//document.location.reload();
	show_wait("mainContent");
	sendRequestText("get_inbox.php", show_inbox, "");
	//parent.framecenter.location.href="home.php";
}
function show_inbox(x) {
	document.getElementById("mainContent").innerHTML = x;
}
function compose(){


	//document.location.reload();
	show_wait("mainContent");
	sendRequestText("get_compose.php", show_compose, "");
	//parent.framecenter.location.href="home.php";
}
function show_compose(x) {
	document.getElementById("mainContent").innerHTML = x;
	tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
		skin : "o2k7",
		skin_variant : "silver",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",		
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect,forecolor,backcolor,fullscreen,print",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,image",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : false,
		content_css : "style/content.css"
	});
}
function show_wait(areaId) {
	var x = document.getElementById("waitBox").innerHTML;
	document.getElementById(areaId).innerHTML = x;
}
//-->
</script>
<link href="../style/style.css" rel="stylesheet" type="text/css" />
</head>

<body class="twoColHybLt" onload="MM_preloadImages('pesanmasuk_on.png','pesanmasuk.png');inbox();">
<div id="waitBox" style="position:absolute; visibility:hidden;">
<img src="../images/ico/movewait.gif" border="0" />Silahkan&nbsp;tunggu...
</div>
<div id="container">
  <div id="sidebar1">
    
    <table width="100%" border="0">
  <tr>
    <td><table border="0" cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td><a href="javascript:inbox();" target="_top" onclick="MM_nbGroup('down','group1','inbox','pesanmasuk_on.png',1)" onmouseover="MM_nbGroup('over','inbox','pesanmasuk_on.png','pesanmasuk.png',1)" onmouseout="MM_nbGroup('out')"><img src="pesanmasuk.png" alt="" name="inbox" width="120" height="24" border="0" id="inbox" onload="" /></a></td>
      </tr>
      <tr><td height="10">&nbsp;</td>
      </tr>
      <tr>
        <td><a href="javascript:compose();" target="_top" onclick="MM_nbGroup('down','group1','compose','tulispesan_on.png',0)" onmouseover="MM_nbGroup('over','compose','tulispesan_on.png','tulispesan.png',0)" onmouseout="MM_nbGroup('out')"><img src="tulispesan.png" alt="" name="compose" width="120" height="24" border="0" id="compose" onload="" /></a></td>
      </tr>
       <tr><td height="10">&nbsp;</td>
      <tr>
        <td><a href="javascript:;" target="_top" onclick="MM_nbGroup('down','group1','sent','terkirim_on.png',0)" onmouseover="MM_nbGroup('over','sent','terkirim_on.png','terkirim.png',0)" onmouseout="MM_nbGroup('out')"><img src="terkirim.png" alt="" name="sent" width="120" height="24" border="0" id="sent" onload="" /></a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="250" valign="top" style="background-image:url(backultah.png)"><div align="center"><strong>Daftar Guru yang Berulang Tahun Hari Ini
      <hr />
    <?
	if (@mysql_num_rows($result_ultah)>0){
		while ($row_ultah=@mysql_fetch_array($sql_ultah)){
		echo $row_ultah[nama]."<br>";
		}
	} else {
		echo "Tidak ada Guru";
	}
	?>
    </strong></div></td>
  </tr>
  <tr></tr>
</table>

  </div>
  <div id="mainContent" style="border:none;">
  </div>
</body>
</html>