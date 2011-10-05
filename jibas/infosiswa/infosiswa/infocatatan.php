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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
//$nis=$_REQUEST[nis];
$bulan_pjg = array(1=>'Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember');
OpenDb();
$sql_thn="SELECT ph.tanggal1,ph.tanggal2,phsiswa.keterangan FROM jbsakad.phsiswa phsiswa, jbsakad.presensiharian ph WHERE phsiswa.nis='$nis' AND phsiswa.idpresensi=ph.replid GROUP BY YEAR(tanggal1)";
$res_thn=QueryDb($sql_thn);
$nis=$_REQUEST[nis_awal];
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
<form name="panel5" id="panel5" method="post">
<input type="hidden" name="nis" id="nis" value="<?=$nis?>">
<input type="hidden" name="nis_awal" id="nis_awal" value="<?=$nis_awal?>">

<table width="100%" cellpadding="0" cellspacing="0">    
<tr>
	<td width="0">
    <!-- CONTENT GOES HERE //--->	
    <table border="0" cellpadding="2"cellspacing="2" width="100%" style="color:#000000">

    <tr>
    	<td width="100" valign="top" bgcolor="">
        <br />
       	<ul id="maintab" class="shadetabs">
        
       	 	<li ><a href="#default" rel="ajaxcontentarea" onClick="tab_cat('<?=$nis?>','ph')">Cat. Presensi Harian</a></li>
            <li ><a href="#default" rel="ajaxcontentarea" onClick="tab_cat('<?=$nis?>','pp')">Cat. Presensi Pelajaran</a></li>
            <li ><a href="#default" rel="ajaxcontentarea" onClick="tab_cat('<?=$nis?>','ck')">Catatan Kejadian</a></li>
		
		</ul>
      	<div id="ajaxcontentarea2" class="contentstyle" style="overflow:auto;">        
   		<table width="100%" border="0" cellspacing="5">
  <tr>
    <td width="100%" rowspan="2" valign="top">
    <fieldset><legend>Periode</legend>
    <table width="100%" border="0" cellspacing="0">
  <tr>
    <td valign="top">
      <input title="Klik untuk membuka kalendar!" type="text" size="10" id="tglawal" readonly onClick="showCal('Calendar1')" value="<?=$ytd?>"/>
      &nbsp;<img src="../images/ico/calendar.png" name="btnawal" id="btnawal" title="Klik untuk membuka kalendar!" onClick="showCal('Calendar1')"/>&nbsp;s.d.&nbsp;<input title="Klik untuk membuka kalendar!" type="text" size="10" id="tglakhir" readonly onclick="showCal('Calendar2')" value="<?=$now?>"/>
      &nbsp;<img src="../images/ico/calendar.png" id="btnakhir" onClick="showCal('Calendar2')" title="Klik untuk membuka kalendar!"/>&nbsp;<img title="Klik untuk menampilkan Presensi Harian" style="cursor:pointer;" src="../images/ico/view.png" width="32" height="32" onclick="show_ph_siswa()" /></td>
    </tr>
  <tr></tr>
</table>
    </fieldset></td>
    <td width="0">		    </td>
  </tr>
  <tr></tr>
  <tr>
    <td colspan="2" valign="middle"><div id="contentph">&nbsp;</div></td>
    </tr>
</table>
		</div>  <!-- END OF CONTENT //--->
	</td>
</tr>
</table>   
</form>