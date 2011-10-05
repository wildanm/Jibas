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
require_once('../include/db_functions.php');
require_once('../include/rupiah.php');
require_once('../library/departemen.php');
openDb();
$replid=$_REQUEST['replid'];
$kalender=$_REQUEST['kalender'];
$simpan=$_REQUEST['Simpan'];
$op=$_REQUEST['op'];
if($op=="edit")
		{
		$sql_get="SELECT * FROM jbsakad.aktivitaskalender WHERE replid='$replid'";
		$result_get=QueryDb($sql_get);
		$row_get=@mysql_fetch_array($result_get);
		}
if($simpan=="Simpan")
		{
		$tanggalawal=TglDb($_REQUEST[tglmulai]);
		$tanggalakhir=TglDb($_REQUEST[tglakhir]);
		$sql_simpan="UPDATE jbsakad.aktivitaskalender SET idkalender='$_REQUEST[kalender]',tanggalawal='$tanggalawal',tanggalakhir='$tanggalakhir',kegiatan='$_REQUEST[kegiatan]' WHERE replid='$replid'";
		$result_simpan=QueryDb($sql_simpan);
		if ($result_simpan){
		?>
<script language="javascript">
//alert ('Berhasil !');
//parent.opener.refresh_after_add('<?=$_REQUEST[departemen]?>','<?=$row_idterakhir[idterakhir]?>');
window.close();
</script>
<?
		} else {
		?>
<script language="javascript">
alert ('Gagal menyimpan data !');
document.location.href="kalender_edit.php?kalender=<?=$_REQUEST[kalender]?>&replid=<?=$_REQUEST[replid]?>";
</script>
<?
		}
		
		}
CloseDb();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="../style/calendar-win2k-1.css">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #666666;
	font-weight: bold;
}
-->
</style>
<script type="text/javascript" src="../script/tools.js"></script>
<script type="text/javascript" src="../script/calendar.js"></script>
<script type="text/javascript" src="../script/lang/calendar-en.js"></script>
<script type="text/javascript" src="../script/calendar-setup.js"></script>
</head>

<script language="javascript">
function cekTanggal(awal,akhir)
{
	c=new Date(awal.substr(0,2),awal.substr(3,2),awal.substr(6,4));
	d=new Date(akhir.substr(0,2),akhir.substr(3,2),akhir.substr(6,4));
	if(c>d)
		{
			return false;
		}
	else
		{
			return true;
		} 
}
function validasi()
	{
		if(document.form_kegiatan.tglmulai.value=="")
			{
				alert("Tanggal awal belum diisi");
				return false;		
			}
		else if(document.form_kegiatan.tglakhir.value=="")
			{
				alert("Tanggal akhir belum diisi");
				return false;		
			}
		else if(cekTanggal(document.form_kegiatan.tglmulai.value,document.form_kegiatan.tglakhir.value)==false)
			{
				alert("Tanggal Mulai lebih besar daripada Tanggal Akhir");
				return false;
			}		
		else if(document.form_kegiatan.kegiatan.value=="")
			{
				alert("Kegiatan belum diisi");
				return false;
			}
		return true;
	}
</script>
<script language="javascript" src="../script/cal2.js"></script>
<script language="javascript" src="../script/cal_conf2.js"></script>
<body>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="background-color:#FFFFFF">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr height="58">
	<td width="28" background="../<?=GetThemeDir() ?>bgpop_01.jpg">&nbsp;</td>
    <td width="*" background="../<?=GetThemeDir() ?>bgpop_02a.jpg">&nbsp;</td>
    <td width="28" background="../<?=GetThemeDir() ?>bgpop_03.jpg">&nbsp;</td>
</tr>
<tr height="150">
	<td width="28" background="../<?=GetThemeDir() ?>bgpop_04a.jpg">&nbsp;</td>
    <td width="0" style="background-color:#FFFFFF">
    <!-- CONTENT GOES HERE //--->
<form name="form_kegiatan" method="post" action="tambah_kegiatan.php" onSubmit="return validasi()">

	<table width="450"  border="0" align="center" cellpadding="3">
    <tr>
      <td colspan="3" class="header">Edit Kegiatan</td>
    </tr>
    <tr>
      <td width="75">Tanggal</td>
      <td width="6">:</td>
      <td width="393"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr valign="top">
          <td><input type="text" name="tglmulai" id="tglmulai" readonly="readonly" value="<?=TglText($row_get['tanggalawal'])?>"/>
            <img src="../images/ico/calendar_1.png" alt="Tampilkan Tabel" name="tabel" width="22" height="22" border="0" id="btntglmulai" onMouseOver="showhint('Buka kalendar!', this, event, '120px')"/>
            <input name="kalender" type="hidden" id="kalender" value="<?=$row_get[idkalender];?>">
          <td><input type="text" name="tglakhir" id="tglakhir"  readonly="readonly" value="<?=TglText($row_get['tanggalakhir'])?>" />
            <img src="../images/ico/calendar_1.png" alt="Tampilkan Tabel" name="tabel" width="22" height="22" border="0" id="btntglakhir" onMouseOver="showhint('Buka kalendar!', this, event, '120px')"/></td>
        </tr>
      </table></td>
    </tr>
    <tr valign="top">
      <td>Kegiatan</td>
      <td>:</td>
      <td><textarea name="kegiatan" cols="50" rows="8" id="kegiatan"><?=$row_get['kegiatan'];?></textarea></td>
    </tr>
    <tr>
      <td colspan="3"><div align="center">
        <input name="Simpan" id="Simpan" type="Submit" class="but" value="Simpan" >
        <input name="Submit2" type="button" class="but" value="Tutup" onClick="javascript:window.close();">
      </div></td>
      </tr>
  </table>
		

</form>
<script type="text/javascript">
  Calendar.setup(
    {
      inputField  : "tglmulai",         // ID of the input field
      ifFormat    : "%d-%m-%Y",    // the date format
      button      : "btntglmulai"       // ID of the button
    }
  );
   Calendar.setup(
    {
      inputField  : "tglakhir",         // ID of the input field
      ifFormat    : "%d-%m-%Y",    // the date format
      button      : "btntglakhir"       // ID of the button
    }
  );
</script>
<!-- END OF CONTENT //--->
    </td>
    <td width="28" background="../<?=GetThemeDir() ?>bgpop_06a.jpg">&nbsp;</td>
</tr>
<tr height="28">
	<td width="28" background="../<?=GetThemeDir() ?>bgpop_07.jpg">&nbsp;</td>
    <td width="*" background="../<?=GetThemeDir() ?>bgpop_08a.jpg">&nbsp;</td>
    <td width="28" background="../<?=GetThemeDir() ?>bgpop_09.jpg">&nbsp;</td>
</tr>
</table>
</body>
</html>