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
require_once('../../include/config.php');
require_once('../../include/db_functions.php');
require_once('../../include/sessioninfo.php');
$kat="Umum";
if (isset($_REQUEST[kat]))
	$kat=$_REQUEST[kat];
OpenDb();
$sql="SELECT now()";
$result=QueryDb($sql);
$row=@mysql_fetch_row($result);
//echo "IINI JAMNYA sghdsjghfsfsjdf sdfsdfsdfsd".$row[0];
CloseDb();
OpenDb();
$sql="SELECT replid FROM jbsvcr.profil WHERE nip='".SI_USER_ID()."'";
$result=QueryDb($sql);
$row=@mysql_fetch_row($result);
$repbg=$row[0];
//echo "IINI JAMNYA sghdsjghfsfsjdf sdfsdfsdfsd".$row[0];
CloseDb();
?>
<html>
	<head>
	<title>JIBAS INFOGURU Chating Room [<?=$kat?>]</title>
    <script language="javascript" src="../../script/tools.js"></script>
    <script language="javascript" src="../../script/SpryAssets/SpryValidationTextField.js"></script>
    <link href="../../script/SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
	<link href="../../style/style.css" rel="stylesheet" type="text/css" >
</head>
	<body style="height:565px; width:626px; background-image:url(../../images/Grass.jpg)" onLoad="document.getElementById('chatmsg').focus();" leftmargin="0" topmargin="0">
	<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="48" height="60" style="background-image:url(images/chat_01.png); background-repeat:no-repeat;">&nbsp;</td>
    <td width="25" colspan="3" style="background-image:url(images/chat_02.png); background-repeat:repeat-x;">&nbsp;</td>
    <td width="63" style="background-image:url(images/chat_04.png); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
  <tr>
    <td width="48" background="images/chat_07.png">&nbsp;</td>
<td height="281" colspan="3" valign="bottom" bgcolor="#FFFFFF">
	  <p id="chatwindow"> </p>		
<!--			<textarea id="chatwindow" rows="19" cols="95" readonly></textarea><br>
--><br></td>
    <td width="63" background="images/chat_09.png">&nbsp;</td>
  </tr>
  <tr>
    <td width="48" height="60" background="images/chat_10.png">&nbsp;</td>
    <td colspan="3" background="images/chat_11.png">&nbsp;</td>
    <td width="63" background="images/chat_12.png">&nbsp;</td>
  </tr>
  <tr>
    <td width="48" rowspan="2" background="images/chat_15.png">&nbsp;</td>
    <td bgcolor="#FFFFFF"><strong>Nama</strong></td>
    <td bgcolor="#FFFFFF"><strong>Pesan</strong></td>
    <td bgcolor="#FFFFFF">&nbsp;</td>
    <td width="63" rowspan="2" background="images/chat_17.png">&nbsp;</td>
  </tr>
  <tr height="25">
    <td bgcolor="#FFFFFF"><input align="middle" id="chatnick" readonly value="<?=SI_USER_NICKNAME()?>" type="text" size="9" maxlength="9" ></td>
    <td bgcolor="#FFFFFF"><input id="chatmsg" onFocus="focus('chatmsg')" onBlur="unfocus('chatmsg')" type="text" size="60" maxlength="80"  onkeyup="keyup(event.keyCode);"></td>
    <td bgcolor="#FFFFFF"><input type="button" value="Kirim" onClick="submit_msg();" style="cursor:pointer;" class="but"></td>
  </tr>
  <tr>
    <td width="48" background="images/chat_15.png">&nbsp;</td>
    <td height="30" bgcolor="#FFFFFF"><strong>Smiley</strong></td>
    <td height="30" bgcolor="#FFFFFF">
    <?
	$title = array("Angel","Angry","Cool","Cry","Embrassed","Grin","Rolleyes","Sad","Sealed Lips","Shocked","Smile","Tongue","Undecided","Wink");
	$id = array("1","2","3","4","5","6","7","8","9","10","11","12","13","14");
	$src = array("angel","angry","cool","cry","embrassed","grin","rolleyes","sad","sealedlips","shocked","smile","tongue","undecided","wink");
	for ($i=0;$i<count($title);$i++){
	?>
    &nbsp;<img title="<?=$title[$i]?>" style="cursor:pointer;" onClick="accept_smiley('<?=$id[$i]?>')" src="smileys/<?=$src[$i]?>.gif" width="15" height="15"  />
	<?
	}
	?><!--
    &nbsp;<img title="Angel" style="cursor:pointer;" onClick="accept_smiley('1')" src="smileys/angel.gif" width="15" height="15"  />
    &nbsp;<img title="Angry" style="cursor:pointer;" onClick="accept_smiley('2')" src="smileys/angry.gif"  width="15" height="15"/>
    &nbsp;<img title="Cool" style="cursor:pointer;" onClick="accept_smiley('3')" src="smileys/cool.gif" width="15" height="15" />
    &nbsp;<img title="Cry" style="cursor:pointer;" onClick="accept_smiley('4')" src="smileys/cry.gif" width="15" height="15" />
    &nbsp;<img title="Embrassed" style="cursor:pointer;" onClick="accept_smiley('5')" src="smileys/embrassed.gif" width="15" height="15" />
    &nbsp;<img title="Grin" style="cursor:pointer;" onClick="accept_smiley('6')" src="smileys/grin.gif" width="15" height="15" />
    &nbsp;<img title="Rolleyes" style="cursor:pointer;" onClick="accept_smiley('7')" src="smileys/rolleyes.gif" width="15" height="15" />
    &nbsp;<img title="Sad" style="cursor:pointer;" onClick="accept_smiley('8')" src="smileys/sad.gif" width="15" height="15" />
    &nbsp;<img title="Sealed Lips" style="cursor:pointer;" onClick="accept_smiley('9')" src="smileys/sealedlips.gif" width="15" height="15" />
    &nbsp;<img title="Shocked" style="cursor:pointer;" onClick="accept_smiley('10')" src="smileys/shocked.gif" width="15" height="15" />
    &nbsp;<img title="Smile" style="cursor:pointer;" onClick="accept_smiley('11')" src="smileys/smile.gif" width="15" height="15" />
    &nbsp;<img title="Tongue" style="cursor:pointer;" onClick="accept_smiley('12')" src="smileys/tongue.gif" width="15" height="15" />
    &nbsp;<img title="Undecided" style="cursor:pointer;" onClick="accept_smiley('13')" src="smileys/undecided.gif" width="15" height="15" />
    &nbsp;<img title="Wink"  style="cursor:pointer;" onClick="accept_smiley('14')" src="smileys/wink.gif" width="15" height="15" />
    -->
    </td>
    <td height="30" bgcolor="#FFFFFF"></td>
    <td width="63" background="images/chat_17.png">&nbsp;</td>
  </tr>
  <tr>
    <td background="images/chat_15.png">&nbsp;</td>
    <td height="30" bgcolor="#FFFFFF"><strong>Kategori</strong></td>
    <td height="30" bgcolor="#FFFFFF">
    <select name="kat" id="kat" size="1" onChange="chg_kat()">
    	<option value="Umum" <?=StringIsSelected($kat,"Umum")?>>Umum</option>
        <option value="Musik" <?=StringIsSelected($kat,"Musik")?>>Musik</option>
        <option value="Film" <?=StringIsSelected($kat,"Film")?>>Film</option>
    </select>&nbsp;<input type="button" value="Ganti Kategori" onClick="chg_kat();" style="cursor:pointer;" class="but">
    </td>
    <td height="30" bgcolor="#FFFFFF"></td>
    <td width="63" background="images/chat_17.png">&nbsp;</td>
  </tr>
  <tr>
    <td width="48" height="52" background="images/chat_18.png">&nbsp;</td>
    <td height="52" colspan="3" background="images/chat_19.png">&nbsp;</td>
    <td width="63" height="52" background="images/chat_20.png">&nbsp;</td>
  </tr>
</table>
</body>
</html>

<script type="text/javascript">
function insert_smiley(){
	newWindow('get_smiley.php','Smiley',190,229,'resizable=1,scrollbars=0,statusbar=0,toolbar=0');
}
function chg_kat(){
	var kat=document.getElementById("kat").value;
		document.location.href="chat.php?kat="+kat;
}
function accept_smiley(smiley){
	//if (smiley=="1")
		smtext="smiley["+smiley+"]";
		//smtext="0:] ";
	/*if (smiley=="2")
		//smtext=">( ";
	if (smiley=="3")
		//smtext="8-) ";
	if (smiley=="4")
		//smtext="QQ ";
	if (smiley=="5")
		//smtext=":*) ";
	if (smiley=="6")
		//smtext=":-D ";
	if (smiley=="7")
		//smtext="S-) ";
	if (smiley=="8")
		//smtext=":( ";
	if (smiley=="9")
		//smtext=":-X ";
	if (smiley=="10")
		//smtext="=0 ";
	if (smiley=="11")
		//smtext=":) ";
	if (smiley=="12")
		//smtext=":-p ";
	if (smiley=="13")
		//smtext="=/ ";
	if (smiley=="14")
		//smtext=";) ";
	*/
	var message=document.getElementById("chatmsg").value;
	document.getElementById("chatmsg").value=message+" "+smtext;
}

/* Settings you might want to define */
	var waittime=800;		

/* Internal Variables & Stuff */
	chatmsg.focus()
	document.getElementById("chatwindow").innerHTML = "<img src='../../images/ico/movewait.gif' width='16' height='16'> Silakan tunggu...";

	var xmlhttp = false;
	var xmlhttp2 = false;


/* Request for Reading the Chat Content */
function ajax_read(url) {
	var kat=document.getElementById("kat").value;
	if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
		if(xmlhttp.overrideMimeType){
			xmlhttp.overrideMimeType('text/xml');
		}
	} else if(window.ActiveXObject){
		try{
			xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try{
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e){
			}
		}
	}

	if(!xmlhttp) {
		alert('Giving up :( Cannot create an XMLHTTP instance');
		return false;
	}

	xmlhttp.onreadystatechange = function() {
	if (xmlhttp.readyState==4) {
		document.getElementById("chatwindow").innerHTML = xmlhttp.responseText;

		zeit = new Date(); 
		ms = (zeit.getHours() * 24 * 60 * 1000) + (zeit.getMinutes() * 60 * 1000) + (zeit.getSeconds() * 1000) + zeit.getMilliseconds(); 
		intUpdate = setTimeout("ajax_read('"+kat+".txt?x=" + ms + "')", waittime)
		}
	}

	xmlhttp.open('GET',url,true);
	xmlhttp.send(null);
}

/* Request for Writing the Message */
function ajax_write(url){
	
	if(window.XMLHttpRequest){
		xmlhttp2=new XMLHttpRequest();
		if(xmlhttp2.overrideMimeType){
			xmlhttp2.overrideMimeType('text/xml');
		}
	} else if(window.ActiveXObject){
		try{
			xmlhttp2=new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try{
				xmlhttp2=new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e){
			}
		}
	}

	if(!xmlhttp2) {
		alert('Giving up :( Cannot create an XMLHTTP instance');
		return false;
	}

	xmlhttp2.open('GET',url,true);
	xmlhttp2.send(null);
}

/* Submit the Message */
function submit_msg(){
	kat=document.getElementById("kat").value;
	nick = document.getElementById("chatnick").value;
	msg = document.getElementById("chatmsg").value;

	if (nick == "") { 
		check = prompt("please enter username:"); 
		if (check === null) return 0; 
		if (check == "") check = "anonymous"; 
		document.getElementById("chatnick").value = check;
		nick = check;
	} 

	document.getElementById("chatmsg").value = "";
	document.getElementById("chatmsg").focus();
	ajax_write("w.php?kat="+kat+"&m=" + msg + "&n=" + nick + "&kat=" + kat);
}

/* Check if Enter is pressed */
function keyup(arg1) { 
	if (arg1 == 13) submit_msg(); 
}

/* Start the Requests! ;) */
var kat=document.getElementById("kat").value;
var intUpdate = setTimeout("ajax_read('"+kat+".txt')", waittime);

</script>
<script language="javascript">
	//var sprytextfield2 = new Spry.Widget.ValidationTextField("chatmsg");
</script>