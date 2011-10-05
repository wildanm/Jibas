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
//require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');

/**/
header('Content-Type: application/vnd.ms-word'); //IE and Opera  
header('Content-Type: application/w-msword'); // Other browsers  
header('Content-Disposition: attachment; filename=Kalender_Akademik.doc');
header('Expires: 0');  
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');

$kelompokJam = NULL;
$jam = NULL;
$jadwal = NULL;
$keg = NULL;

OpenDb();


//$err = false;
//$errMsg = "";
$kalender = $_REQUEST['kalender'];
$sql_kalender = "SELECT MONTH(tglmulai), YEAR(tglmulai), MONTH(tglakhir), YEAR(tglakhir), kalender, tglmulai, tglakhir, departemen, aktif, terlihat FROM jbsakad.kalenderakademik where replid='$kalender'";
$result = QueryDb($sql_kalender);
$row = mysql_fetch_row($result);
$bulan1 = $row[0];
$tahun1 = $row[1];
$bulan2 = $row[2];
$tahun2 = $row[3];
$departemen = $row[7];
$akademik = $row[4];
$periode = LongDateFormat($row[5]).' s/d '.LongDateFormat($row[6]);

if ($row[8] == 1) 
	$aktif = 'Aktif';
else
	$aktif = 'Tidak Aktif';
	
if ($row[9] == 1) 
	$terlihat = 'Terlihat';
else
	$aktif = 'Tidak Terlihat';



$bln = $bulan1;
if (isset($_REQUEST['bln']))
	$bln = $_REQUEST['bln'];
$thn = $tahun1;
if (isset($_REQUEST['thn']))
	$thn = $_REQUEST['thn'];
$prevbln = $bulan1;
if (isset($_REQUEST['prevbln']))
	$prevbln = $_REQUEST['prevbln'];
$prevthn = $tahun1;
if (isset($_REQUEST['prevthn']))
	$prevthn = $_REQUEST['prevthn'];
$next = 0;
if (isset($_REQUEST['next']))
	$next = $_REQUEST['next'];	

$last = 0;
$tahun = $thn;
$bul = $bln+5;
if ($bln > 6) {
	$bul = ($bln+5)-12;
	$tahun = $thn+1;
}

if ($bul >= $bulan2 && $tahun >= $tahun2) {	
	$last = 1;
}

if ($bln == $bulan1 && $thn == $tahun1) {
	$next = 0;
}

$color = array(array("#FD0000","#FFCCCC"),array("#339900","#DFEFDF"),array("#FF7200","#FCCAA0"),array("#5E5CB5","#C7C6EA"),array("#F100C1","#f2ade4"),array("#009F79","#9DD7CB"),array("#8900FE","#DDC1F4"),array("#0080B0","#9CC2D1"),array("#FF9933","#FFFF99"),array("#3EA600","#C1E6AC"),array("#990000","#FF8e8e"),array("#0057B9","#8aaed6"));


OpenDb();
function loadKalender1($kalender) {
	$sql = "SELECT replid, kegiatan, tanggalawal, tanggalakhir, MONTH(tanggalawal), MONTH(tanggalakhir), DAY(tanggalawal), DAY(tanggalakhir), YEAR(tanggalawal), YEAR(tanggalakhir) FROM aktivitaskalender WHERE idkalender = '$kalender' ORDER BY tanggalawal"; 
	$result = QueryDb($sql);
	$i = 0;	
	while($row = mysql_fetch_row($result)) {		
		$tgl1 = explode('-',$row[2]);
		$tgl2 = explode('-',$row[3]);
		$awal = $tgl1[2].'/'.$tgl1[1].'/'.substr($tgl1[0],2,2).' - '.$tgl2[2].'/'.$tgl2[1].'/'.substr($tgl2[0],2,2);
		
		$GLOBALS[keg][row][$i][id] = $row[0];				
		$GLOBALS[keg][row][$i][judul] = $row[1];				
		$GLOBALS[keg][row][$i][tanggal] = $awal;
		++$i;
	}
	return true;
}	

function loadKalender2($kalender, $bulan1, $tahun1, $bulan2, $tahun2) {
	global $keg;
	$batastgl1 = $tahun1."-".$bulan1."-1";
	$batastgl2 = $tahun2."-".$bulan2."-31";
	
	$sql = "SELECT replid, kegiatan, tanggalawal, tanggalakhir, MONTH(tanggalawal), MONTH(tanggalakhir), DAY(tanggalawal), DAY(tanggalakhir), YEAR(tanggalawal), YEAR(tanggalakhir) FROM aktivitaskalender WHERE idkalender = '$kalender' AND (('$batastgl1' BETWEEN tanggalawal AND tanggalakhir) OR ('$batastgl2' BETWEEN tanggalawal AND tanggalakhir) OR (tanggalawal BETWEEN '$batastgl1' AND '$batastgl2') OR (tanggalakhir BETWEEN '$batastgl1' AND '$batastgl2')) ORDER BY tanggalawal";  
	
	$result = QueryDb($sql);
	
	while($row = mysql_fetch_row($result)) {
				
		if ($row[6]<= 7)
			$awal = 1;				
		if (7 < $row[6] && $row[6]<= 14) 
			$awal = 2;
		if (14 < $row[6] && $row[6]<= 21) 
			$awal = 3;
		if (21 < $row[6]) 
			$awal = 4;
		
		if ($row[7] <= 7)
			$akhir = 1;				
		if (7 < $row[7] && $row[7] <= 14) 
			$akhir = 2;
		if (14 < $row[7] && $row[7] <= 21) 
			$akhir = 3;
		if (21 < $row[7]) 
			$akhir = 4;	
		
		$blnawal = $row[4];			
		if ($blnawal < $bulan1) {
			if ($row[9] == $tahun2 && $row[8] <> $tahun2) {
				$blnawal = $bulan1;						
				$awal = 1;
			} 
			if ($row[9] == $tahun1 && $row[8] == $tahun1) {
				$blnawal = $bulan1;						
				$awal = 1;
			}
			if ($row[9] == $tahun2 && $row[8] == $tahun2 && $tahun1 <> $tahun2) {
				$blnawal = $row[4] + 12;
			}
		} 
		
		
		$thnawal = $row[8];
		$thnakhir = $row[9];
		if ($row[9] == $tahun1 || $row[9] == $tahun2) {			
			$blnakhir = $row[5];
			if ($row[5] < $bulan1) {				
				$blnakhir = $row[5] + 12;
			}
			//echo '<br> tahun sama bulan '.$row[5].' bulan1 '.$bulan1.' akhir '. $blnakhir.' row '.$row[4];
		} else {
			$blnakhir = $bulan1 + 5;
			//echo '<br> tahun beda bulan '.$blnakhir. ' bulan1 '.$bulan1.' akhir '.$blnakhir.' bulanawal '.$blnawal.' row '.$row[4];
		}
				
		$kolom = ($blnawal-$bulan1)*4+$awal;
		$selisih = (($blnakhir-$bulan1)*4+$akhir-$kolom)+1;
		//echo "<br>((bulan akhir-bulan awal) x 4 + akhir - kolom) + 1";
		//echo '<br> bulan awal '.$bulan1.'<br> bulan akhir '.$blnakhir.'<br> kolom '.$kolom.'<br> selisih '.$selisih;
		//echo "<br><br> kolom: (blnawal-bulan1) x 4 + awal";
		//echo '<br> blnawal '.$blnawal. ' bulan1 '.$bulan1.' awal '.$awal.' kolom '.$kolom.' selisih '.$selisih;
		//echo '<br>'.(($blnakhir-$blnawal)*4+$akhir).' - '.$kolom;
		$tanggal = $row[6].'/'.$row[4].'/'.substr($row[8],2,2).' - '.$row[7].'/'.$row[5].'/'.substr($row[9],2,2);
		//$tanggal = $row[6].'/'.$row[4].' - '.$row[7].'/'.$row[5];
		if ($selisih == 0) {
			$selisih = 1;			
			//$tanggal = $row[6].'/'.$row[4];
		} 
		
		if ($selisih < 5) {
			//$tanggal = $row[6].'/'.$row[4].'/'.substr($row[8],2,2);
			$tanggal = $row[6].'/'.$row[4];
		}
		
		for ($j=0;$j< count($keg[row]); $j++) {
			if ($keg[row][$j][id] == $row[0]) 				
				$baris = $j;
		}	
		$GLOBALS[jadwal][row][$row[0]][$baris][$kolom][njam] = $selisih;
		$GLOBALS[jadwal][row][$row[0]][$baris][$kolom][awal] = $tanggal;
	}
	return true;
}

function getCell1($r, $c, $id) {
	global $mask, $jadwal, $color;	
	if($mask[$c] == 0) {
		if(isset($jadwal[row][$id][$r][$c])) {	
			$mask[$c+1] = $jadwal[row][$id][$r][$c][njam] - 1;
				
			$m = $r;
			if ($r > count($color)-1) 
				$m = $r - ((count($color)-1)*(int)substr($r,0,1)+1);
								
			$s = "<td align='center' valign='middle' style='background-color: {$color[$m][1]}' colspan='{$jadwal[row][$id][$r][$c][njam]}'>";
			$s.= "<font class='thismonth'>{$jadwal[row][$id][$r][$c][awal]}</font>";						
			$s.= "<br><img src='../images/ico/lihat.png' style='cursor:pointer'";
			$s.= " onclick='lihat($id)'>&nbsp;";			
			$s.= "<img src='../images/ico/ubah.png' style='cursor:pointer'";
			$s.= " onclick='edit($id)'>&nbsp;";
			$s.= "<img src='../images/ico/hapus.png' style='cursor:pointer'";
			$s.= " onclick='hapus($id)'>";
			
			return $s;
		} else {			
			$mask[$c+1] = 0;			
			$s.= "<td align='center' valign='middle' style='background-color: #DFEFFF'>";
			$s.= "</td>";
			return $s;
		}
	} else {
		$mask[$c+1] = $mask[$c]-1;
	}
}

?>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns="http://www.w3.org/TR/REC-html40">
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 11">
<meta name=Originator content="Microsoft Word 11">
<!--<link rel="stylesheet" type="text/css" href="../style/style.css">-->
<link rel=File-List href="Doc1_files/filelist.xml">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>user</o:Author>
  <o:LastAuthor>user</o:LastAuthor>
  <o:Revision>1</o:Revision>
  <o:TotalTime>0</o:TotalTime>
  <o:Created>2008-06-16T08:31:00Z</o:Created>
  <o:LastSaved>2008-06-16T08:31:00Z</o:LastSaved>
  <o:Pages>1</o:Pages>
  <o:Characters>2</o:Characters>
  <o:Lines>1</o:Lines>
  <o:Paragraphs>1</o:Paragraphs>
  <o:CharactersWithSpaces>2</o:CharactersWithSpaces>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
 <w:View>Print</w:View>
 <w:Zoom>100</w:Zoom>
  <w:GrammarState>Clean</w:GrammarState>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" LatentStyleCount="156">
 </w:LatentStyles>
</xml><![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0cm;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
@page Section1
	{size:841.9pt 595.3pt;
	mso-page-orientation:landscape;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
	.thismonth {
		font-family: Georgia, "Times New Roman", Times, serif;
		font-size: 14px;
		font-weight: bold;
	}
	.style1 {
		color: #000000;
		/*font-weight: bold;*/
		font-family: Verdana, Arial, Helvetica, sans-serif;
		font-size: 8px;
	}

	
@page Section2
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;}
div.Section2
	{page:Section2;}
@page Section3
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;}
div.Section3
	{page:Section3;}
.style1 {
	color: #000000;
	font-weight: bold;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9px;
}
.style2 {
	font-size: 14px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #000000;
}
.style5 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 14px; }
.style8 {
	color: #FF0000;
	font-weight: bold;
}
.style13 {color: #000000}
.style14 {color: #FFFFFF}
.style17 {color: #FFFFFF; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; }
.style20 {font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; font-size: 12px; }
.style21 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}
.style22 {font-family: Verdana, Arial, Helvetica, sans-serif}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";
	mso-ansi-language:#0400;
	mso-fareast-language:#0400;
	mso-bidi-language:#0400;}
</style>
<![endif]-->
</head>

<body lang=EN-US style='tab-interval:36.0pt'>

<div class=Section1>
<!--                      Hal 1             -->
<table border="0" cellpadding="10" cellpadding="5" align="left">
<tr class="style1"><td align="left" valign="top">

<? include("../library/headercetak.php") ?>

<center>
  <font size="4"><strong>Kalender Akademik</strong></font><br />
 </center>
<br /><br />
 	<table width="100%">    
	<tr>
		<td width="18%"><strong>Departemen</strong> </td> 
		<td width="*"><strong>:&nbsp;<?=$departemen?></strong></td>
	</tr>
    <tr>
		<td><strong>Kalender Akademik</strong></td>
		<td><strong>:&nbsp;<?=$akademik?></strong></td>        		
    </tr>
    <tr>
		<td><strong>Periode</strong></td>
		<td><strong>:&nbsp;<?=$periode?></strong></td>        		
    </tr>
    <tr>
		<td><strong>Status</strong></td>
		<td><strong>:&nbsp;<?=$aktif?> dan <?=$terlihat?></strong></td>        		
    </tr>
	</table>
	<br />
	<table border="0" cellpadding="5" cellspacing="1" width="100%" style="border-color:#999999">
	<tr height="30" bgcolor="#DFFFDF">
		<td width="22%" align="center" style="background-color:#3366CC; color:#FFFFFF" rowspan="2" colspan="2">
        <b>Kegiatan</b></td>
        <? 	$batasthn = $thn;
			for ($i=$bln;$i<=$bln+5;$i++) { 	
				$n = $i;
				if ($i > 12) {
					$n = $i-12;
					$batasthn = $thn+1;
				}	
		?>
       	<td width="*" align="center" style="background-color:#3366CC; color:#FFFFFF" colspan="4">
        	<b><?=$bulan[$n].' '.substr($batasthn,2,2)?></b>
        <!--&nbsp;<a href="JavaScript:lihat()"><img src="../images/ico/lihat.png" border="0" /></a>-->
        </td>
		<? } ?>
	</tr>
    <tr>
		<? 	
			for ($j=$bln;$j<=$bln+5;$j++) {								
				for ($p = 1; $p <=4; $p++) {
		?>
        <td width="*" align="center" style="background-color:#3366CC; color:#FFFFFF"><?=$p?></td>
           
       	<?		}
			} ?>
	</tr>
	<?
	
	$mask = NULL;
	$s = 0;
	$mask[1] = 0;	
	loadKalender1($kalender);
	loadKalender2($kalender,$bln,$thn,$n,$batasthn);
	if (isset($keg[row])) {
		for ($i = 0; $i < count($keg[row]); $i++ ){
			$id = $keg[row][$i][id];
			$m = $i;
			if ($i > count($color)-1) 
				$m = $i - ((count($color)-1)*(int)substr($i,0,1)+1);		
		
	?>
	<tr>
		<td style="background-color:<?=$color[$m][0]?> ; color:#FFFFFF" align="center"><b><?=($i+1).'. '?></b>
		<td style="background-color:<?=$color[$m][0]?> ; color:#FFFFFF">
        <b><?=$keg[row][$i][judul];
			if (!isset($jadwal[row][$id]))	
				echo '<br>'.$keg[row][$i][tanggal];
			
			?>
      	</b></td>
			<?		
			for($j = 1; $j <=24 ; $j++) {				
				echo getCell1($i, $j, $id); 
			}
			?>
        
	</tr>
	<? 
			
		}
	}
	?> 
	</table>
	</td>
<tr>
</table>
</div>
</body>

</html>