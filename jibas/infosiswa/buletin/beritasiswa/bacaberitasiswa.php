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
require_once('../../include/sessioninfo.php');
require_once('../../include/config.php');
require_once('../../include/getheader.php');
require_once('../../include/db_functions.php');

/*OpenDb();
$sql_berita="SELECT YEAR(tanggal) as thn,MONTH(tanggal) as bln,DAY(tanggal) as tgl,replid as replid,judul as judul,abstrak as abstrak ,isi as berita,idpengirim FROM jbsvcr.beritasiswa WHERE replid=$replid";
$result_berita=QueryDb($sql_berita);
$row_berita=@mysql_fetch_array($result_berita);
$sql_getnama="SELECT nama FROM jbsakad.siswa WHERE nis='$row_berita[idpengirim]'";
$result_getnama=QueryDb($sql_getnama);
if (@mysql_num_rows($result_getnama)>0){
	$row_getnama=@mysql_fetch_array($result_getnama);
	$nama=$row_getnama[nama];
} else {
$sql_getnama2="SELECT nama FROM jbssdm.pegawai WHERE nip='$row_berita[idpengirim]'";	
$result_getnama2=QueryDb($sql_getnama2);
$row_getnama2=@mysql_fetch_array($result_getnama2);
$nama=$row_getnama2[nama];
}
CloseDb();
$namabulan = array("Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","Nopember","Desember");	
$tglberita=$row_berita['tgl']." ".$namabulan[$row_berita['bln']-1]." ".$row_berita['thn'];*/
$replid="";
if (isset($_REQUEST['replid']))
	$replid=$_REQUEST['replid'];
OpenDb();
$sql="SELECT YEAR(b.tanggal) as thn,MONTH(b.tanggal) as bln,DAY(b.tanggal) as tgl,b.replid as replid,b.judul as judul, b.abstrak as abstrak , isi as berita, s.nama as nama FROM jbsvcr.beritasiswa b, jbsakad.siswa s WHERE s.nis=b.idpengirim AND b.replid=$replid";
$result=QueryDb($sql);
$row=@mysql_fetch_array($result);
CloseDb();
$namabulan = array("Januari","Februari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","Nopember","Desember");	
$tglberita=$row['tgl']." ".$namabulan[$row['bln']-1]." ".$row['thn'];
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Baca Berita Siswa</title>
<script language="javascript" src="../../script/tools.js"></script>
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {color: #666666}
.style3 {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
<table id="Table_01" width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../../images_slice/BGNews_01.png" width="12" height="11" alt=""></td>
		<td width="*" height="11" colspan="2" background="../../images_slice/BGNews_02.png">			</td>
		<td>
			<img src="../../images_slice/BGNews_03.png" width="18" height="11" alt=""></td>
	</tr>
	<tr>
	  <td background="../../images_slice/BGNews_04.png"></td>
	  <td background="../../images_slice/BGNews_05.png" align="left"><div align="left" style="padding-bottom:10px"><span style="color:#339900; font-size:20px; font-weight:bold">.:</span><span style="color:#FF6600; font-family:Calibri; font-size:16px; font-weight:bold; ">Berita Siswa</span></div></td>
	  <td align="right" valign="top" background="images_slice/BGNews_05.png"><img src="../../images/ico/hapus.png" width="16" height="16" style="cursor:pointer" onclick="window.close();" /></td>
	  <td background="../../images_slice/BGNews_06.png"></td>
  </tr>
	<tr>
		<td background="../../images_slice/BGNews_04.png" width="12">			</td>
		<td width="*" colspan="2" background="../../images_slice/BGNews_05.png">
            <table width="100%" border="0" cellspacing="0">
              <tr>
               <tr>
                <td width="84" scope="row" align="left"><strong>Dari </strong></td>
                <td width="8" scope="row" align="center"><strong>:</strong></td>
                <td width="857" scope="row" align="left"><?=$row['nama']?></td>
              </tr>
              <tr>
                <td align="left" scope="row"><strong>Tanggal </strong></td>
                <td align="center" scope="row"><strong>:</strong></td>
                <td scope="row" align="left"><?=$tglberita?></td>
              </tr>
              <tr>
                <td align="left" scope="row"><strong>Judul </strong></td>
                <td align="center" scope="row"><strong>:</strong></td>
                <td scope="row" align="left"><?=$row['judul']?></td>
              </tr>
              <tr>
                <td align="left" valign="top" scope="row"><strong>Abstrak </strong></td>
                <td align="center" valign="top" scope="row"><strong>:</strong></td>
                <td scope="row" align="left"><?=$row['abstrak']?></td>
              </tr>
              <tr>
                <th colspan="2" valign="top" scope="row">&nbsp;</th>
                <th background="../../images/box_hr1.gif" scope="row" style="background-repeat:repeat-x; background-position:center">&nbsp;                </th>
              </tr>
              <tr>
                <td align="left" valign="top" scope="row"><strong>Berita </strong></td>
                <td align="center" valign="top" scope="row"><strong>:</strong></td>
                <td scope="row" align="left"><?=$row['berita']?></td>
              </tr>
              <tr>
                <th colspan="2" valign="top" scope="row">&nbsp;</th>
                <th background="../../images/box_hr1.gif" scope="row" style="background-repeat:repeat-x; background-position:center">&nbsp;                </th>
              </tr>
              <tr>
                <td align="left" valign="top" scope="row"><strong>Lampiran </strong></td>
                <td align="center" valign="top" scope="row"><strong>:</strong></td>
                <td scope="row" align="left"><?
        OpenDb();
        $sql2="SELECT direktori,namafile FROM jbsvcr.lampiranberitasiswa WHERE idberita=$row[replid]";
        $result2=QueryDb($sql2);
        while ($row2=@mysql_fetch_array($result2)){
            echo "<a title='Buka lampiran ini!' href='".$row2[direktori].$row2[namafile]."' target='_blank' ><img border='0' src='../../images/ico/titik.png' width='5' heiht='5'/> ".$row2['namafile']."</a><br>";
        }
        CloseDb();
        ?></td>
              </tr>
            </table>		</td>
		<td background="../../images_slice/BGNews_06.png" width="18">			</td>
	</tr>
	<tr>
		<td>
			<img src="../../images_slice/BGNews_07.png" width="12" height="20" alt=""></td>
		<td width="*" height="20" colspan="2" background="../../images_slice/BGNews_08.png">			</td>
		<td>
			<img src="../../images_slice/BGNews_09.png" width="18" height="20" alt=""></td>
	</tr>
</table>

</body>
</html>