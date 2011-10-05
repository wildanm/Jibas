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
require_once('../../include/errorhandler.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/common.php');
require_once('../../include/config.php');
require_once('../../include/getheader.php');
require_once('../../include/db_functions.php');

$id=$_REQUEST['replid'];
$idnya=$_REQUEST['replidnya'];
//$pil=$_REQUEST['pilihan'];
$jenis=$_REQUEST['jenis'];
$tanya=$_REQUEST['tanya'];
$sender=$_REQUEST['Simpan'];
if ($sender=="Simpan"){
 
 if ($pil==1){
  	OpenDb();
 	$sql ="INSERT INTO jbsvcr.pertanyaan SET idangket='".$idnya."', pertanyaan='".$tanya."', jenis='".$jenis."'";   
 	$result=QueryDb($sql);
   	if ($result){
	 	$sql1 = "SELECT LAST_INSERT_ID(replid) FROM jbsvcr.pertanyaan ORDER BY replid DESC ";
		$result1 = QueryDb($sql1);
		$row1 = mysql_fetch_row($result1); 
	?>
		<script language="javascript">
			//parent.opener.refresh('<?=$row1[0]?>');				
			//window.close();
		</script>
	<?
	}
 } 
  else{
  	OpenDb();
	$sql ="INSERT INTO jbsvcr.pertanyaan SET idangket='".$idnya."', pertanyaan='".$tanya."', jenis='".$jenis."'";   
 	$result=QueryDb($sql);
	$sql3="SELECT LAST_INSERT_ID(replid) FROM jbsvcr.pertanyaan ORDER BY replid DESC LIMIT 1";
	$hasilnya=QueryDb($sql3);
	$rownya=mysql_fetch_array($hasilnya);
	$keynya=$rownya[0];
	for($i = 1; $i <= 5; $i++) {
		$pil = $_REQUEST['pilihan'.$i];
		
		if (strlen(trim($pil)) > 0) {
			$sql2 = "INSERT INTO jbsvcr.pilihan SET idpertanyaan='$keynya', pilihan='$pil'";
			//echo "$sql<br>";
			$result2=QueryDb($sql2);
		}
	}
   	if ($result){
	 	$sql1 = "SELECT LAST_INSERT_ID(replid) FROM jbsvcr.pertanyaan ORDER BY replid DESC ";
		$result1 = QueryDb($sql1);
		$row1 = mysql_fetch_row($result1); 
	 	$sql2 = "SELECT LAST_INSERT_ID(replid) FROM jbsvcr.pilihan ORDER BY replid DESC ";
		$result2 = QueryDb($sql2);
		$row2 = mysql_fetch_row($result2); 
	?>
		<script language="javascript">
			parent.opener.refresh('<?=$row1[0]?>');	
			//parent.opener.refresh('<?=$row2[0]?>');			
			window.close();
		</script>
	<?
	}
 }
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS INFOSISWA [Input Data Angket]</title>
<link rel="stylesheet" type="text/css" href="../../style/style.css" />
<link href="../../SpryAssets/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
<script src="../../SpryAssets/SpryValidationTextarea.js" type="text/javascript"></script>
<script language="javascript" src="../../script/validasi.js"></script>
<script language="javascript" src="../script/tools.js"></script>
<script language="javascript">
function validate() {
	var tanya=document.getElementById('tanya').value;
	if (tanya.length==0){
		alert ('Anda harus mengisikan data untuk Pertanyaan Angket');
		document.getElementById('tanya').focus();
		return false;
	}
	if (tanya.length>=1000){
		alert ('Karakter maksimal untuk Pertanyaan Angket adalah 255 karakter !');
		document.getElementById('tanya').focus();
		return false;
	}
	return true;
}

function lihat(jenis){
//alert('Berhasil2'+jenis);
if (jenis=='1'){
    document.getElementById('tampil').style.visibility='visible'; 
	document.getElementById('tampil').style.position='inherit'; 
   }else{
   	document.getElementById('tampil').style.visibility='hidden';
	document.getElementById('tampil').style.position='absolute'; 
   }
}   
</script>
</head>

<body topmargin="5" leftmargin="0" marginheight="0" marginwidth="0" style="background-color:#FFFFFF" onLoad="document.getElementById('tanya').focus();">
<form name="angket" id="angket" onSubmit="return validate()" method="post" action="tanyaAngket.php">
<input type="hidden" name="replidnya" id="replidnya" value="<?=$id ?>" />
<table class="tab" id="table" border="0" style="border-collapse:collapse; margin-top:10px;" cellspacing="2" width="*" align="center">
  <tr>
    <td colspan="4" class="header" style="text-align:center">INPUT PERTANYAAN ANGKET</td>
  </tr>
  <tr>
    <td width="81" style="text-align:left">Pertanyaan    </td>
    <td width="18" style="text-align:left">&nbsp;:</td>
    <td width="184">&nbsp;
    	<textarea name="tanya" id="tanya" cols="26" rows="5" onKeyPress="return focusNext('jenis', event)"></textarea></td>
    <td width="16">&nbsp;</td>
  </tr>
  <tr>
    <td>Jenis</td>
    <td>&nbsp;:</td>
    <td width="184">&nbsp;
   	  <input type="radio" id="jenis" name="jenis" value="1" onChange="lihat(1)"/>
   	  &nbsp;Pilihan&nbsp;&nbsp;&nbsp;
        <input type="radio" id="jenis" name="jenis" value="2" checked="checked"  onchange="lihat(2)"/>
        &nbsp;Isian&nbsp;&nbsp;&nbsp;    </td>
    <td width="16">&nbsp;</td>
  </tr>
  <tr id="tampil" style="visibility:hidden; position:absolute">
  	<td>Pilihan</td>
    <td>
    </td>
    <td>    	<table>
        <!-- <tr>
          <td>1</td>
          <td>&nbsp;
            <input type="text" id="pilihan[]" name="pilihan[]"/></td>
         </tr>
         <tr>
          <td>2</td>
          <td>&nbsp;
            <input type="text" id="pilihan[]" name="pilihan[]"/></td>
         </tr>
         <tr>
          <td>3</td>
          <td>&nbsp;
            <input type="text" id="pilihan[]" name="pilihan[]"/></td>
         </tr>
         <tr>
          <td>4</td>
          <td>&nbsp;
            <input type="text" id="pilihan[]" name="pilihan[]"/></td>
         </tr>
         <tr>
          <td>5</td>
          <td>&nbsp;
            <input type="text" id="pilihan[]" name="pilihan[]"/></td>
         </tr>-->
         <? 
		 	for ($i=1;$i<=5;$i++)
			{
		 ?>
            <tr>
              <td><?=$i; ?></td>
              <td><input type="text" name="pilihan<?=$i?>" id="pilihan<?=$i?>" size="27" maxlength="30" /></td>
            </tr>
         <?
			}
		 ?>
        </table></td>
    <td></td>
  </tr>

  <tr>
    <td colspan="4"></td>
  </tr>
  <tr>
    <td align="center">&nbsp;    </td>
    <td colspan="2" align="center">&nbsp;<br />
     <input type="submit" name="Simpan" id="Simpan" value="Simpan" class="but" title="Simpan Angket Ini"/>&nbsp;
     <input type="button" name="Tutup" id="Tutup" value="Tutup" class="but" onClick="window.close()" /></td>
    <td align="center">&nbsp;</td>
  </tr>
</table>
</form>

<? if (strlen($ERROR_MSG) > 0) { ?>
<script language="javascript">
alert('<?=$ERROR_MSG?>');
var sprytextarea1 = new Spry.Widget.ValidationTextarea("tanya");
</script>
<? } ?>
</body>
</html>