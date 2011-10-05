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
require_once('include/common.php');
require_once('include/config.php');
require_once('include/db_functions.php');

$replid = 0;
if (isset($_REQUEST['replid']))
	$replid = $_REQUEST['replid'];
	
if (isset($_REQUEST['Simpan'])) {
	OpenDb();
	$jam = $_REQUEST['jam1'] . ":" . $_REQUEST['jam2'];
	$tempat = $_REQUEST['tempat'];
	$penghulu = $_REQUEST['penghulu'];
	$pasangan = $_REQUEST['pasangan'];
	$keterangan = $_REQUEST['keterangan'];
	$sql = "UPDATE jadwal SET jam='$jam', tempat='$tempat', penghulu='$penghulu', pasangan='$pasangan', keterangan='$keterangan' WHERE replid=$replid";
	
	$result = QueryDb($sql);
	CloseDb();
	
	if ($result) { ?>
		<script language="javascript">
			opener.refresh();
			window.close();
		</script> 
<?	}
}

OpenDb();
$sql = "SELECT penghulu, pasangan, keterangan, tempat, jam FROM jadwal WHERE replid=$replid";
$result = QueryDb($sql);
$row = mysql_fetch_array($result);
$nip = $row['penghulu'];
$pasangan = $row['pasangan'];
$keterangan = $row['keterangan'];
$tempat = $row['tempat'];
$jam = $row['jam'];
CloseDb();

$info = split(":", $jam);
$jam1 = $info[0];
$jam2 = $info[1];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="style/style.css">
<link rel="stylesheet" type="text/css" href="style/tooltips.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tambah Jadwal Pernikahan</title>
<script language="JavaScript" src="script/tooltips.js"></script>
<script language="javascript" src="script/tables.js"></script>
<script language="javascript" src="script/tools.js"></script>
<script language="javascript" src="script/ajax.js"></script>
<script language="javascript" src="script/validasi.js"></script>
<script language="javascript">
function validate() {
	return validateEmptyText('penghulu', 'penghulu') &&
		   validateEmptyText('jam1', 'jam') && 
		   validateEmptyText('jam2', 'menit') && 
		   validateEmptyText('tempat', 'tempat') && 
		   validateEmptyText('pasangan', 'pasangan') && 
		   validateMaxText('keterangan', 255, 'Keterangan');
}

function TambahPenghulu() {
	newWindow('penghulu_add.php', 'TambahPenghulu','350','150','resizable=1,scrollbars=0,status=0,toolbar=0')
}

function UbahPenghulu() {
	var onip = document.getElementById('penghulu').value;
	newWindow('penghulu_edit.php?onip='+onip, 'UbahPenghulu','350','150','resizable=1,scrollbars=0,status=0,toolbar=0')
}

function HapusPenghulu() {
	if (confirm("Apakah anda yakin akan menghapus data ini?")) {
		var nip = document.getElementById('penghulu').value;
		
		WaitPenghulu();
		sendRequestText("jadwal_getpenghulu.php", ShowPenghulu, "op=n9381md03bn89103n1x3803x1&nip="+nip);
	}		
}

function GetPenghulu() {
	WaitPenghulu();
	sendRequestText("jadwal_getpenghulu.php", ShowPenghulu, "sel=<?=$nip?>");
}

function ShowPenghulu(x) {
	document.getElementById("divPenghulu").innerHTML = x;
}

function RefreshPenghulu() {
	sendRequestText("jadwal_getpenghulu.php", ShowPenghulu, "");
}

function ShowWait(areaId) {
	var x = document.getElementById("waitBox").innerHTML;
	document.getElementById(areaId).innerHTML = x;
}

function WaitPenghulu() {
	ShowWait("divPenghulu");
}
</script>
</head>

<body onLoad="GetPenghulu()">
<div id="waitBox" style="position:absolute; visibility:hidden;">
<img src="images/movewait.gif" border="0" />&nbsp;please wait...
</div>
  
<form name="main" onSubmit="return validate()">
<input type="hidden" id="replid" name="replid" value="<?=$replid?>" />
<table border="0" width="100%" cellpadding="2" cellspacing="2" align="center">
<!-- TABLE CONTENT -->
<tr height="25">
<td class="header" colspan="2"><div align="center">Tambah Jadwal</div></td>
</tr>
<tr>
	<td width="120"><strong>Penghulu:</strong></td>
	<td>
    	<table border="0" cellspacing="0" cellpadding="0">
        <tr>
        	<td><div id="divPenghulu"></div></td>
            <td>
		        &nbsp;&nbsp;<a href="JavaScript:TambahPenghulu()" title="Tambah Penghulu"><img src="images/ico/tambah.png" border="0" /></a>
	    	    <a href="JavaScript:UbahPenghulu()" title="Ubah Penghulu"><img src="images/ico/ubah.png" border="0" /></a>&nbsp;
        		<a href="JavaScript:HapusPenghulu()" title="Hapus Penghulu"><img src="images/ico/hapus.png" border="0" /></a>
            </td>
        </tr>
        </table>
			
    </td>
</tr>
<tr>
	<td width="120"><strong>Jam:</strong></td>
	<td>
    	<input type="text" name="jam1" id="jam1" value="<?=$jam1?>" size="2" maxlength="2"/> : <input type="text" name="jam2" id="jam2" value="<?=$jam2?>" size="2" maxlength="2"/>
    </td>
</tr>
<tr>
    <td><strong>Tempat:</strong></td>
    <td>
    	<input type="text" name="tempat" id="tempat" value="<?=$tempat?>" size="30" maxlength="100"/>
    </td>
</tr>
<tr>
	<td><strong>Pasangan:</strong></td>
	<td>
    	<input type="text" name="pasangan" id="pasangan" value="<?=$pasangan?>" size="50" maxlength="100"/>
    </td>
</tr>
<tr>
	<td valign="top">Keterangan:</td>
	<td>
    	<textarea name="keterangan" id="keterangan" rows="3" cols="40"><?=$keterangan ?></textarea>
    </td>
</tr>
<tr>
	<td colspan="2" align="center">
    <input type="submit" name="Simpan" id="Simpan" value="Simpan" class="but" />&nbsp;
    <input type="button" name="Tutup" id="Tutup" value="Tutup" class="but" onClick="window.close()" />
    </td>
</tr>
<!-- END OF TABLE CONTENT -->
</table>
</form>

</body>
</html>