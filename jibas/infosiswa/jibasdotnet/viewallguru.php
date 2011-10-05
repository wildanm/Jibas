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
$vartotal=20;
$varbaris=5;
$page=0;
if (isset($_REQUEST['page']))
	$page = $_REQUEST['page'];
if ($page>0){
	$pg=(int)$page*(int)$vartotal;
} else {
	$pg=(int)$page;
}
//Buat ngecek jumlah data aja......
$rs=QueryDb("SELECT * FROM jbsvcr.profil WHERE nip='".SI_USER_ID()."'");
//echo "SELECT * FROM jbsvcr.profil WHERE nip='".SI_USER_ID()."'";
$rw=@mysql_fetch_array($rs);
$repguru=$rw[replid];

//echo $repguru;
$r1=QueryDb("SELECT * FROM jbsvcr.profil WHERE nip<>'' AND nip<>'".SI_USER_ID()."' ORDER BY replid ");
$totalpage=ceil(@mysql_num_rows($r1)/(int)$vartotal);// Buah dapetin total halamannya
//

$op="";
if (isset($_REQUEST[op]))
	$op=trim($_REQUEST[op]);

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
.style5 {
	color: #990000;
	font-weight: bold;
}
.style6 {
	color: #0000CC;
	font-style: italic;
}
.style7 {
	color: #000000;
	font-weight: bold;
}
.style8 {
	color: #006600;
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
<script language="JavaScript" src="../script/resizing_background.js"></script>
<script language="javascript" type="text/javascript" src="../script/tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
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
	document.location.href="viewallguru.php?page="+page;
}
function change_page(page) {
	document.location.href="viewallguru.php?page="+page;
}
</script>
</head>
<body style="background-attachment:fixed;"  background="../library/gambarlatar.php?replid=<?=$repguru?>&table=jbsvcr.profil"  onLoad="rbInit();"  onResize="rbResize()" bgcolor="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<script>
// "true" means "keep the proportions of the original image."
// If you pass "false" the image fills the whole window,
// even if it must be distorted to do so. Experiment.
rbOpen(true);
</script>
<form action="profile.php" method="GET">
<!-- ImageReady Slices (back_login.psd) -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20" colspan="3" >&nbsp;</td>
  </tr>
  <tr>
    <td height="20" colspan="3" >&nbsp;&nbsp;<input name="ubah" type="button" class="but" style="width:100px;" value="My Profile" onClick="document.location.href='profile.php'"><!--&nbsp;<input name="tema" type="button" class="header" style="width:100px;" value="Tema Profil">&nbsp;<input name="ngobrol" type="button" class="header" style="width:100px;" value="Ajak Ngobrol">&nbsp;<input name="pesan" type="button" class="header" style="width:100px;" value="Kirim Pesan">--></td>
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
			<td>
            <div align="right"><span class="style8">Daftar Guru</span> 
            </div>
            <table width="100%" height="400" border="0">
			<tr><td height="100" valign="top">
			<table width="100%" border="0" cellspacing="10" cellpadding="10" >
			<?
				$xx=20;
				$s = "SELECT * FROM jbsvcr.profil WHERE nip<>'' AND nip<>'".SI_USER_ID()."' LIMIT ".(int)$page*(int)$xx.",".(int)$xx;
				$rs2 = QueryDb($s);	
				$x=0;
				while ($rw=@mysql_fetch_array($rs2)){
					if ($x==0){
						echo "<tr height='120'>";
					} else {
						if ($x%5==0){
							echo "<tr height='120'>";
						}
					}
					$panggilan="";
					$rs3 = QueryDb("SELECT panggilan FROM jbssdm.pegawai WHERE nip='$rw[nip]'");
					$rw3=@mysql_fetch_array($rs3);
					$panggilan=$rw3[panggilan];
					echo "<td width='20%' valign='top' ><img title='".$rw[nama]."' style='cursor:pointer;' onclick=\"document.location.href='view_profil_guru.php?replid=".$rw[replid]."'\" src='../library/gambar.php?replid=$rw[replid]&table=jbsvcr.profil' width='75' align='left'>".
						 "<span class='style5'>".$panggilan."</span><br>".
						 "<span class='style7'><a style='text-decoration:none;' href='view_profil_guru.php?replid=".$rw[replid]."'>Lihat</a></span><br>".
						 "<span class='style6'><u>Kirim Pesan</u></span>".
						 "</td>";
					if ($x+1%5==0){
						echo "</tr>";
					}
				$x++;
				}
			?>  
			</table>
						

            </td>
          </tr>
         </table><?
						if ($totalpage!=0){
							if ($page==0){ 
							$disback="style='visibility:hidden;position:absolute;'";
							$disnext="style='visibility:visible;position:inherit;'";
							}
							if ($page<$totalpage && $page>0){
							$disback="style='visibility:visible;position:inherit;'";
							$disnext="style='visibility:visible;position:inherit;'";
							}
							if ($page==$totalpage-1 && $page>0){
							$disback="style='visibility:visible;position:inherit;'";
							$disnext="style='visibility:hidden;position:absolute;'";
							}
							if ($page==$totalpage-1 && $page==0){
							$disback="style='visibility:hidden;position:absolute;'";
							$disnext="style='visibility:hidden;position:absolute;'";
							}
						
						?>
						<div align="center">
						<input <?=$disback?> type="button" class="but" title="Kembali ke halaman sebelumnya" name="back" value="<" onClick="change_page('<?=(int)$page-1?>')" onMouseOver="showhint('Sebelumnya', this, event, '75px')">
						<?
						for ($hal=1;$hal<=$totalpage;$hal++){
							?>
							
							<?	$f="<font color='#8f8f8f'>";
								$r="</font>";
								if ($page==(int)$hal-1){
									$f="<font color='#ff0000'>";
									$r="</font>";
								}	
						?>
						<a style="text-decoration:none;" href="viewallguru.php?page=<?=(int)$hal-1?>"><?=$f.$hal.$r?></a>
						<?
						}
						?>
						<input <?=$disnext?> type="button" class="but" name="next" title="Lanjut ke halaman berikutnya" value=">" onClick="change_page('<?=(int)$page+1?>')" onMouseOver="showhint('Berikutnya', this, event, '75px')">
						<? } ?>
						</div>
		 </td></tr>
		 </table>
    </td>
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
	//rbClose("../library/gambarlatar.php?replid=<?=$repguru?>&table=jbsvcr.profil");
</script>
</body>
</html>