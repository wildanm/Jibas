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
require_once('../include/common.php');
require_once('../include/sessioninfo.php');
require_once('../include/config.php');
require_once('../include/getheader.php');
require_once('../include/db_functions.php');

OpenDb();
$replid=$_GET['replid'];
//echo $replid;
$rpg=QueryDb("SELECT * FROM jbsvcr.profil WHERE replid=".$replid);
$rowrpg=@mysql_fetch_array($rpg);
$idsiswa=$rowrpg[nis];

$bariskomentar=3;
$barisfoto=4;
$bariskarya=4;
$page=0;
if (isset($_REQUEST['page']))
	$page = $_REQUEST['page'];

//Buat ngecek jumlah data aja......
$r1=QueryDb("SELECT * FROM jbsvcr.profil WHERE nip<>'' ");
$jumguru=@mysql_num_rows($r1);
$r2=QueryDb("SELECT * FROM jbsvcr.profil WHERE nis<>'' AND nis<>'".$idsiswa."'");
$jumsiswa=@mysql_num_rows($r2);
$r3=QueryDb("SELECT * FROM jbsvcr.galerifoto WHERE nis='".$idsiswa."'");
$jumfoto=@mysql_num_rows($r3);
$halfoto = ceil(@mysql_num_rows($r3)/(int)$barisfoto);
$r4=QueryDb("SELECT * FROM jbsvcr.komentar WHERE owner='".$idsiswa."'");
$jumkomentar=@mysql_num_rows($r4);
$totalkom = ceil(@mysql_num_rows($r4)/(int)$bariskomentar);
$r5=QueryDb("SELECT * FROM jbsvcr.buletin WHERE idpengirim='".$idsiswa."'");
$jumkarya=@mysql_num_rows($r5);
$halkarya = ceil(@mysql_num_rows($r5)/(int)$bariskarya);
//
$res_prof=QueryDb("SELECT * FROM jbsvcr.profil WHERE nis='".$idsiswa."'");
$row_prof=@mysql_fetch_array($res_prof);

$res_peg=QueryDb("SELECT * FROM jbsakad.siswa WHERE nis='".$idsiswa."'");
$row_peg=@mysql_fetch_array($res_peg);

$res_fot=QueryDb("SELECT * FROM jbsvcr.galerifoto WHERE nis='".$idsiswa."' ORDER BY replid DESC LIMIT 0,4");

$res_kar=QueryDb("SELECT * FROM jbsvcr.buletin WHERE idpengirim='".$idsiswa."' ORDER BY replid DESC LIMIT 0,".$bariskarya);

$res_guru=QueryDb("SELECT * FROM jbsvcr.profil WHERE nip<>'' ORDER BY replid DESC LIMIT 0,3");

$res_siswa=QueryDb("SELECT * FROM jbsvcr.profil WHERE nis<>'' AND nis<>'".$idsiswa."' ORDER BY replid DESC LIMIT 0,3");

$res_kom=QueryDb("SELECT DATE_FORMAT(tanggal, '%Y-%m-%d') as tanggal,DATE_FORMAT(tanggal, '%H:%i:%s') as jam, komentar, nip, replid FROM jbsvcr.komentar WHERE owner='".$idsiswa."' ORDER BY replid DESC LIMIT ".(int)$page*(int)$bariskomentar.",".$bariskomentar);

$op="";
if (isset($_REQUEST[op]))
	$op=trim($_REQUEST[op]);
if ($op=="komensimpan"){
	QueryDb("INSERT INTO jbsvcr.komentar SET owner='".$idsiswa."', nip='$_REQUEST[sender]', komentar='$_REQUEST[komentar]', tanggal=now()");
	reloadpage("view_profil_siswa.php?replid=$_REQUEST[replid]");
}
if ($op=="hapuskomentar"){
	QueryDb("DELETE FROM jbsvcr.komentar WHERE replid=$_REQUEST[replid]");
	reloadpage("profile.php");
}
function reloadpage($dest){
	?>
	<script language="javascript" type="text/javascript">
		document.location.href="<?=$dest?>";
	</script>
	<?
}
?>
<html>
<head>
<title>Profil Guru</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {
	font-size: 20px;
	color: #990000;
	font-weight: bold;
	font-family: Calibri;
}
.style4 {color: #990000}
.style5 {
	color: #0033FF;
	font-size: 14px;
	font-weight: bold;
}
.style6 {color: #990000; font-size: 12px; }
.style7 {
	color: #666666;
	font-style: italic;
}
-->
</style>
<script type="text/javascript" language="javascript" src="../style/lytebox.js"></script>
<link rel="stylesheet" href="../style/lytebox.css" type="text/css" media="screen" />
<script language="JavaScript" src="../script/resizing_background.js"></script>
<script language="javascript" type="text/javascript" src="../script/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript" src="../script/tools.js"></script>
<script language="javascript" type="text/javascript">
tinyMCE.init({
		mode : "textareas",
		theme : "simple",
		skin : "o2k7",
		skin_variant : "silver",
		plugins : "safari,pagebreak,style,layer,table,save,advhr,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",		
		theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,formatselect,fontselect,fontsizeselect,forecolor,backcolor,fullscreen,print",
		theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,bullist,numlist,|,image",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_statusbar_location : "bottom",
		theme_advanced_resizing : false,
		content_css : "style/content.css"
	});
function chg_page(){
	var page=document.getElementById("page").value;
	document.location.href="profile.php?page="+page;
}
function change_page(page) {
	document.location.href="profile.php?page="+page;
}
function ubah_profil() {
	newWindow('profile_edit.php', 'EditProfilGuru','500','210','resizable=1,scrollbars=0,status=0,toolbar=0');
}
function lihat_gambar(addr) {
	newWindow(addr, 'LihatGambar','320','240','resizable=1,scrollbars=0,status=0,toolbar=0');
}
function showkarya(replid){
	document.location.href="baca_buletin2.php?replid="+replid;
}
</script>
</head>
<body style="background-attachment:fixed;"  background="../library/gambarlatar.php?replid=<?=$replid?>&table=jbsvcr.profil"  onLoad="rbInit();"  onResize="rbResize()" bgcolor="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<script>
// "true" means "keep the proportions of the original image."
// If you pass "false" the image fills the whole window,
// even if it must be distorted to do so. Experiment.
//rbOpen(true);
</script>
<form action="view_profil_siswa.php" method="GET">

<!-- ImageReady Slices (back_login.psd) -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20" colspan="3" >&nbsp;</td>
  </tr>
  <tr>
    <td height="20" colspan="3" >&nbsp;&nbsp;<input name="ubah" type="button" class="but" style="width:100px;" value="My Profile" onClick="document.location.href='profile.php';"><!--&nbsp;<input name="tema" type="button" class="header" style="width:100px;" value="Tema Profil">&nbsp;<input name="ngobrol" type="button" class="header" style="width:100px;" value="Ajak Ngobrol">&nbsp;<input name="pesan" type="button" class="header" style="width:100px;" value="Kirim Pesan">--></td>
  </tr>
  <tr>
    <td width="19" height="20" style="background-image:url(../images_slice/bg_profil80_01.png); background-repeat:no-repeat; background-position:right;">&nbsp;</td>
    <td height="20" style="background-image:url(../images_slice/bg_profil80_02.png); background-repeat:repeat-x;"></td>
    <td width="19" height="20" style="background-image:url(../images_slice/bg_profil80_04.png); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
  <tr>
    <td width="19" style="background-image:url(../images_slice/bg_profil80_07.png); background-repeat:repeat-y; background-position:right;">&nbsp;</td>
    <td style="background-image:url(../images_slice/bg_profil80_08.png); background-repeat:repeat;" valign="top">
        <table width="100%" border="0" cellspacing="0">
          <tr>
            <td width="35%" valign="top">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="25" colspan="3">&nbsp;&nbsp;&nbsp;
                      <div align="center"><span class="style2">NIS 
                      <?=$idsiswa?>
                      </span>
                        
                    </div><br></td>
                  </tr>
                  <tr>
                    <td width="33%" height="20" valign="top" style="border-bottom-style:none;"><strong>Nama</strong> </td>
                    <td width="1%" valign="top" style="border-bottom-style:none;"><strong>:&nbsp;</strong></td>
                    <td width="66%" height="20" valign="top" style="border-bottom-style:none;"><?=$row_prof[nama]?></td>
                  </tr>
                  <tr>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>Alamat</strong> </td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>:&nbsp;</strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><?=$row_prof[alamat]?></td>
                  </tr>
                  <tr>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>Telepon</strong> </td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>:&nbsp;</strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><?=$row_prof[telpon]?></td>
                  </tr>
                  <tr>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>HP</strong> </td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>:&nbsp;</strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><?=$row_prof[hp]?></td>
                  </tr>
                  <tr>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>E-mail  </strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>:&nbsp;</strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><?=$row_prof[email]?></td>
                  </tr>
                  <tr>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>Hobby  </strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>:&nbsp;</strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><?=$row_prof[hobi]?></td>
                  </tr>
                  <tr>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>Buku&nbsp;Favorit </strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>:&nbsp;</strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><?=$row_prof[buku]?></td>
                  </tr>
                  <tr>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>Riwayat&nbsp;Hidup</strong> </td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><strong>:&nbsp;</strong></td>
                    <td height="20" valign="top" style="border-bottom-style:none;"><?=$row_prof[riwayat]?></td>
                  </tr>
                  <tr>
                    <td colspan="3">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="3" bgcolor="#999999" class="headerlong">.: [Daftar Kolega] :.</td>
                  </tr>
                  <tr>
                    <td height="25" valign="top"><strong>Guru </strong></td>
                    <td height="25" valign="top">&nbsp;</td>
                    <td height="25" align="right" valign="top">&nbsp;<a href="#" onClick="document.location.href='viewallguru.php'"><em>View All <span class="style4">(<?=$jumguru?>)</span> ...</em></a></td>
                  </tr>
                  <tr>
                    <td colspan="3">
                        <table width="100%" border="0" cellspacing="0">
                          <tr>
                            <?
							while ($row_gr = @mysql_fetch_array($res_guru)){
								$res_pg = QueryDb("SELECT panggilan FROM jbssdm.pegawai WHERE nip='$row_gr[nip]'");
								$row_pg = @mysql_fetch_array($res_pg);
							?>
							<td align="center"><img src="../library/gambar.php?replid=<?=$row_gr[replid]?>&table=jbsvcr.profil" width="50" style="cursor:pointer;" onClick="document.location.href='view_profil_guru.php?replid=<?=$row_gr[replid]?>';"><br><?=$row_pg[panggilan]?></td>
                            <?
							}
							?>
                          </tr>
                        </table>                    </td>
                  </tr>
                  <tr>
                    <td height="25" valign="top"><div align="left"><strong>Siswa </strong></div></td>
                    <td height="25" valign="top">&nbsp;</td>
                    <td height="25" align="right" valign="top">&nbsp;<a href="#" onClick="document.location.href='viewallsiswa.php'"><em>View All <span class="style4">(<?=$jumsiswa?>)</span> ...</em></a></td>
                  </tr>
                  <tr>
                    <td colspan="3">
                    	<table width="100%" border="0" cellspacing="0">
                          <tr>
                            <?
							while ($row_s = @mysql_fetch_array($res_siswa)){
								$res_pgs = QueryDb("SELECT panggilan FROM jbsakad.siswa WHERE nis='$row_s[nis]'");
								$row_pgs = @mysql_fetch_array($res_pgs);
							?>
							<td align="center"><img style="cursor:pointer;" onClick="document.location.href='view_profil_siswa.php?replid=<?=$row_s[replid]?>';" src="../library/gambar.php?replid=<?=$row_s[replid]?>&table=jbsvcr.profil" width="50"><br><?=$row_pgs[panggilan]?></td>
                            <?
							}
							?>
                          </tr>
                        </table>                    </td>
                  </tr>
                  <tr>
                    <td colspan="3">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="3" bgcolor="#999999" class="headerlong">.: [Komentar] :.</td>
                  </tr>
                  <tr>
                    <td colspan="3">
						<div align="right">
						  <? if ($op=="komen"){ ?>
						  <input type="submit" class="but" value="Kirim Komentar">
						  <input name="replid" type="hidden" value="<?=$replid?>">
						  
						  <? } else { ?>
						  <input onClick="document.location.href='view_profil_siswa.php?op=komen&replid=<?=$replid?>'" name="komentar" type="button" class="but" value="Tulis Komentar">
						  <? } ?>					
					  </div></td>
                  </tr>
                  <tr>
                    <td colspan="3">
                    		<table width="100%" border="0" cellspacing="0">
                              <? if ($op=="komen"){ ?>
							  <input type="hidden" name="op" value="komensimpan">
							  <tr>
                                <td width="16%" valign="top">Nama</td>
                                <td width="84%" valign="top"><input type="hidden" name="sender" value="<?=SI_USER_ID()?>"><?=SI_USER_NICKNAME()?></td>
                              </tr>
							  <tr>
							    <td valign="top">Komentar</td>
							    <td valign="top"><textarea name="komentar" id="komentar"></textarea></td>
						      </tr>
							  <? } else { 
							  while ($row_kom=@mysql_fetch_array($res_kom)) {
							  $res_ft_sender = QueryDb("SELECT * FROM jbsvcr.profil WHERE nis='$row_kom[nip]'");
							  $row_ft_sender = @mysql_fetch_array($res_ft_sender);
							  $res_n = QueryDb("SELECT panggilan FROM jbsakad.siswa WHERE nis='$row_kom[nip]'");
							  $row_n = @mysql_fetch_array($res_n);
							  ?>
							  <tr>
                                <td width="16%" valign="middle"><div align="center"><img src="../library/gambar.php?replid=<?=$row_ft_sender[replid]?>&table=jbsvcr.profil" width="50"><br>
                                <?=$row_n[panggilan]?></div></td>
                                <td width="84%" valign="top"><span class="style7">
                                <?=ShortDateFormat($row_kom[tanggal])?> 
                                <?=$row_kom[jam]?>
                                </span><br>
                                <?=$row_kom[komentar]?>
                                <div align="right"></div>                                </td>
                              </tr>
							  <tr>
							    <td valign="top" colspan="2">&nbsp;</td>
						      </tr>
							  <? } } ?>
                    </table>                    </td>
                  </tr>
                  <tr>
                    <td><em>Ada&nbsp;<?=$jumkomentar?>&nbsp;komentar...</em></td>
                    <td>&nbsp;</td>
                    <td align="right"><?
						if ($totalkom!=0){
							if ($page==0){ 
							$disback="style='visibility:hidden;position:absolute;'";
							$disnext="style='visibility:visible;position:inherit;'";
							}
							if ($page<$totalkom && $page>0){
							$disback="style='visibility:visible;position:inherit;'";
							$disnext="style='visibility:visible;position:inherit;'";
							}
							if ($page==$totalkom-1 && $page>0){
							$disback="style='visibility:visible;position:inherit;'";
							$disnext="style='visibility:hidden;position:absolute;'";
							}
							if ($page==$totalkom-1 && $page==0){
							$disback="style='visibility:hidden;position:absolute;'";
							$disnext="style='visibility:hidden;position:absolute;'";
							}
						
						?>
						Page : 
						<input <?=$disback?> type="button" class="but" title="Sebelumnya" name="back" value="<" onClick="change_page('<?=(int)$page-1?>')" onMouseOver="showhint('Sebelumnya', this, event, '75px')">
						<?=$page+1?>
						<input <?=$disnext?> type="button" class="but" name="next" title="Selanjutnya" value=">" onClick="change_page('<?=(int)$page+1?>')" onMouseOver="showhint('Berikutnya', this, event, '75px')">
						<? } ?>					</td>
                  </tr>
                </table>            </td>
			<td width="20">&nbsp;</td>
            <td valign="top"><table width="100%" border="0" cellspacing="0">
              <tr>
                <td width="87"><div align="left" class="style6">
                  <?=$row_peg[panggilan]?>
                </div></td>
                <td colspan="3"><span class="style6"> <span class="style5">Tentang saya...</span></span></td>
              </tr>
              <tr>
                <td colspan="4"><img src="../library/gambar.php?replid=<?=$row_prof[replid]?>&table=jbsvcr.profil" width="20%" align="left">
                    <?=$row_prof[tentang]?></td>
              </tr>
              <tr>
                <td colspan="4" bgcolor="#999999" class="headerlong">.: [Galeri] :.</td>
              </tr>
              <tr>
                <td height="25" valign="top"><strong>Fotoku </strong></td>
                <td height="25" valign="top">&nbsp;</td>
                <td height="25" valign="top">&nbsp;</td>
                <td height="25" align="right" valign="top">&nbsp;<a href="#" onClick="document.location.href='view_profil_siswa.php?op=viewallphoto&replid=<?=$replid?>'"><em>View All <span class="style4">(<?=$jumfoto?>)</span> ...</em></a></td>
              </tr>
              <? 
				   if ($op=="viewallphoto"){
					 for ($i=0;$i<=$halfoto;$i++){ ?>
			  <tr><?		
					$res_foto=QueryDb("SELECT * FROM jbsvcr.galerifoto WHERE nis='$idsiswa' ORDER BY replid DESC LIMIT ".(int)$i*(int)$barisfoto.",".$barisfoto);
						while ($row_foto=@mysql_fetch_array($res_foto)){
					?>
                <td width="25%"><!--div align="center"><a href="../library/gambar.php?replid=<?=$row_foto[replid]?>&table=jbsvcr.galerifoto" rel="lytebox[vacation]"  >
				<!--onClick="lihat_gambar('../library/gambar.php?replid=<?=$row_foto[replid]?>&table=jbsvcr.galerifoto')"--><!--img src="../library/gambar.php?replid=<?=$row_foto[replid]?>&table=jbsvcr.galerifoto" width="80" style="cursor:pointer;"><br>
                      <?=$row_foto[keterangan]?></a>
                </div-->
                <div align="center"> <a title="<?=$row_foto[keterangan]?>" href="<?=$WEB_GALLERY_DIR?>photos/<?=$row_foto[filename]?>" rel="lytebox[vacation]"  >
                <!--onClick="lihat_gambar('../library/gambar.php?replid=<?=$row_foto[replid]?>&table=jbsvcr.galerifoto')"-->
                <img src="<?=$WEB_GALLERY_DIR?>thumbnail/<?=$row_foto[filename]?>" width="80" height="80" style="cursor:pointer;"><br>
                <?=$row_foto[keterangan]?>
            </a> </div>
                </td>
                <? } ?>
              </tr>
			  <? } } else {?>
              <tr>
			  <?
				while ($row_fot=@mysql_fetch_array($res_fot)){
					?>
                <td width="25%"><!--div align="center"><a href="../library/gambar.php?replid=<?=$row_fot[replid]?>&table=jbsvcr.galerifoto" rel="lytebox[vacation]"  ><img   src="../library/gambar.php?replid=<?=$row_fot[replid]?>&table=jbsvcr.galerifoto" width="80" style="cursor:pointer;"><br>
                      <?=$row_fot[keterangan]?></a>
                </div-->
                <div align="center"> <a title="<?=$row_fot[keterangan]?>" href="<?=$WEB_GALLERY_DIR?>photos/<?=$row_fot[filename]?>" rel="lytebox[vacation]"  >
                <!--onClick="lihat_gambar('../library/gambar.php?replid=<?=$row_fot[replid]?>&table=jbsvcr.galerifoto')"-->
                <img src="<?=$WEB_GALLERY_DIR?>thumbnail/<?=$row_fot[filename]?>" width="80" height="80" style="cursor:pointer;"><br>
                <?=$row_fot[keterangan]?>
            </a> </div></td>
                <? } ?>
			  </tr>
			  <? } ?>
              <tr>
                <td width="25%" height="25" valign="top"><strong>Karyaku </strong></td>
                <td width="25%" height="25" valign="top">&nbsp;</td>
                <td width="25%" height="25" valign="top">&nbsp;</td>
                <td height="25" align="right" valign="top">&nbsp;<a href="#" onClick="document.location.href='view_profil_siswa.php?replid=<?=$replid?>&opkarya=viewallkarya'"><em>View All <span class="style4">(<?=$jumkarya?>)</span> ...</em></a></td>
              </tr>
              <? 
			 if ($opkarya=="viewallkarya"){
					 for ($i=0;$i<=$halkarya;$i++){ ?>
			  <tr><?		
					$res_karya=QueryDb("SELECT * FROM jbsvcr.buletin WHERE idpengirim='$idsiswa' ORDER BY tanggalinput DESC LIMIT ".(int)$i*(int)$bariskarya.",".$bariskarya);
						while ($row_karya=@mysql_fetch_array($res_karya)){
					?>
                <td width="25%" onClick="showkarya('<?=$row_karya[replid]?>')" style="cursor:pointer;">
                <em><font color="#006666" size="1" face="Verdana, Arial, Helvetica, sans-serif"><?=$row_karya['tempatbuletin']?>, <?=LongDateFormat($row_karya['tanggalbuletin'])?></font></em><br />
      <em><a style="text-decoration:none; text-shadow:#00FF00;" href="#" onClick="bacabuletin('<?=$row_karya[replid]?>')" ><font color="#0000FF"><?=substr($row_karya['judul'],0,25)?></font></a></em><br /><br />
      <font size="2" face="Arial">
	  <?=removetag($row_karya['buletin'],200)."..."?>
	  <?//=$row['buletin']?>
	  </font><br /><br />
                </td>
                <? } ?>
              </tr>
			  <? } } else {?>
              <tr>
			  <?
				while ($row_kar=@mysql_fetch_array($res_kar)){
					?>
                <td width="25%" onClick="showkarya('<?=$row_kar[replid]?>')" style="cursor:pointer;">
                <em><font color="#006666" size="1" face="Verdana, Arial, Helvetica, sans-serif"><?=$row_kar['tempatbuletin']?>, <?=LongDateFormat($row_kar['tanggalbuletin'])?></font></em><br />
      <em><a style="text-decoration:none; text-shadow:#00FF00;" href="#" onClick="bacabuletin('<?=$row_kar[replid]?>')" ><font color="#0000FF"><?=substr($row_kar['judul'],0,25)?></font></a></em><br /><br />
      <font size="2" face="Arial">
	  <?=removetag($row_kar['buletin'],200)."..."?>
	  <?//=$row['buletin']?>
	  </font><br /><br />
                </td>
                <? } ?>
			  </tr>
			  <? } ?>
            </table></td>
          </tr>
         </table>    </td>
    <td width="19" style="background-image:url(../images_slice/bg_profil80_09.png); background-repeat:repeat-y;">&nbsp;</td>
  </tr>
  <tr>
    <td width="19" height="23" style="background-image:url(../images_slice/bg_profil80_10.png); background-repeat:no-repeat; background-position:right;">&nbsp;</td>
    <td height="23" style="background-image:url(../images_slice/bg_profil80_11.png); background-repeat:repeat-x;">&nbsp;</td>
    <td width="19" height="23" style="background-image:url(../images_slice/bg_profil80_12.png); background-repeat:no-repeat;">&nbsp;</td>
  </tr>
</table>
<!-- End ImageReady Slices -->
</form>
<script>
	//rbClose("../library/gambarlatar.php?replid=<?=$replid?>&table=jbsvcr.profil");
</script>
</body>
</html>