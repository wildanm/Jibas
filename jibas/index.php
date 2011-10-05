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
require_once('include/mainconfig.php');
require_once('include/db_functions.php');

// --- Patch Management Framework ---
require_once('include/global.patch.manager.php');
ApplyGlobalPatch(".");

// --- LiveUpdate Status ----
session_name("jbsmain");
session_start();

$lid = -1; // current liveupdate id
$dbconnect = @mysql_connect($db_host, $db_user, $db_pass);
if ($dbconnect)
{
	$dbselect = @mysql_select_db("jbsclient", $dbconnect);
	
	if ($dbselect)
	{
		$sql = "SELECT nilai FROM jbsclient.liveupdateconfig WHERE tipe='MIN_UPDATE_ID'";
		$result = @mysql_query($sql, $dbconnect);
		$row = @mysql_fetch_row($result);
		$minid = $row[0];
		
		$sql = "SELECT MAX(liveupdateid) FROM jbsclient.liveupdate";
		$result = @mysql_query($sql, $dbconnect);
		$row = @mysql_fetch_row($result);
		$maxinstalled  = is_null($row[0]) ? 0 : $row[0];
		
		$lid = $minid >= $maxinstalled ? $minid : $maxinstalled;
	}
	
	@mysql_close($dbconnect);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS Road To Community <?= $G_VERSION ?></title>
<link rel="shortcut icon" href="images/jibas.ico" />
<link rel="stylesheet" type="text/css" href="script/contentslider.css" />
<link rel="stylesheet" href="style/lytebox.css" type="text/css" media="screen" />
<script type="text/javascript" language="javascript" src='script/jquery.min.js'></script>
<script type="text/javascript" language="javascript" src="style/lytebox.js"></script>
<script type="text/javascript" language="javascript" src="script/tools.js"></script>
<script type="text/javascript" language="javascript" src="script/contentslider.js"></script>
<script type="text/javascript" language="javascript" src="script/ajax.js"></script>
<script type="text/javascript" language="javascript" src="script/footer.js"></script>
<script language="javascript">
var first = 1;

function GoTo(page)
{
	document.location.href=page;
}

function getLuStatus(lid)
{
	sendRequestText("include/getlustatus.php", acceptLuStatus, "lid="+lid);
}

function acceptLuStatus(text)
{
	document.getElementById("lumessage").innerHTML = text;
}

function getNewsTicker(id,type){
	if (first==1){
		$.ajax({
			url:'include/getnewsticker.php?id='+id+'&type='+type,
			type:'get',
			dataType:'json',
			success:function(msg){
				var i;
				var t;
				if (msg!=null){
					if (msg.news!=""){
						$("#jibasnewsticker").fadeOut(function(){
							$("#jibasnewsticker #nc").html(msg.news);
							$("#jibasnewsticker").fadeIn();
						});
					}
					i = (msg.id=="")?'-1':msg.id;
					t = (msg.type=="")?'0':msg.type;
				} else {
					i = '-1';
					t = '0';
				}
				setTimeout(function(){
					getNewsTicker(i,t);
				},5000)
			}
		})
	}
}
setTimeout(function(){
	getNewsTicker('-1','0');
},2000)
</script>

<style type="text/css">
<!--
.style2 {color: #000000}
.style3 {color: #666666}
.style1 {
	color: #333333;
	font-weight: bold;
	font-family:Calibri;
	font-size:16px
}

#Footer {
	position:fixed;
	right:0px;
	bottom:0px;
}
html, body{overflow:hidden}
-->
</style>

</head>
<body style="background-color:#bdbdb9; " leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table id="Table_01" width="800" height="649" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td><img src="images/Front-JIBAS-24_01.jpg" width="46" height="110" border="0"></td>
	<td><img src="images/Front-JIBAS-24_02.jpg" width="224" height="110" border="0"></td>
	<td><img src="images/Front-JIBAS-24_03.jpg" width="50" height="110" border="0"></td>
	<td><img src="images/Front-JIBAS-24_04.jpg" width="212" height="110" border="0"></td>
	<td><img src="images/Front-JIBAS-24_05.jpg" width="51" height="110" border="0" usemap="#Map"></td>
	<td><img src="images/Front-JIBAS-24_06.jpg" width="217" height="110" border="0" usemap="#Map2"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_07.jpg" width="46" height="33" border="0"></td>
	<td><img src="images/Front-JIBAS-24_08.jpg" width="224" height="33" border="0"></td>
	<td><img src="images/Front-JIBAS-24_09.jpg" width="50" height="33" border="0"></td>
	<td><img src="images/Front-JIBAS-24_10.jpg" width="212" height="33" border="0"></td>
	<td><img src="images/Front-JIBAS-24_11.jpg" width="50" height="33" border="0"></td>
	<td><img src="images/Front-JIBAS-24_12.jpg" width="218" height="33" border="0"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_13.jpg" width="46" height="70" border="0"></td>
	<td><a href="akademik/"><img src="images/Front-JIBAS-24_14.jpg" width="224" height="70" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_15.jpg" width="50" height="70" border="0"></td>
	<td><a href="keuangan/"><img src="images/Front-JIBAS-24_16.jpg" width="212" height="70" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_17.jpg" width="49" height="70" border="0"></td>
	<td><a href="simtaka/"><img src="images/Front-JIBAS-24_18.jpg" width="219" height="70" border="0"></a></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_19.jpg" width="46" height="36" border="0"></td>
	<td><img src="images/Front-JIBAS-24_20.jpg" width="224" height="36" border="0"></td>
	<td><img src="images/Front-JIBAS-24_21.jpg" width="50" height="36" border="0"></td>
	<td><img src="images/Front-JIBAS-24_22.jpg" width="213" height="36" border="0"></td>
	<td><img src="images/Front-JIBAS-24_23.jpg" width="48" height="36" border="0"></td>
	<td><img src="images/Front-JIBAS-24_24.jpg" width="219" height="36" border="0"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_25.jpg" width="46" height="72" border="0"></td>
	<td><a href="infoguru/"><img src="images/Front-JIBAS-24_26.jpg" width="224" height="72" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_27.jpg" width="50" height="72" border="0"></td>
	<td><a href="infosiswa/"><img src="images/Front-JIBAS-24_28.jpg" width="213" height="72" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_29.jpg" width="48" height="72" border="0"></td>
	<td><img src="images/Front-JIBAS-24_30.jpg" width="219" height="72" border="0"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_31.jpg" width="46" height="32" border="0"></td>
	<td><img src="images/Front-JIBAS-24_32.jpg" width="224" height="32" border="0"></td>
	<td><img src="images/Front-JIBAS-24_33.jpg" width="50" height="32" border="0"></td>
	<td><img src="images/Front-JIBAS-24_34.jpg" width="213" height="32" border="0"></td>
	<td><img src="images/Front-JIBAS-24_35.jpg" width="48" height="32" border="0"></td>
	<td><img src="images/Front-JIBAS-24_36.jpg" width="219" height="32" border="0"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_37.jpg" width="46" height="71" border="0"></td>
	<td><a href="smsgateway/"><img src="images/Front-JIBAS-24_38.jpg" width="224" height="71" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_39.jpg" width="50" height="71" border="0"></td>
	<td><a href="ema/"><img src="images/Front-JIBAS-24_40.jpg" width="213" height="71" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_41.jpg" width="48" height="71" border="0"></td>
	<td><img src="images/Front-JIBAS-24_42.jpg" width="219" height="71" border="0"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_43.jpg" width="46" height="49" border="0"></td>
	<td><a href="images/jibas_autoresponse.jpg" rel="lytebox[vacation]"><img src="images/Front-JIBAS-24_44.jpg" width="224" height="49" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_45.jpg" width="50" height="49" border="0"></td>
	<td><img src="images/Front-JIBAS-24_46.jpg" width="213" height="49" border="0"></td>
	<td><img src="images/Front-JIBAS-24_47.jpg" width="48" height="49" border="0"></td>
	<td><img src="images/Front-JIBAS-24_48.jpg" width="219" height="49" border="0"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_49.jpg" width="46" height="31" border="0"></td>
	<td><img src="images/Front-JIBAS-24_50.jpg" width="224" height="31" border="0"></td>
	<td><img src="images/Front-JIBAS-24_51.jpg" width="50" height="31" border="0"></td>
	<td><img src="images/Front-JIBAS-24_52.jpg" width="213" height="31" border="0"></td>
	<td><img src="images/Front-JIBAS-24_53.jpg" width="48" height="31" border="0"></td>
	<td><img src="images/Front-JIBAS-24_54.jpg" width="219" height="31" border="0"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_55.jpg" width="46" height="34" border="0"></td>
	<td><a href="images/jibas_sinkronisasi.jpg" rel="lytebox[vacation]"><img src="images/Front-JIBAS-24_56.jpg" width="224" height="34" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_57.jpg" width="50" height="34" border="0"></td>
	<td><a href="images/jibas_backup_restore.jpg" rel="lytebox[vacation]"><img src="images/Front-JIBAS-24_58.jpg" width="213" height="34" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_59.jpg" width="48" height="34" border="0"></td>
	<td><img src="images/Front-JIBAS-24_60.jpg" width="219" height="34" border="0"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_61.jpg" width="46" height="51" border="0"></td>
	<td><a href="images/jibas_situs.jpg" rel="lytebox[vacation]"><img src="images/Front-JIBAS-24_62.jpg" width="224" height="51" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_63.jpg" width="50" height="51" border="0"></td>
	<td><a href="images/jibas_liveupdate.jpg" rel="lytebox[vacation]"><img src="images/Front-JIBAS-24_64.jpg" width="213" height="51" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_65.jpg" width="48" height="51" border="0"></td>
	<td><img src="images/Front-JIBAS-24_66.jpg" width="219" height="51" border="0"></td>
</tr>
<tr>
	<td><img src="images/Front-JIBAS-24_67.jpg" width="46" height="60" border="0"></td>
	<td><img src="images/Front-JIBAS-24_68.jpg" width="224" height="60" border="0"></td>
	<td><img src="images/Front-JIBAS-24_69.jpg" width="50" height="60" border="0"></td>
	<td><a href="http://support.jibas.net" target="_blank"><img src="images/Front-JIBAS-25_70.jpg" width="213" height="60" border="0"></a></td>
	<td><a href="http://support.jibas.net" target="_blank"><img src="images/Front-JIBAS-25_71.jpg" width="48" height="60" border="0"></a></td>
	<td><img src="images/Front-JIBAS-24_72.jpg" width="219" height="60" border="0"></td>
</tr>
</table>


<map name="Map" id="Map">
  <area shape="rect" coords="29,45,47,67" href="http://www.indonesiamembaca.net" target="_blank" title="Yayasan Indonesia Membaca" alt="Yayasan Indonesia Membaca" />
</map>
<map name="Map2" id="Map2">
  <area shape="rect" coords="3,43,24,67" href="http://www.galileoms.com" target="_blank" title="PT.Galileo Mitra Solusitama" alt="PT.Galileo Mitra Solusitama" />
</map>
<div id="jibasnewsticker" style="border:1px solid #d4d0c8; background-color:#ffffe1; font-family:Calibri; font-size:11px; color:#515151; text-align:left; display:none; position:fixed; padding:3px; padding-top:0px; right:20px; min-height:30px; bottom:100px; width:200px">
    <div><img src="images/ico/close.png" title="Tutup" align="right" style="cursor:pointer; margin-left:3px; margin-top:3px" onclick="$('#jibasnewsticker').fadeOut();first=0;" /></div>
	<div id="nc" style="padding-top:5px">
   
    </div> 
</div>
<div id="Footer">
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td align="right">
	<div id="lumessage" style="background-image:url(images/bglu.gif); background-repeat:no-repeat; width:238px; height:34px;font-family:Arial; font-weight:bold; font-size:12px; text-align:center; padding-top:9px; padding-left:6px">
	<?	
	if ($_SESSION['lugetstatus'] && $_SESSION['lugetlid'] == $lid)
		echo $_SESSION['lugetmessage'];
	else	
		echo "<span style='color:cyan'>Memeriksa update ...</span>"; 
	?>
    </div>
    <span style="color:#505050; font-size:10px; font-family:Arial">
    Version <?=$G_VERSION." - ".$G_BUILDDATE?><br />
    <div id='cp'>
	Hak Cipta &copy; 2009 <a href="http://www.galileoms.com" target="_blank" style="color:#0047bd; text-decoration:underline;font-size:10px;font-family:Arial">PT. Galileo Mitra Solusitama</a><br>
    Komunitas <strong>JIBAS</strong> dikelola oleh <a href="http://www.indonesiamembaca.net" target="_blank" style="color:#0047bd; text-decoration:underline;font-size:10px;font-family:Arial">Yayasan Indonesia Membaca</a>
	</div>
	</span>
    </td>
  </tr>
</table>
</div>
</body>
</html>
<? if (!$_SESSION['lugetstatus'] || $_SESSION['lugetlid'] != $lid) { ?>
<script type="text/javascript" language="javascript">
getLuStatus(<?=$lid?>);
</script>
<? } ?>