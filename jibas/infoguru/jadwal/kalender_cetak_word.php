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
require_once('../include/config.php');
require_once('../include/theme.php');
require_once('../include/db_functions.php');
/**/
header('Content-Type: application/vnd.ms-word'); //IE and Opera  
header('Content-Type: application/w-msword'); // Other browsers  
header('Content-Disposition: attachment; filename=Nilai_Pelajaran.doc');
header('Expires: 0');  
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');

OpenDb();

if (isset($_REQUEST['departemen']))
	$departemen = $_REQUEST['departemen'];

if (isset($_REQUEST['semester']))
	$semester = $_REQUEST['semester'];

if (isset($_REQUEST['tingkat']))
	$tingkat = $_REQUEST['tingkat'];

if (isset($_REQUEST['tahunajaran']))
	$tahunajaran = $_REQUEST['tahunajaran'];

if (isset($_REQUEST['pelajaran'])) 
	$pelajaran = $_REQUEST['pelajaran'];

if (isset($_REQUEST['kelas']))
	$kelas = $_REQUEST['kelas'];

if (isset($_REQUEST['nis']))
	$nis = $_REQUEST['nis'];
//echo "Dep=".$departemen.", Tkt=".$tingkat.", Kls=".$kelas.", Pelajaran=".$pelajaran.", Semester=".$semester.", Thn AJaran=".$tahun;
 	$sql_get_ta="SELECT tahunajaran FROM jbsakad.tahunajaran WHERE replid='$tahunajaran'";
	$result_get_ta=QueryDb($sql_get_ta);
	$row_get_ta=@mysql_fetch_array($result_get_ta);
	
	$sql_get_nama="SELECT nama FROM jbsakad.siswa WHERE nis='$nis'";
	$result_get_nama=QueryDb($sql_get_nama);
	$row_get_nama=@mysql_fetch_array($result_get_nama);
	
	 $sql_get_kls="SELECT kelas FROM jbsakad.kelas WHERE replid='$kelas'";
	$result_get_kls=QueryDb($sql_get_kls);
	$row_get_kls=@mysql_fetch_array($result_get_kls);
	
	$sql_get_sem="SELECT semester FROM jbsakad.semester WHERE replid='$semester'";
	$result_get_sem=QueryDb($sql_get_sem);
	$row_get_sem=@mysql_fetch_array($result_get_sem);
	
	$sql_get_w_kls="SELECT p.nama as namawalikelas, p.nip as nipwalikelas FROM jbssdm.pegawai p, jbsakad.kelas k WHERE k.replid='$kelas' AND k.nipwali=p.nip";
	//echo $sql_get_w_kls;
	$rslt_get_w_kls=QueryDb($sql_get_w_kls);
	$row_get_w_kls=@mysql_fetch_array($rslt_get_w_kls);
	
	$sql_get_kepsek="SELECT d.nipkepsek as nipkepsek,p.nama as namakepsek FROM jbssdm.pegawai p, jbsakad.departemen d WHERE  p.nip=d.nipkepsek AND d.departemen='$departemen'";
	//echo $sql_get_kepsek;
	$rslt_get_kepsek=QueryDb($sql_get_kepsek);
	$row_get_kepsek=@mysql_fetch_array($rslt_get_kepsek);
?>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 11">
<meta name=Originator content="Microsoft Word 11">
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;
	mso-header-margin:36.0pt;
	mso-footer-margin:36.0pt;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
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
	font-size: 14px;
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
<? include("../library/headercetak.php") ?><!--<img src="http://192.168.1.234/jibassimaka2/images/ico/blank_statistik.png">-->
<table width="100%" border="0">
  <tr>
    <td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#666666">
  <tr>
    <td height="16" colspan="2" bgcolor="#FFFFFF"><div align="center" class="style13 style2"><strong>NILAI HASIL
          BELAJAR</strong></div></td>
    </tr>
  <tr>
    <td height="20"><span class="style5">Departemen</span></td>
    <td height="20"><span class="style5">:&nbsp;
        <?=$departemen?>
    </span></td>
  </tr>
  <tr>
    <td height="20"><span class="style5">Tahun Ajaran</span></td>
    <?
   
	
	?><td height="20"><span class="style5">:&nbsp;
        <?=$row_get_ta[tahunajaran]?>
    </span></td>
  </tr>
  <tr>
    <td width="6%" height="20"><span class="style5">NIS 
    </span></td>
    <td width="93%" height="20"><span class="style5">:&nbsp;
        <?=$nis?>
    </span></td>
  </tr>
  <tr>
    <td height="20"><span class="style5">Nama</span></td>
    <?
	
	
	?>
	<td height="20"><span class="style5">:&nbsp;
	    <?=$row_get_nama[nama]?>
	</span></td>
  </tr>
  <tr>
    <td height="20"><span class="style5">Kelas/Semester&nbsp;</span></td>
    
    <?
   
	?>
    <td height="20"><span class="style5">:&nbsp;
        <?=$row_get_kls[kelas]."/".$row_get_sem[semester]?>
    </span></td>
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td>
    
    <table width="100%" border="1" bordercolor="#FFFFFF" class="tab" id="table">
  <tr>
    <td width="27%" rowspan="2" bgcolor="#666666" class="headerlong"><div align="center" class="style17">Pelajaran</div></td>
    <td width="14%" rowspan="2" bgcolor="#666666" class="headerlong"><div align="center" class="style17">Standar Kelulusan</div></td>
    <td width="18%" colspan="2" bgcolor="#666666" class="headerlong"><div align="center" class="style17">Nilai Pemahaman Konsep</div></td>
    <td width="19%" colspan="2" bgcolor="#666666" class="headerlong"><div align="center" class="style17">Nilai Praktik</div></td>
    <td width="23%" rowspan="2" bgcolor="#666666" class="headerlong"><div align="center" class="style17">Predikat</div></td>
  </tr>
  <tr>
    <td bgcolor="#666666" class="header"><div align="center" class="style17">Angka</div></td>
    <td bgcolor="#666666" class="header"><div align="center" class="style17">Huruf</div></td>
    <td bgcolor="#666666" class="header"><div align="center" class="style17">Angka</div></td>
    <td bgcolor="#666666" class="header"><div align="center" class="style17">Huruf</div></td>
    </tr>
	<?
	$sql_get_pelajaran_laporan="SELECT * FROM jbsakad.pelajaran WHERE departemen='$departemen' ORDER BY nama ASC";
	$result_get_pelajaran_laporan=QueryDb($sql_get_pelajaran_laporan);
	$cntpel_laporan=1;
	while ($row_get_pelajaran_laporan=@mysql_fetch_array($result_get_pelajaran_laporan)){
		$sql_get_pred="SELECT k.predikat as predikat FROM jbsakad.komennap k, jbsakad.infonap i WHERE k.nis='$nis' AND i.idpelajaran='$row_get_pelajaran_laporan[replid]' AND i.replid=k.idinfo";
		$result_get_pred=QueryDb($sql_get_pred);
		$row_get_pred=@mysql_fetch_array($result_get_pred);
		switch ($row_get_pred[predikat]){
			case "":$predikat="";
			break;
			case "0":$predikat="Buruk";
			break;
			case "1":$predikat="Kurang";
			break;
			case "2":$predikat="Cukup";
			break;
			case "3":$predikat="Baik";
			break;
			case "4":$predikat="Istimewa";
			break;
		}
		//Get infonap id and min value
		$sql_get_infonap="SELECT replid,nilaimin FROM jbsakad.infonap WHERE idpelajaran='$row_get_pelajaran_laporan[replid]' AND idsemester='$semester' AND idkelas='$kelas'";
		$result_get_infonap=QueryDb($sql_get_infonap);
		$row_get_infonap=@mysql_fetch_array($result_get_infonap);
		//get value from nap pemahaman konsep
		$sql_get_nap_PK="SELECT n.nilaiangka as nilaiangka,n.nilaihuruf as nilaihuruf FROM jbsakad.nap n, jbsakad.aturannhb a WHERE n.idinfo='$row_get_infonap[replid]' AND n.idaturan=a.replid AND n.nis='$nis' AND a.dasarpenilaian='Pemahaman Konsep'";
		$result_get_nap_PK=QueryDb($sql_get_nap_PK);
		$row_get_nap_PK=@mysql_fetch_array($result_get_nap_PK);
		//get value from nap praktik
		$sql_get_nap_P="SELECT n.nilaiangka as nilaiangka,n.nilaihuruf as nilaihuruf FROM jbsakad.nap n, jbsakad.aturannhb a WHERE n.idinfo='$row_get_infonap[replid]' AND n.idaturan=a.replid AND n.nis='$nis' AND a.dasarpenilaian='Praktik'";
		$result_get_nap_P=QueryDb($sql_get_nap_P);
		$row_get_nap_P=@mysql_fetch_array($result_get_nap_P);
	?>
  <tr>
    <td height="25"><span class="style5"><?=$row_get_pelajaran_laporan[nama]?></span>
					<!--<input type="hidden" name="replid_pel_laporan" id="replid_pel_laporan" value="<?=$row_get_pelajaran_laporan[replid]?>">-->	</td>
    <td height="25" align="center"><span class="style5"><?=$row_get_infonap[nilaimin]?></span></td>
    <!-- Biar ada merahnya -->
	<?
		if ($row_get_nap_PK[nilaiangka]<$row_get_infonap[nilaimin]){
		?>
	<td height="25" align="center"><font color="red"><span class="style5"><?=$row_get_nap_PK[nilaiangka]?></span></font><br></td>
    <?
	} else {
			?>
	<td height="25" align="center"><span class="style5"><?=$row_get_nap_PK[nilaiangka]?></span><br></td>
	<?
				}
			?>
	<td height="25" align="center"><span class="style5"><?=$row_get_nap_PK[nilaihuruf]?></span></td>
     <!-- Biar ada merahnya -->
	<?
		if ($row_get_nap_P[nilaiangka]<$row_get_infonap[nilaimin]){
		?>
	<td height="25" align="center"><font color="red"><span class="style5"><?=$row_get_nap_P[nilaiangka]?></span></font><br></td>
    <?
	} else {
			?>
	<td height="25" align="center"><span class="style5"><?=$row_get_nap_P[nilaiangka]?></span><br></td>
	<?
				}
			?>
    <td height="25" align="center"><span class="style5"><?=$row_get_nap_P[nilaihuruf]?></span></td>
    <td height="25" align="center"><span class="style5"><?=$predikat?></span></td>
  </tr>
	<?
		$cntpel_laporan++;
		}
	?>
</table>
    </td>
  </tr>
  <tr>
    <td>
     <table width="100%" border="0">
  <tr>
    <td rowspan="2" width="33%"><div align="center">Orang Tua/Wali Siswa</div></td>
    <td width="33%"><div align="center">Mengetahui,</div></td>
    <td rowspan="2" width="33%"><div align="center">Wali Kelas</div></td>
  </tr>
  <tr>
    <td width="33%"><div align="center">Kepala Sekolah 
      <?=$departemen?>
    </div></td>
  </tr>
  <tr>
    <td width="33%" height="50"><div align="center"></div></td>
    <td width="33%" height="50"><div align="center"></div></td>
    <td width="33%" height="50"><div align="center"></div></td>
  </tr>
  <tr>
    <td width="33%" rowspan="2"><div align="center">(.............................................)</div></td>
    <td width="33%"><div align="center">
      <u><?=$row_get_kepsek[namakepsek]?></u>
    </div></td>
    <td width="33%"><div align="center">
      <u><?=$row_get_w_kls[namawalikelas]?></u>
    </div></td>
  </tr>
  <tr>
    <td><div align="center">
      NIP : <?=$row_get_kepsek[nipkepsek]?>
    </div></td>
    <td width="33%"><div align="center">
      NIP : <?=$row_get_w_kls[nipwalikelas]?>
    </div></td>
  </tr>
</table>
    </td>
  </tr>
</table>

</div>

<span style='font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:
"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:EN-US;
mso-bidi-language:AR-SA'><br clear=all style='page-break-before:always;
mso-break-type:section-break'>
</span>

<div class=Section2>
<table width="100%" border="0">
  <tr>
    <td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#666666">
  <tr>
    <td height="16" colspan="2" bgcolor="#FFFFFF"><div align="center" class="style13 style2"><strong>KOMENTAR
        HASIL BELAJAR</strong></div></td>
    </tr>
  <tr>
    <td height="20"><span class="style5">Departemen</span></td>
    <td height="20"><span class="style5">:&nbsp;
        <?=$departemen?>
    </span></td>
  </tr>
  <tr>
    <td height="20"><span class="style5">Tahun Ajaran</span></td>
    <?
   
	
	?><td height="20"><span class="style5">:&nbsp;
        <?=$row_get_ta[tahunajaran]?>
    </span></td>
  </tr>
  <tr>
    <td width="6%" height="20"><span class="style5">NIS 
    </span></td>
    <td width="93%" height="20"><span class="style5">:&nbsp;
        <?=$nis?>
    </span></td>
  </tr>
  <tr>
    <td height="20"><span class="style5">Nama</span></td>
    <?
	
	
	?>
	<td height="20"><span class="style5">:&nbsp;
	    <?=$row_get_nama[nama]?>
	</span></td>
  </tr>
  <tr>
    <td height="20"><span class="style5">Kelas/Semester&nbsp;</span></td>
    
    <?
   
	?>
    <td height="20"><span class="style5">:&nbsp;
        <?=$row_get_kls[kelas]."/".$row_get_sem[semester]?>
    </span></td>
  </tr>
</table>
	</td>
  </tr>
  <tr>
    <td>

	<table width="100%" border="1" bordercolor="#FFFFFF" class="tab" id="table">
	<tr>
	<td width="27%" height="30" align="center" bgcolor="#666666" class="style14 header"><span class="style17">Pelajaran</span></td>
	<td width="73%" height="30" align="center" bgcolor="#666666" class="style14 header"><span class="style17">Komentar</span></td>
	</tr>
	<!-- Ambil pelajaran per departemen-->
	<?
	$sql_get_pelajaran_komentar="SELECT * FROM jbsakad.pelajaran WHERE departemen='$departemen' ORDER BY nama ASC";
	$result_get_pelajaran_komentar=QueryDb($sql_get_pelajaran_komentar);
	$cntpel_komentar=1;
	while ($row_get_pelajaran_komentar=@mysql_fetch_array($result_get_pelajaran_komentar)){
	$sql_get_komentar="SELECT k.komentar FROM jbsakad.komennap k, jbsakad.infonap i WHERE k.nis='$nis' AND i.idpelajaran='$row_get_pelajaran_komentar[replid]' AND i.replid=k.idinfo";
	$result_get_komentar=QueryDb($sql_get_komentar);
	$row_get_komentar=@mysql_fetch_row($result_get_komentar);
	?>
	<tr>
	<td height="25"><span class="style5"><?=$row_get_pelajaran_komentar[nama]?></span></td>
	<td height="25"><?=$row_get_komentar[0]?></td>
	</tr>
	<?
	$cntpel_komentar++;
	}
	?>
	</table>

	</td>
  </tr>
  <tr>
    <td>
	
	 <table width="100%" border="0">
  <tr>
    <td rowspan="2" width="33%"><div align="center">Orang Tua/Wali Siswa</div></td>
    <td width="33%"><div align="center">Mengetahui,</div></td>
    <td rowspan="2" width="33%"><div align="center">Wali Kelas</div></td>
  </tr>
  <tr>
    <td width="33%"><div align="center">Kepala Sekolah 
      <?=$departemen?>
    </div></td>
  </tr>
  <tr>
    <td width="33%" height="50"><div align="center"></div></td>
    <td width="33%" height="50"><div align="center"></div></td>
    <td width="33%" height="50"><div align="center"></div></td>
  </tr>
  <tr>
    <td width="33%" rowspan="2"><div align="center">(.............................................)</div></td>
    <td width="33%"><div align="center">
      <u><?=$row_get_kepsek[namakepsek]?></u>
    </div></td>
    <td width="33%"><div align="center">
      <u><?=$row_get_w_kls[namawalikelas]?></u>
    </div></td>
  </tr>
  <tr>
    <td><div align="center">
      NIP : <?=$row_get_kepsek[nipkepsek]?>
    </div></td>
    <td width="33%"><div align="center">
      NIP : <?=$row_get_w_kls[nipwalikelas]?>
    </div></td>
  </tr>
</table>

	</td>
  </tr>
</table>
</div>

<span style='font-size:12.0pt;font-family:"Times New Roman";mso-fareast-font-family:
"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:EN-US;
mso-bidi-language:AR-SA'><br clear=all style='page-break-before:always;
mso-break-type:section-break'>
</span>

<div class=Section3>

<!--                       Section 3                                   -->


<table width="100%" border="0">
  <tr>
    <td>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#666666">
  <tr>
    <td height="16" colspan="2" bgcolor="#FFFFFF"><div align="center" class="style13 style1">PRESENSI
        HASIL BELAJAR</div></td>
    </tr>
  <tr>
    <td height="20"><span class="style5">Departemen</span></td>
    <td height="20"><span class="style5">:&nbsp;
        <?=$departemen?>
    </span></td>
  </tr>
  <tr>
    <td height="20"><span class="style5">Tahun Ajaran</span></td>
    <?
   
	
	?><td height="20"><span class="style5">:&nbsp;
        <?=$row_get_ta[tahunajaran]?>
    </span></td>
  </tr>
  <tr>
    <td width="6%" height="20"><span class="style5">NIS 
    </span></td>
    <td width="93%" height="20"><span class="style5">:&nbsp;
        <?=$nis?>
    </span></td>
  </tr>
  <tr>
    <td height="20"><span class="style5">Nama</span></td>
    <?
	
	
	?>
	<td height="20"><span class="style5">:&nbsp;
	    <?=$row_get_nama[nama]?>
	</span></td>
  </tr>
  <tr>
    <td height="20"><span class="style5">Kelas/Semester&nbsp;</span></td>
    
    <?
   
	?>
    <td height="20"><span class="style5">:&nbsp;
        <?=$row_get_kls[kelas]."/".$row_get_sem[semester]?>
    </span></td>
  </tr>
</table>
	</td>
  </tr>
  <tr>
    <td>

	<table width="100%" border="1" bordercolor="#FFFFFF" class="tab" id="table">
  <tr>
    <td width="27%" rowspan="2" bgcolor="#666666" ><div align="center" class="style17">Pelajaran</div></td>
    <td height="25" colspan="2" bgcolor="#666666" ><div align="center" class="style17">Hadir</div></td>
    <td height="25" colspan="2" bgcolor="#666666" ><div align="center" class="style17">Sakit</div></td>
    <td height="25" colspan="2" bgcolor="#666666" ><div align="center" class="style17">Ijin</div></td>
    <td height="25" colspan="2" bgcolor="#666666" ><div align="center" class="style17">Alpa</div></td>
    </tr>
  <tr>
    <td width="6" bgcolor="#666666" ><div align="center" class="style17">Jumlah</div></td>
    <td width="6" bgcolor="#666666" ><div align="center" class="style17">%</div></td>
    <td width="6" bgcolor="#666666" ><div align="center" class="style17">Jumlah</div></td>
    <td width="6" bgcolor="#666666" ><div align="center" class="style17">%</div></td>
    <td width="6" bgcolor="#666666" ><div align="center" class="style17">Jumlah</div></td>
    <td width="6" bgcolor="#666666" ><div align="center" class="style17">%</div></td>
    <td width="6" bgcolor="#666666" ><div align="center" class="style17">Jumlah</div></td>
    <td width="6" bgcolor="#666666" ><div align="center" class="style17">%</div></td>
  </tr>
  <!-- Ambil pelajaran per departemen-->
	<?
	$sql_get_pelajaran_presensi="SELECT * FROM jbsakad.pelajaran WHERE departemen='$departemen' ORDER BY nama ASC";
	$result_get_pelajaran_presensi=QueryDb($sql_get_pelajaran_presensi);
	$cntpel_presensi=1;
	
	while ($row_get_pelajaran_presensi=@mysql_fetch_array($result_get_pelajaran_presensi)){
	//ambil semua jumlah presensi per pelajaran 
	$sql_get_all_presensi="select count(*) as jumlah FROM jbsakad.presensipelajaran pel, jbsakad.ppsiswa pp ".
						  "WHERE pel.idpelajaran='$row_get_pelajaran_presensi[replid]' AND pel.idsemester='$semester' AND pel.idkelas='$kelas' ".
		                  "AND pel.replid=pp.idpp AND pp.nis='$nis'";
	$result_get_all_presensi=QueryDb($sql_get_all_presensi);
	$row_get_all_presensi=@mysql_fetch_array($result_get_all_presensi);
	//dapet nih jumlahnya
	$jumlah_presensi=$row_get_all_presensi[jumlah];

	//ambil yang hadir
	$sql_get_hadir="select count(*) as hadir FROM jbsakad.presensipelajaran pel, jbsakad.ppsiswa pp ".
						  "WHERE pel.idpelajaran='$row_get_pelajaran_presensi[replid]' AND pel.idsemester='$semester' AND pel.idkelas='$kelas' ".
		                  "AND pel.replid=pp.idpp AND pp.nis='$nis' AND pp.statushadir=0";
	$result_get_hadir=QueryDb($sql_get_hadir);
	$row_get_hadir=@mysql_fetch_array($result_get_hadir);
	$hadir=$row_get_hadir[hadir];

	//ambil yang sakit
	$sql_get_sakit="select count(*) as sakit FROM jbsakad.presensipelajaran pel, jbsakad.ppsiswa pp ".
						  "WHERE pel.idpelajaran='$row_get_pelajaran_presensi[replid]' AND pel.idsemester='$semester' AND pel.idkelas='$kelas' ".
		                  "AND pel.replid=pp.idpp AND pp.nis='$nis' AND pp.statushadir=1";
	$result_get_sakit=QueryDb($sql_get_sakit);
	$row_get_sakit=@mysql_fetch_array($result_get_sakit);
	$sakit=$row_get_sakit[sakit];

	//ambil yang ijin
	$sql_get_ijin="select count(*) as ijin FROM jbsakad.presensipelajaran pel, jbsakad.ppsiswa pp ".
						  "WHERE pel.idpelajaran='$row_get_pelajaran_presensi[replid]' AND pel.idsemester='$semester' AND pel.idkelas='$kelas' ".
		                  "AND pel.replid=pp.idpp AND pp.nis='$nis' AND pp.statushadir=2";
	$result_get_ijin=QueryDb($sql_get_ijin);
	$row_get_ijin=@mysql_fetch_array($result_get_ijin);
	$ijin=$row_get_ijin[ijin];

	//ambil yang alpa
	$sql_get_alpa="select count(*) as alpa FROM jbsakad.presensipelajaran pel, jbsakad.ppsiswa pp ".
						  "WHERE pel.idpelajaran='$row_get_pelajaran_presensi[replid]' AND pel.idsemester='$semester' AND pel.idkelas='$kelas' ".
		                  "AND pel.replid=pp.idpp AND pp.nis='$nis' AND pp.statushadir=3";
	$result_get_alpa=QueryDb($sql_get_alpa);
	$row_get_alpa=@mysql_fetch_array($result_get_alpa);
	$alpa=$row_get_alpa[alpa];

	//hitung prosentase kalo jumlahnya gak 0
	if ($jumlah_presensi<>0){
		$p_hadir=round(($hadir/$jumlah_presensi)*100);
		$p_sakit=round(($sakit/$jumlah_presensi)*100);
		$p_ijin=round(($ijin/$jumlah_presensi)*100);
		$p_alpa=round(($alpa/$jumlah_presensi)*100);
	} else {
		$p_hadir=0;
		$p_sakit=0;
		$p_ijin=0;
		$p_alpa=0;
	}
	?>
	<tr>
    <td height="25"><span class="style5"><?=$row_get_pelajaran_presensi[nama]?></span></td>
    <td height="25"><div align="center">
      <span class="style5"><?=$hadir?></span>
    </div></td>
    <td height="25"><div align="center">
      <span class="style5"><?=$p_hadir?>
      &nbsp;%</span></div></td>
    <td height="25"><div align="center">
      <span class="style5"><?=$sakit?></span>
    </div></td>
    <td height="25"><div align="center">
      <span class="style5"><?=$p_sakit?>
      &nbsp;%</span></div></td>
    <td height="25"><div align="center">
      <span class="style5"><?=$ijin?></span>
    </div></td>
    <td height="25"><div align="center">
      <span class="style5"><?=$p_ijin?>
      &nbsp;%</span></div></td>
    <td height="25"><div align="center">
      <span class="style5"><?=$alpa?></span>
    </div></td>
    <td height="25"><div align="center">
      <span class="style5"><?=$p_alpa?>
      &nbsp;%</span></div></td>
	 </tr>
	<?
	$cntpel_presensi++;
	}

	//sekarang hitung jumlah hadir semua pelajaran
	$sql_all_hadir="select count(*) as allhadir FROM jbsakad.presensipelajaran pel, jbsakad.ppsiswa pp ".
	               "WHERE pel.idsemester='22' AND pel.idkelas='$kelas' ". 
                   "AND pel.replid=pp.idpp AND pp.nis='$nis' AND pp.statushadir=0";
    $result_all_hadir=QueryDb($sql_all_hadir);
	$row_all_hadir=@mysql_fetch_array($result_all_hadir);
	$all_hadir=$row_all_hadir[allhadir];
	
	//sekarang hitung jumlah sakit semua pelajaran
	$sql_all_sakit="select count(*) as allsakit FROM jbsakad.presensipelajaran pel, jbsakad.ppsiswa pp ".
	               "WHERE pel.idsemester='22' AND pel.idkelas='$kelas' ". 
                   "AND pel.replid=pp.idpp AND pp.nis='$nis' AND pp.statushadir=1";
    $result_all_sakit=QueryDb($sql_all_sakit);
	$row_all_sakit=@mysql_fetch_array($result_all_sakit);
	$all_sakit=$row_all_sakit[allsakit];

	//sekarang hitung jumlah ijin semua pelajaran
	$sql_all_ijin="select count(*) as allijin FROM jbsakad.presensipelajaran pel, jbsakad.ppsiswa pp ".
	               "WHERE pel.idsemester='22' AND pel.idkelas='$kelas' ". 
                   "AND pel.replid=pp.idpp AND pp.nis='$nis' AND pp.statushadir=2";
    $result_all_ijin=QueryDb($sql_all_ijin);
	$row_all_ijin=@mysql_fetch_array($result_all_ijin);
	$all_ijin=$row_all_ijin[allijin];

	//sekarang hitung jumlah alpa semua pelajaran
	$sql_all_alpa="select count(*) as allalpa FROM jbsakad.presensipelajaran pel, jbsakad.ppsiswa pp ".
	               "WHERE pel.idsemester='22' AND pel.idkelas='$kelas' ". 
                   "AND pel.replid=pp.idpp AND pp.nis='$nis' AND pp.statushadir=3";
    $result_all_alpa=QueryDb($sql_all_alpa);
	$row_all_alpa=@mysql_fetch_array($result_all_alpa);
	$all_alpa=$row_all_alpa[allalpa];
	?>
  <tr>
    <td height="25" bgcolor="#CCCCCC"><div align="center" class="style20">Total</div></td>
    <td height="25" bgcolor="#CCCCCC"><div align="center" class="style21">
      <span class="style5"><?=$all_hadir?></span>
    </div></td>
    <td height="25" bgcolor="#FFFFFF"><div align="center"><span class="style22"></span></div></td>
    <td height="25" bgcolor="#CCCCCC"><div align="center" class="style22"><strong>
      <span class="style5"><?=$all_sakit?></span>
    </strong></div></td>
    <td height="25" bgcolor="#FFFFFF"><div align="center"><span class="style22"></span></div></td>
    <td height="25" bgcolor="#CCCCCC"><div align="center" class="style22"><strong>
      <span class="style5"><?=$all_ijin?></span>
    </strong></div></td>
    <td height="25" bgcolor="#FFFFFF"><div align="center"><span class="style22"></span></div></td>
    <td height="25" bgcolor="#CCCCCC"><div align="center" class="style22"><strong>
      <span class="style5"><?=$all_alpa?></span>
    </strong></div></td>
    <td height="25" bgcolor="#FFFFFF"><div align="center"><span class="style22"></span></div></td>
  </tr>
</table>
	
	</td>
  </tr>
  <tr>
    <td>
	 <table width="100%" border="0">
  <tr>
    <td rowspan="2" width="33%"><div align="center">Orang Tua/Wali Siswa</div></td>
    <td width="33%"><div align="center">Mengetahui,</div></td>
    <td rowspan="2" width="33%"><div align="center">Wali Kelas</div></td>
  </tr>
  <tr>
    <td width="33%"><div align="center">Kepala Sekolah 
      <?=$departemen?>
    </div></td>
  </tr>
  <tr>
    <td width="33%" height="50"><div align="center"></div></td>
    <td width="33%" height="50"><div align="center"></div></td>
    <td width="33%" height="50"><div align="center"></div></td>
  </tr>
  <tr>
    <td width="33%" rowspan="2"><div align="center">(.............................................)</div></td>
    <td width="33%"><div align="center">
      <u><?=$row_get_kepsek[namakepsek]?></u>
    </div></td>
    <td width="33%"><div align="center">
      <u><?=$row_get_w_kls[namawalikelas]?></u>
    </div></td>
  </tr>
  <tr>
    <td><div align="center">
      NIP : <?=$row_get_kepsek[nipkepsek]?>
    </div></td>
    <td width="33%"><div align="center">
      NIP : <?=$row_get_w_kls[nipwalikelas]?>
    </div></td>
  </tr>
</table>
	</td>
  </tr>
</table>

</div>

</body>

</html>