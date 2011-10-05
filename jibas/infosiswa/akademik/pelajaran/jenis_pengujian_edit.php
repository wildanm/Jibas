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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/theme.php');
require_once('../include/config.php');
require_once('../include/getheader.php');
require_once('../include/db_functions.php');

$replid = $_REQUEST['replid'];


$ERROR_MSG = "";
if (isset($_REQUEST['Simpan'])) {
	OpenDb();
	$sql = "SELECT * FROM jenisujian WHERE jenisujian = '$_REQUEST[jenisujianbaru]' AND replid<>'$replid' AND idpelajaran = '$_REQUEST[idpelajaran]'";
	$result = QueryDb($sql);
	if (mysql_num_rows($result) > 0) {
		$jenisujian=$_REQUEST['jenisujianbaru'];
		CloseDb();
		$ERROR_MSG = "Jenis Ujian $jenisujian sudah digunakan!";
	} else {
		$sql = "UPDATE jenisujian SET replid='$_REQUEST[replid]',jenisujian='$_REQUEST[jenisujianbaru]',keterangan='$_REQUEST[keterangan]' WHERE jenisujian='$_REQUEST[jenisujian]' AND replid='$_REQUEST[replid]'";
		$result = QueryDb($sql);
		CloseDb();
	
		if ($result) { ?>
			<script language="javascript">
				opener.refresh();
				window.close();
			</script> 
<?		
	}
}
}

OpenDb();

$sql = "SELECT j.replid,j.jenisujian,j.idpelajaran,j.keterangan,p.replid,p.nama,p.departemen FROM jenisujian j, pelajaran p WHERE j.replid = '$replid' AND j.idpelajaran = p.replid";   
$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$jenisujian = $row[1];
$keterangan = $row[3];
$pelajaran = $row[5];
$idpelajaran = $row[2];
$departemen = $row[6];


CloseDb();

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<link rel="stylesheet" type="text/css" href="../style/tooltips.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS SIMAKA [Ubah Jenis Pengujian]</title>
<script src="../script/SpryValidationTextarea.js" type="text/javascript"></script>
<link href="../script/SpryValidationTextarea.css" rel="stylesheet" type="text/css" />
<script src="../script/SpryValidationTextfield.js" type="text/javascript"></script>
<link href="../script/SpryValidationTextfield.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../script/tooltips.js"></script>
<script language="javascript" src="../script/tables.js"></script>
<script language="javascript" src="../script/tools.js"></script>
<script language="javascript" src="../script/validasi.js"></script>
<script language="javascript">

function validate() {
	return validateEmptyText('jenisujianbaru', 'Jenis Pengujian') && 
		   validateMaxText('keterangan', 255, 'Keterangan');
}
</script>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="background-color:#FFFFFF" onLoad="document.getElementById('jenisujianbaru').focus();">

<form name="main" onSubmit="return validate()">
<input type="hidden" name="replid" id="replid" value="<?=$replid ?>" />
<input type="hidden" name="idpelajaran" id="idpelajaran" value="<?=$idpelajaran ?>" />
<table border="0" width="95%" cellpadding="2" cellspacing="2" align="center">
<!-- TABLE CONTENT -->
<tr height="25">
<td class="header" colspan="2" align="center">Ubah Jenis Pengujian</td>
</tr>
<tr>
  <td><strong>Departemen</strong></td>
  <td><input type="text" name="departemen" id="departemen" size="10" maxlength="10" value="<?=$departemen ?>"  class="disabled" readonly/></td>
</tr>
<tr>
  <td><strong>Pelajaran</strong></td>
  <td><input type="text" name="pelajaran" id="pelajaran" size="30" maxlength="50" value="<?=$pelajaran ?>" class="disabled" readonly/></td>
</tr>
<tr>
	<td><strong>Jenis Pengujian</strong></td>
	<td>
    	<input type="text" name="jenisujianbaru" id="jenisujianbaru" size="30" maxlength="50" value="<?=$jenisujian ?>" onFocus="showhint('Nama jenis pengujian tidak boleh lebih dari 50 karakter!', this, event, '120px')" /> <input type="hidden" name="jenisujian" id="jenisujian" size="30" maxlength="50" value="<?=$jenisujian ?>" />   </td>
</tr>
<tr>
	<td valign="top">Keterangan</td>
	<td>
    	<textarea name="keterangan" id="keterangan" rows="3" cols="45"><?=$keterangan ?></textarea>    </td>
</tr>
<tr>
	<td colspan="2" align="center">
    <input type="submit" name="Simpan" id="Simpan" value="Simpan" class="but" />&nbsp;
    <input type="button" name="Tutup" id="Tutup" value="Tutup" class="but" onClick="window.close()" />    </td>
</tr>
<!-- END OF TABLE CONTENT -->
</table>
</form>
<!-- Tamplikan error jika ada -->
<? if (strlen($ERROR_MSG) > 0) { ?>
<script language="javascript">
	alert('<?=$ERROR_MSG?>');
</script>
<? } ?>

<!-- Pilih inputan pertama -->

</body>
</html>
<script language="javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("jenisujianbaru");
var sprytextarea1 = new Spry.Widget.ValidationTextarea("keterangan");
</script>