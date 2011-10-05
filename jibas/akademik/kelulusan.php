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
include('cek.php');
require_once('include/sessioninfo.php');
?>
<html>
<head>
<title>Kelulusan</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="style/tooltips.css">
<script type="text/javascript" src="script/tooltips.js"></script>
<script type="text/javascript">
function get_fresh(){
	document.location.reload();
}
function change_theme(theme){
	parent.topcenter.location.href="topcenter.php?theme="+theme;
	parent.topleft.location.href="topleft.php?theme="+theme;
	parent.topright.location.href="topright.php?theme="+theme;
	parent.midleft.location.href="midleft.php?theme="+theme;
	get_fresh();
	parent.midright.location.href="midright.php?theme="+theme;
	parent.bottomleft.location.href="bottomleft.php?theme="+theme;
	parent.bottomcenter.location.href="bottomcenter.php?theme="+theme;
	parent.bottomright.location.href="bottomright.php?theme="+theme;
}
</script>
<style type="text/css">
<!--
.style2 {
	font-family: Calibri;
	font-size: 12px;
	font-weight: bold;
}
.style3 {font-family: Calibri; font-size: 12px; font-weight: bold; color: #000000; }
-->
</style>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="100%" border="0" cellspacing="0">
  <tr>
    <th scope="row"><p align="left">&nbsp;&nbsp;<font size="5" style="background-color:#ffcc66">&nbsp;</font>&nbsp;<font size="3" face="Verdana" color="Gray"><strong>KENAIKAN & KELULUSAN</strong></font></p></th>
  </tr>
  <tr>
    <th scope="row">
    
    </th>
  </tr>
</table>
<!-- ImageReady Slices (Kelulusan.psd) -->
<table id="Table_01" width="453" height="319" border="0" cellpadding="0" cellspacing="0" align="left" >
	<tr>
		<td colspan="11">
			<img src="images_slice/kelulusan_01.gif" width="452" height="18" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="1" height="18" alt=""></td>
	</tr>
	<tr>
		<td colspan="2">
			<img src="images_slice/kelulusan_02.gif" width="134" height="117" alt=""></td>
		<td colspan="3">
			<img src="images_slice/kelulusan_03.gif" alt="" width="70" height="117" border="0" onClick="alert ('Untuk mendata Departemen Baru, Tahun Ajaran Baru, Angkatan Baru, dan Kelas Baru \nSilakan lakukan di Bagian Referensi');" style="cursor:pointer"></td>
		<td colspan="3">
			<img src="images_slice/kelulusan_04.gif" width="122" height="117" alt=""></td>
		<td colspan="3">
			<img src="images_slice/kelulusan_05.gif" width="126" height="117" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="1" height="117" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="images_slice/kelulusan_06.gif" width="25" height="84" alt=""></td>
		<td colspan="2" rowspan="2">
           	<a href="siswa/siswa_kenaikan_main.php"  onMouseOver="showhint('Pendataan Siswa yang Naik Kelas', this, event, '100px')">
            <img src="images_slice/kelulusan_07.gif" alt="" width="139" height="84" border="0" >
			</a>
        </td>
		<td colspan="3" rowspan="2">
			<img src="images_slice/kelulusan_08.gif" width="95" height="84" alt=""></td>
		<td rowspan="2">
			<img src="images_slice/kelulusan_09.gif" width="1" height="84" alt=""></td>
		<td colspan="3" valign="bottom"><a href="siswa/siswa_lulus_main.php"  onMouseOver="showhint('Pendataan Kelulusan Siswa', this, event, '100px')">
			<img src="images_slice/kelulusan_10.gif" alt="" width="172" height="81" border="0">
            </a></td>
		<td>
			<img src="images_slice/kelulusan_11.gif" width="20" height="81" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="1" height="81" alt=""></td>
	</tr>
	<tr>
		<td rowspan="2" valign="top">
			<img src="images_slice/kelulusan_12.gif" width="66" height="102" alt=""></td>
		<td rowspan="2">
			<img src="images_slice/kelulusan_13.gif" width="1" height="102" alt=""></td>
		<td colspan="2" rowspan="2">
			<a href="siswa/alumni_main.php" class="style3" onMouseOver="showhint('Pendataan (Tambah, Ubah, Hapus) data Alumni!', this, event, '100px')">Pendataan Alumni</a><br>
        <a href="siswa/alumni.php" class="style3" onMouseOver="showhint('Daftar Alumni !', this, event, '100px')">Daftar Alumni</a><br>
        <a href="siswa/alumni_cari.php" onMouseOver="showhint('Pencarian alumni !', this, event, '100px')" class="style3">Pencarian Alumni</a>
      </td>
<td>
			<img src="images_slice/spacer.gif" width="1" height="3" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images_slice/kelulusan_15.gif" width="25" height="99" alt=""></td>
		<td colspan="3">
			<a href="siswa/siswa_tidak_naik_main.php"  onMouseOver="showhint('Pendataan Siswa Yang Tidak Naik Kelas', this, event, '100px')">
			<img src="images_slice/kelulusan_16.gif" alt="" width="146" height="99" border="0" >
			</a>
        </td>
		<td colspan="3">
			<img src="images_slice/kelulusan_17.gif" width="89" height="99" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="1" height="99" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images_slice/spacer.gif" width="25" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="109" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="30" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="7" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="33" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="55" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="1" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="66" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="1" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="105" height="1" alt=""></td>
		<td>
			<img src="images_slice/spacer.gif" width="20" height="1" alt=""></td>
		<td></td>
	</tr>
</table>
<!-- End ImageReady Slices -->
</body>
</html>