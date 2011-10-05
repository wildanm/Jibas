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
require_once("sessionchecker.php");
require_once("include/sessioninfo.php");
require_once('include/common.php');
require_once('include/config.php');
require_once('include/db_functions.php');
$menu="";
if (isset($_REQUEST['menu']))
	$menu=$_REQUEST['menu'];
OpenDb();
$sql = "SELECT foto FROM jbsvcr.galerifoto WHERE idguru='".SI_USER_ID()."'";
$result = QueryDb($sql);
CloseDb();
if ($menu=="home"){	
?>

<!--
<div id="hscroll0" style="position:relative;z-index:0;"><ul style="white-space:nowrap;">
	<li delay=5>
    <?
	$x=0;
	while ($row=@mysql_fetch_array($result)){
	$replid[$x]=$row['replid'];
	?>
    <img src="library/gambar.php?replid=<?=$replid[$x]?>" width="80" height="55">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <?
	$x++;
}
$titile=" Guru";
if (SI_USER_ID()=="landlord" || SI_USER_ID()=="LANDLORD")
	$title="";

	
?>
   </li>
</ul>
</div>

	<script language="JavaScript" src="hscroll.js"></script>
-->
<? } 
if ($menu=="akademik"){	
?>
<table  border="0" cellspacing="0" cellpadding="0" class="tab">
  <tr>
    <td scope="row" style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="jadwal/kalender_main.php" target="framecenter" onmouseover="kalender.src='design/icon_menu/kalender_on.png'" name="kalender" id="kalender" onmouseout="kalender.src='design/icon_menu/kalender.png'"><img src="design/icon_menu/kalender.png" name="kalender" width="40" height="40" border="0" id="kalender"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Kalender&nbsp;Akademik</b></font></a></div></td>
    
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="jadwal.php" target="framecenter" onmouseover="jadwal.src='design/icon_menu/jadwal_on.png'" name="jadwal" id="jadwal" onmouseout="jadwal.src='design/icon_menu/jadwal.png'"><img src="design/icon_menu/jadwal.png" name="jadwal" width="40" height="40" border="0" id="jadwal"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Jadwal&nbsp;Mengajar</b></font></a></div></td>
    
    <? if (SI_USER_LEVEL()!=0){ ?>
    <td  style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="pelajaran.php" target="framecenter" onmouseover="pelajaran.src='design/icon_menu/pelajaran_on.png'" name="pelajaran" id="pelajaran" onmouseout="pelajaran.src='design/icon_menu/pelajaran.png'"><img src="design/icon_menu/pelajaran.png" name="pelajaran" width="40" height="40" border="0" id="pelajaran"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Pelajaran</b></font></a></div></td>
    <? } ?>
	
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="penilaian.php" target="framecenter" onmouseover="penilaian.src='design/icon_menu/penilaian_on.png'" name="penilaian" id="penilaian" onmouseout="penilaian.src='design/icon_menu/penilaian.png'"><img src="design/icon_menu/penilaian.png" name="penilaian" width="40" height="40" border="0" id="penilaian"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Penilaian</b></font></a></div></td>
    
    <? if (SI_USER_LEVEL()!=0){ ?>
	<td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="presensi.php" target="framecenter" onmouseover="presensi.src='design/icon_menu/presensi_on.png'" name="presensi" id="presensi" onmouseout="presensi.src='design/icon_menu/presensi.png'"><img src="design/icon_menu/presensi.png" name="presensi" width="40" height="40" border="0" id="presensi"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Presensi</b></font></a></div></td>
    <? } ?>
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="infosiswa/infosiswa.php" target="framecenter" onmouseover="infosiswa.src='design/icon_menu/infosiswa_on.png'" name="infosiswa" id="infosiswa" onmouseout="infosiswa.src='design/icon_menu/infosiswa.png'"><img src="design/icon_menu/infosiswa.png" name="infosiswa" width="40" height="40" border="0" id="infosiswa"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Info&nbsp;Siswa</b></font></a></div></td>

	<td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="catatankejadian.php" target="framecenter" onmouseover="kejadian.src='design/icon_menu/catatankejadian_on.png'" name="kejadian" id="kejadian" onmouseout="kejadian.src='design/icon_menu/catatankejadian.png'"><img src="design/icon_menu/catatankejadian.png" name="kejadian" width="40" height="40" border="0" id="kejadian"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Catatan&nbsp;Kejadian&nbsp;Siswa</b></font></a></div></td>
    
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="perpustakaan/perpustakaan.php" target="framecenter" onmouseover="perpustakaan.src='design/icon_menu/perpustakaan_on.png'" name="perpustakaan" id="perpustakaan" onmouseout="perpustakaan.src='design/icon_menu/perpustakaan.png'"><img src="design/icon_menu/perpustakaan.png" name="perpustakaan" width="40" height="40" border="0" id="perpustakaan"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Katalog Pustaka</b></font></a></div></td>
  </tr>
</table>
<? } 
if ($menu=="buletin"){	
?>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="home.php" target="framecenter" onmouseover="info.src='design/icon_menu/info_on.png'" name="info" id="info" onmouseout="info.src='design/icon_menu/info.png'"><img src="design/icon_menu/info.png" name="info" width="40" height="40" border="0" id="info"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Notifikasi</b></font></a></div></td>

    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="buletin/rubriksekolah/beritasekolah.php" target="framecenter" onmouseover="rubrik.src='design/icon_menu/rubrik_on.png'" name="rubrik" id="rubrik" onmouseout="rubrik.src='design/icon_menu/rubrik.png'"><img src="design/icon_menu/rubrik.png" name="rubrik" width="40" height="40" border="0" id="rubrik"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Berita Sekolah</b></font></a></div></td>
  
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="buletin/beritaguru/beritaguru.php" target="framecenter" onmouseover="beritaguru.src='design/icon_menu/beritaguru_on.png'" name="beritaguru" id="beritaguru" onmouseout="beritaguru.src='design/icon_menu/beritaguru.png'"><img src="design/icon_menu/beritaguru.png" name="beritaguru" width="40" height="40" border="0" id="beritaguru"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Berita Guru</b></font></a></div></td>
    
    <? if (SI_USER_LEVEL()!=0){ ?>
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="buletin/pesan/pesan.php" target="framecenter" onmouseover="pesan.src='design/icon_menu/pesan_on.png'" name="pesan" id="pesan" onmouseout="pesan.src='design/icon_menu/pesan.png'"><img src="design/icon_menu/pesan.png" name="pesan" width="40" height="40" border="0" id="pesan"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Pesan</b></font></a></div></td>
    <? } ?>
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="buletin/beritasiswa/beritasiswa.php" target="framecenter" onmouseover="beritasiswa.src='design/icon_menu/beritasiswa_on.png'" name="beritasiswa" id="beritasiswa" onmouseout="beritasiswa.src='design/icon_menu/beritasiswa.png'"><img src="design/icon_menu/beritasiswa.png" name="beritasiswa" width="40" height="40" border="0" id="beritasiswa"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Berita Siswa</b></font></a></div></td>
    
    <? if (SI_USER_LEVEL()!=0){ ?>
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="buletin/agendaguru/agenda.php" target="framecenter" onmouseover="agendaguru.src='design/icon_menu/agenda_on.png'" name="agendaguru" id="agendaguru" onmouseout="agendaguru.src='design/icon_menu/agenda.png'"><img src="design/icon_menu/agenda.png" name="agendaguru" width="40" height="40" border="0" id="agendaguru"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Agenda Guru</b></font></a></div></td>
   
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="buletin/galerifoto/galerifoto.php" target="framecenter" onmouseover="galerifoto.src='design/icon_menu/galeri_on.png'" name="galerifoto" id="galerifoto" onmouseout="galerifoto.src='design/icon_menu/galeri.png'"><img src="design/icon_menu/galeri.png" name="galerifoto" width="40" height="40" border="0" id="galerifoto"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Galeri Foto</b></font></a></div></td>
    <? } ?>
     <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="buletin/filesharing/main.php" target="framecenter" onmouseover="filesharing.src='design/icon_menu/fileshare_on.png'" name="filesharing" id="filesharing" onmouseout="filesharing.src='design/icon_menu/fileshare.png'"><img src="design/icon_menu/fileshare.png" name="filesharing" width="40" height="40" border="0" id="filesharing"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>File Sharing</b></font></a></div></td>
    <td  style="padding-right:15px"><div align="center"><a onclick="chating_euy()" style="text-decoration:none;" href="#" target="_self" onmouseover="chat.src='design/icon_menu/chating_on.png'" name="chat" id="chat" onmouseout="chat.src='design/icon_menu/chating.png'"><img src="design/icon_menu/chating.png" name="chat" width="40" height="40" border="0" id="chat"/><br>
	<font face="Verdana" size="1" color="#FFFFFF"><b>Chatting</b></font></a></div></td>
  </tr>
</table>
<? } 
if ($menu=="pengaturan"){	
?>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
	<?
	//if (SI_USER_ID()!="landlord" && SI_USER_ID()!="LANDLORD") {
	?>
	<td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="#" onmouseover="gantipassword.src='design/icon_menu/gantipassword_on.png'" name="gantipassword" id="gantipassword" onmouseout="gantipassword.src='design/icon_menu/gantipassword.png'" onclick="ganti()"><img src="design/icon_menu/gantipassword.png" name="gantipassword" width="40" height="40" border="0" id="gantipassword"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Ganti Password</b></font></a></div></td>
    <? //} 
	if (SI_USER_ID()=="landlord" || SI_USER_ID()=="LANDLORD") {
	?>
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="pengaturan/user.php" target="framecenter" onmouseover="daftarpengguna.src='design/icon_menu/pengguna_on.png'" name="daftarpengguna" id="daftarpengguna" onmouseout="daftarpengguna.src='design/icon_menu/pengguna.png'"><img src="design/icon_menu/pengguna.png" name="daftarpengguna" width="40" height="40" border="0" id="daftarpengguna"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Daftar Pengguna</b></font></a></div></td>
	<? } ?>
    <?  
	if (SI_USER_ID()=="landlord" || SI_USER_ID()=="LANDLORD") {
	?>
    <td style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="pengaturan/queryerror.php" target="framecenter"><img src="images/ico/b_warning.png" width="40" height="40" border="0" /><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Query Error Log</b></font></a></div></td>
	<? } ?>
    
  </tr>
</table>
<? } 
if ($menu=="dotnet"){	
?>
<table border="0" cellspacing="0" cellpadding="0">
  <tr>
	<?
	if (SI_USER_ID()=="landlord" || SI_USER_ID()=="LANDLORD") {
	?>
	<td  style="padding-right:15px"><div align="center"><a style="text-decoration:none;" href="jibasdotnet/daftar_buletin.php" target="framecenter" onmouseover="daftar.src='design/icon_menu/daftarbuletin_on.png'" name="daftar" id="daftar" onmouseout="daftar.src='design/icon_menu/daftarbuletin.png'"><img src="design/icon_menu/daftarbuletin.png" name="daftar" width="40" height="40" border="0" id="daftar"/><br>
    <font face="Verdana" size="1" color="#FFFFFF"><b>Daftar Buletin</b></font></a></div></td>
	<? } ?>
  </tr>
</table>
<? } ?>