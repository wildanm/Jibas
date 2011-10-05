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
require_once("../include/sessioninfo.php");
require_once("../include/db_functions.php");
require_once("../include/config.php");
require_once("../include/common.php");
require_once("../sessionchecker.php");
OpenDb();
$op="";
if (isset($_REQUEST[op])){
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
$sql="INSERT INTO jbsvcr.chat SET id='".SI_USER_ID()."',waktukirim='".$thn."-".$bln."-".$tgl." ".$jam."',chatgroup='INFOGURU',pesan='$_REQUEST[pesan]'";
$result=QueryDb($sql);
if ($result){
?>
<script language="javascript" type="text/javascript">
	autoload();
</script>
<?
}
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" language="JavaScript1.2" src="../script/ajax.js"></script>
<script language="javascript" type="text/javascript">
function autoload(){
	setTimeout("get_chat();", 500);
}
function get_chat(){
	//alert ('Ngareload, hehehe........');
	show_wait("chat_content");
	sendRequestText("get_chat.php", show_content, "");
	//document.location.href="frametop.php?menu=akademik";
}
function show_content(x) {
	document.getElementById("chat_content").innerHTML = x;
}
function show_wait(areaId) {
	var x = document.getElementById("waitBox").innerHTML;
	document.getElementById(areaId).innerHTML = x;
}
function send(evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode :
        ((evt.which) ? evt.which : evt.keyCode);
    if (charCode == 13) {
		var pesan=document.getElementById("pesan").value;
		document.location.href="chat.php?op=send&pesan="+pesan;
		return false;
    }
    return true;
}
</script>
</head>
<body onLoad="document.getElementById('pesan').focus();">
<div id="waitBox" style="position:absolute; visibility:hidden;">
<img src="../images/ico/movewait.gif" border="0" />Dagoan keudeung...
</div>
<table width="100%" border="0" cellspacing="0">
  <tr>
    <th colspan="2" scope="row"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="143" height="101" style="background-image:url(../images_slice/chat_01.jpg); background-repeat:no-repeat;" scope="row">&nbsp;</th>
    <td style="background-image:url(../images_slice/chat_02.jpg); background-repeat:repeat-x;">&nbsp;</td>
    <td style="background-image:url(../images_slice/chat_05.jpg); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
  <tr>
    <th height="150" style="background-image:url(../images_slice/chat_08.jpg); background-repeat:repeat-y;" scope="row">&nbsp;</th>
    <td height="450" bgcolor="#FFFFFF">
	<div id="chat_content" align="left">
	<? OpenDb();
	$sql_num="SELECT * FROM jbsvcr.chat ORDER BY replid";
	$result_num=QueryDb($sql_num);
	$num=@mysql_num_rows($result_num);
	$num=(int)$num-10;
	$sql="SELECT * FROM jbsvcr.chat ORDER BY replid ASC LIMIT ".$num.",10";
	$result=QueryDb($sql);
	while ($row=@mysql_fetch_array($result)){
		$warna="";
		?>
		<font color="<?=$warna?>" size="1">
		<?=$row[id]?><br />
		<?=$row[pesan]?><br /><br />
		</font>
		<?
	}
	?>
	</div>
	</td>
    <td style="background-image:url(../images_slice/chat_11.jpg); background-repeat:repeat-y;">&nbsp;</td>
  </tr>
  <tr>
    <th width="143" height="101"style="background-image:url(../images_slice/chat_12.jpg); background-repeat:no-repeat;" scope="row">&nbsp;</th>
    <td style="background-image:url(../images_slice/chat_13.jpg); background-repeat:repeat-x;">&nbsp;</td>
    <td width="147" height="102" style="background-image:url(../images_slice/chat_14.jpg); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
</table></th>
  </tr>
  <tr>
    <th colspan="2" scope="row">&nbsp;</th>
  </tr>
  <tr>
    <th scope="row"><div align="left">Pesan : <br />
        <input type="text" name="pesan" size="150" id="pesan" onfocus="autoload()" onKeyUp="autoload()" onKeyPress="send(event)" />
    </div></th>
    <th scope="row">&nbsp;</th>
  </tr>
</table>

</body>
</html>