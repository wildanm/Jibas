<?
/**[N]**
 * JIBAS Education Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 18.0 (August 01, 2019)
 * @notes: JIBAS Education Community will be managed by Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
 * 
 * Copyright (C) 2009 Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
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
require_once('../include/config.php');
require_once('../include/db_functions.php');
$nis=$_REQUEST[nis];
$bulan_pjg = array(1=>'Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember');
OpenDb();
$sql_thn="SELECT ph.tanggal1,ph.tanggal2,phsiswa.keterangan FROM jbsakad.phsiswa phsiswa, jbsakad.presensiharian ph WHERE phsiswa.nis='$nis' AND phsiswa.idpresensi=ph.replid GROUP BY YEAR(tanggal1)";
$res_thn=QueryDb($sql_thn);

$s="SELECT DATE(now())";
$re=QueryDb($s);
$r=@mysql_fetch_row($re);
$d=explode("-",$r[0]);
$now=$d[2]."-".$d[1]."-".$d[0];
if ($d[1]==1){
	$y=12;
	} else {
	$y=$d[1]-1;
}
if (strlen($y)==1)
	$y="0".$y;
$ytd=$d[2]."-".$y."-".$d[0];
?>
<form name="panel5">
<table width="100%" border="0" cellspacing="5">
  <tr>
    <td valign="top">
    <fieldset><legend>Periode</legend>
    <table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="50%">
      <input title="Klik untuk membuka kalendar!" type="text" size="10" id="tglawal" readonly onClick="showCal('Calendar1')"  value="<?=$ytd?>"/>
      &nbsp;<img src="../images/ico/calendar.png" name="btnawal" id="btnawal" title="Klik untuk membuka kalendar!" onClick="showCal('Calendar1')"/>&nbsp;s.d.&nbsp;<input title="Klik untuk membuka kalendar!" type="text" size="10" id="tglakhir" readonly onclick="showCal('Calendar2')" value="<?=$now?>"/>
      &nbsp;<img src="../images/ico/calendar.png" id="btnakhir" onClick="showCal('Calendar2')" title="Klik untuk membuka kalendar!"/></td>
    <td width="50%"><img title="Klik untuk menampilkan Presensi Harian" style="cursor:pointer;" src="../images/ico/view.png" width="32" height="32" onclick="show_ph_siswa()" /></td>
  </tr>
  <tr>
    
    </tr>
</table>
    </fieldset></td>
    
  </tr>
  <tr>
    <td  valign="top"><div id="contentph">		</div></td>
  </tr>
</table>
</form>