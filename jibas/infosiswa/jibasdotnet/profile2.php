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
 require_once('../include/common.php');
 require_once('../include/sessioninfo.php');
 require_once('../include/config.php');
require_once('../include/getheader.php');
 require_once('../include/db_functions.php');
 $op="";
if (isset($_REQUEST[op]))
	$op=trim($_REQUEST[op]);
$opfoto="";
if (isset($_REQUEST[opfoto]))
	$opfoto=trim($_REQUEST[opfoto]);
$opkarya="";
if (isset($_REQUEST[opkarya]))
	$opkarya=trim($_REQUEST[opkarya]);
OpenDb();
$bariskomentar=2;
$barisfoto=4;
$bariskarya=4;
$page=0;
if (isset($_REQUEST['page']))
	$page = $_REQUEST['page'];

//Buat ngecek jumlah data aja......
$r1=QueryDb("SELECT * FROM jbsvcr.profil WHERE nip<>'' AND nip<>'".SI_USER_ID()."'");
$jumguru=@mysql_num_rows($r1);
$r2=QueryDb("SELECT * FROM jbsvcr.profil WHERE nis<>''");
$jumsiswa=@mysql_num_rows($r2);
$r3=QueryDb("SELECT * FROM jbsvcr.galerifoto WHERE nis='".SI_USER_ID()."'");
$jumfoto=@mysql_num_rows($r3);
$halfoto = ceil(@mysql_num_rows($r3)/(int)$barisfoto);
$r4=QueryDb("SELECT * FROM jbsvcr.komentar WHERE owner='".SI_USER_ID()."'");
$jumkomentar=@mysql_num_rows($r4);
$totalkom = ceil(@mysql_num_rows($r4)/(int)$bariskomentar);
$r5=QueryDb("SELECT * FROM jbsvcr.buletin WHERE idpengirim='".SI_USER_ID()."'");
$jumkarya=@mysql_num_rows($r5);
$halkarya = ceil(@mysql_num_rows($r5)/(int)$bariskarya);
//
$res_Biodata=QueryDb("SELECT * FROM jbsvcr.profil WHERE nis='".SI_USER_ID()."'");
$row_Biodata=@mysql_fetch_array($res_Biodata);

$res_peg=QueryDb("SELECT * FROM jbsakad.siswa WHERE nis='".SI_USER_ID()."'");
$row_peg=@mysql_fetch_array($res_peg);

//if ($op=="viewallphotos"){
//	$res_fot=QueryDb("SELECT * FROM jbsvcr.galerifoto WHERE idguru='".SI_USER_ID()."' ORDER BY replid DESC ");
//} else { 
$res_fot=QueryDb("SELECT * FROM jbsvcr.galerifoto WHERE nis='".SI_USER_ID()."' ORDER BY replid DESC LIMIT 0,".$barisfoto);

$res_kar=QueryDb("SELECT * FROM jbsvcr.buletin WHERE idpengirim='".SI_USER_ID()."' ORDER BY replid DESC LIMIT 0,".$bariskarya);
//}
$res_guru=QueryDb("SELECT * FROM jbsvcr.profil WHERE nip<>'".SI_USER_ID()."' AND nip<>'' ORDER BY replid DESC LIMIT 0,3");

$res_siswa=QueryDb("SELECT * FROM jbsvcr.profil WHERE nis<>'' ORDER BY replid DESC LIMIT 0,3");

$res_kom=QueryDb("SELECT DATE_FORMAT(tanggal, '%Y-%m-%d') as tanggal,DATE_FORMAT(tanggal, '%H:%i:%s') as jam, komentar, nip, replid FROM jbsvcr.komentar WHERE owner='".SI_USER_ID()."' ORDER BY replid DESC LIMIT ".(int)$page*(int)$bariskomentar.",".$bariskomentar);


if ($op=="komensimpan"){
	QueryDb("INSERT INTO jbsvcr.komentar SET owner='".SI_USER_ID()."', nip='$_REQUEST[sender]', komentar='$_REQUEST[komentar]', tanggal=now()");
	reloadpage("profile2.php");
}
if ($op=="hapuskomentar"){
	QueryDb("DELETE FROM jbsvcr.komentar WHERE replid='$_REQUEST[replid]'");
	reloadpage("profile2.php");
}
if ($op=="z3x53ccs6bbd763h8evye73"){
	QueryDb("DELETE FROM jbsvcr.buletin WHERE replid='$_REQUEST[replid]'");
	reloadpage("profile2.php?opkarya=$_REQUEST[opkarya]");
}
function reloadpage($dest){
	?>
	<script language="javascript" type="text/javascript">
		document.location.href="<?=$dest?>";
	</script>
	<?
//CloseDb();
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link rel="stylesheet" href="style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../style/lightbox.css" type="text/css" media="screen" />
<script type="text/javascript" language="javascript" src="../style/lytebox.js"></script>
<link rel="stylesheet" href="../style/lytebox.css" type="text/css" media="screen" />
<script language="JavaScript" src="../script/resizing_background.js"></script>
<style type="text/css">
<!--
.style1 {
	font-size: 18px;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}
.style6 {font-size: 14px; font-weight: bold; }
.style7 {font-size: 14px; font-weight: bold; font-style: italic; }
.style8 {
	font-size: 24px;
	font-weight: bold;
	font-style: italic;
	font-family: monospace, cursive, "Arial Black", "Bookman Old Style";
}
-->
</style>
<script language="javascript" type="text/javascript">
function del_karya(replid,opkarya){
	if (confirm('Anda yakin akan menghapus karya ini?replid='+replid+' opkarya='+opkarya))
	document.location.href="profile2.php?op=z3x53ccs6bbd763h8evye73&replid="+replid+"&opkarya="+opkarya;
}

function showkarya(replid){
	document.location.href="baca_buletin2.php?replid="+replid;
}
</script>
</head>

<body style="background-attachment:fixed;"  background="../library/gambarlatar.php?replid=<?=$row_Biodata[replid]?>&table=jbsvcr.profil" onLoad="rbInit();" onResize="rbResize()" bgcolor="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="profile2.php" method="GET">
<div id="mainTemplate">
	<div id="top">&nbsp;&nbsp;
     <input name="ubah" type="button" class="tombol" style="width:100px;" value="Ubah Profil" onClick=
                 "document.location.href='profile_edit.php';">&nbsp;
     <input name="tema" type="button" class="tombol" style="width:100px;" value="Tema Profil">&nbsp;
     <input name="ngobrol" type="button" class="tombol" style="width:100px;" value="Ajak Ngobrol">&nbsp;
     <input name="pesan" type="button" class="tombol" style="width:100px;" value="Kirim Pesan">
    </div>
    <div id="mainContent">
      
      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
        <tr>
          <td width="15" height="20" style="background-image:url(../images_slice/bg_profil80_01.png); 
              background-repeat:no-repeat; background-position:right;">&nbsp;</td>
          <td width="946" height="20" style="background-image:url(../images_slice/bg_profil80_02.png); 
              background-repeat:repeat-x; background-position:right; width: auto">&nbsp;</td>
          <td width="12" height="20" style="background-image:url(../images_slice/bg_profil80_04.png); 
              background-repeat:no-repeat; background-position:left;">&nbsp;</td>
        </tr>
        <!-- //Isian untuk Profile -->
        <tr>
          <td style="background-image:url(../images_slice/bg_profil80_07.png); background-repeat:repeat-y; 
                     background-position:right;"></td>
          <td style="background-image:url(../images_slice/bg_profil80_08.png); background-repeat:repeat;
                      background-position:right; width:auto"><br />
          <div id="isiProfile">
            <div id="biodata">
            	<div>
                 <table id="tabBiodata">
                  <tr>
                   <th colspan="3"> <span class="style1">NIS <?=SI_USER_ID()?></span> </th>
                  </tr>
                  <tr>
                   <th colspan="3"><br /></th>
                  </tr>
                  <tr>
                   <td width="61"><span class="style6">Nama</span></td>
                   <td width="9">:</td>
                   <td width="134"><?=$row_Biodata[nama]; ?></td>
                  </tr>
                  <tr>
                   <td><span class="style6">Alamat</span></td>
                   <td>:</td>
                   <td><?=$row_Biodata[alamat]; ?></td>
                  </tr>
                  <tr>
                   <td><span class="style6">Telepon</span></td>
                   <td>:</td>
                   <td><?=$row_Biodata[telpon]; ?></td>
                  </tr>
                  <tr>
                   <td><span class="style6">HP</span></td>
                   <td>:</td>
                   <td><?=$row_Biodata[hp]; ?></td>
                  </tr>
                  <tr>
                   <td><span class="style6">Email</span></td>
                   <td>:</td>
                   <td><?=$row_Biodata[email]; ?></td>
                  </tr>
                  <tr>
                   <td><span class="style6">Hobby</span></td>
                   <td>:</td>
                   <td><?=$row_Biodata[hobi]; ?></td>
                  </tr>
                  <tr>
                   <td><span class="style6">Buku Favorit</span></td>
                   <td>:</td>
                   <td><?=$row_Biodata[buku]; ?></td>
                  </tr>
                  <tr>
                   <td><span class="style6">Riwayat</span></td>
                   <td>:</td>
                   <td><?=$row_Biodata[riwayat]; ?></td>
                  </tr>
                 </table>
                 <div id="tentang">
                  <table width="95%" id="gue">
                   <tr>
                    <td width="23%"><?=$row_peg[panggilan]?></td>
                    <td width="38%" class="style7" style="text-align:center"><div align="left"></div></td>
                    <td width="39%" class="style7" style="text-align:center"><div align="left">Tentang Saya</div></td>
                   </tr>
                   <tr>
                    <td colspan="3" style="val"><img src="../library/gambar.php?replid=<?=$row_Biodata[replid]?>&table=jbsvcr.profil" 
                         align="left" style="padding-right:10px"
                         height="40%" width="40%"/><?=$row_Biodata[tentang]?></td>
                   </tr>
                  </table>
                  <br /><br />
                  <table id="tbGaleri">
                   <tr>
                    <th bgcolor="#999999" colspan="4"> .:: GALERI ::.</th>
                   </tr>
                   <tr>
                    <td width="31%"><em class="style8"><strong>Fotoku </strong></em></td>
                    <td width="3%">&nbsp;</td>
                    <td width="47%">&nbsp;</td>
                    <td width="19%">&nbsp;
                       <a href="#" onClick="document.location.href='profile2.php?opfoto=viewallphoto'"><em>View All 
                        <span class="style4">(<?=$jumfoto?>)</span> ...</em></a>                    </td>
                   </tr>
                     <? 
				       if ($opfoto=="viewallphoto"){
					     for ($i=0;$i<=$halfoto;$i++){ ?>
                   <tr>
                     <?		
					   $res_foto=QueryDb("SELECT * FROM jbsvcr.galerifoto WHERE nis='".SI_USER_ID()."' 
					                      ORDER BY replid DESC LIMIT ".(int)$i*(int)$barisfoto.",".$barisfoto);
					   while ($row_foto=@mysql_fetch_array($res_foto)){
					 ?>
                       <td width="31%" style="text-align:center"><div align="center" style="text-align:center">
				       <a title="<?=$row_foto[keterangan]?>" 
                          href="../library/gambar.php?replid=<?=$row_foto[replid]?>&table=jbsvcr.galerifoto" 
                          rel="lytebox[vacation]"  ><!--onClick="lihat_gambar('../library/gambar.php?replid=
						  <?=$row_foto[replid]?>&table=jbsvcr.galerifoto')"-->
                          <img src="../library/gambar.php?replid=<?=$row_foto[replid]?>&table=jbsvcr.galerifoto" 
                          width="70" height="70" style="cursor:pointer;"><br>
                       <?=$row_foto[keterangan]?></a>
                       </div></td>
                     <? } ?>
                   </tr>
                     <? } } else {?>
                   <tr>
                   	 <?
				         while ($row_fot=@mysql_fetch_array($res_fot)){
					 ?>
                       <td width="31%" style="text-align:center"><div align="center" style="text-align:center">
                         <a title="<?=$row_foto[keterangan]?>" 
                             href="../library/gambar.php?replid=<?=$row_fot[replid]?>&table=jbsvcr.galerifoto" 
                             rel="lytebox[vacation]"  >
                         <img   src="../library/gambar.php?replid=<?=$row_fot[replid]?>&table=jbsvcr.galerifoto" 
                         width="70" height="70" style="cursor:pointer;"><br>
                        <?=$row_fot[keterangan]?></a>
                       </div></td>
                     <? } ?>
			       </tr>
			         <? } ?>
                   </table>
                  <table width="92%">
                    <tr>
                      <td width="25%" height="25" valign="top"><span class="style8">Karyaku </span></td>
                      <td width="48%" height="25" valign="top">&nbsp;</td>
                      <td width="27%" height="25" valign="top">&nbsp;
                          <div align="right" style="text-align:center">
                            <div align="left"><a href="#" onClick="document.location.href='profile2.php?opkarya=viewallkarya'"> <em>View All <span class="style4">(
                              <?=$jumkarya?>
                              )</span> ...</em></a></div>
                          </div></td>
                    </tr>
                    <? 
			          if ($opkarya=="viewallkarya"){
					    for ($i=0;$i<=$halkarya;$i++){ ?>
                    <tr>
                      <?		
					  $res_karya=QueryDb("SELECT * FROM jbsvcr.buletin WHERE idpengirim='".SI_USER_ID()."' 
					                      ORDER BY tanggalinput DESC LIMIT ".(int)$i*(int)$bariskarya.",".$bariskarya);
					  while ($row_karya=@mysql_fetch_array($res_karya)){
					?>
                      <br />
                      <td width="25%"><a style="text-decoration:none;cursor:pointer;" href="#" 
                     onclick="showkarya('<?=$row_karya[replid]?>')" > <em><font color="#006666" size="1" face="Verdana, Arial, Helvetica, sans-serif">
                        <?=$row_karya['tempatbuletin']?>
                        ,
                        <?=LongDateFormat($row_karya['tanggalbuletin'])?>
                        </font></em><br />
                        <em><font color="#0000FF">
                          <?=substr($row_karya['judul'],0,25)?>
                          </font></em><br />
                        <br />
                        <?  
					   $rowhsl=explode(" ",$row_karya['buletin']);
					   echo $rowhsl[0];
					 ?>
                        </a>
                          <div align="right"><img title="Hapus karya [<?=$row_karya['judul']?>]" src="../images/ico/hapus.png" 
                        style="cursor:pointer;" onClick="del_karya('<?=$row_karya[replid]?>','viewallkarya')" /></div></td>
                      <? } ?>
                    </tr>
                    <? } } else {?>
                    <tr>
                      <?
				     while ($row_kar=@mysql_fetch_array($res_kar)){
				   ?>
                      <br />
                      <td width="25%"><a style="text-decoration:none;cursor:pointer;" href="#" 
                                   onclick="showkarya('<?=$row_kar[replid]?>')"> <em><font color="#006666" size="1" face="Verdana, Arial, Helvetica, sans-serif">
                        <?=$row_kar['tempatbuletin']?>
                        ,
                        <?=LongDateFormat($row_kar['tanggalbuletin'])?>
                        </font></em><br />
                        <em><font color="#0000FF">
                          <?=substr($row_kar['judul'],0,25)?>
                          </font></em><br />
                        <font size="2" face="Arial">
                        <?=removetag($row_kar['buletin'],200)."..."?>
                          </font></a><font size="2" face="Arial">
                        <?//=$row['buletin']?>
                        <div align="right"><img title="Hapus karya [<?=$row_kar['judul']?>]" 
                          src="../images/ico/hapus.png" style="cursor:pointer;" onClick="del_karya('<?=$row_kar[replid]?>','')" /></div>
                            <br />
                      </font></td>
                      <? } ?>
                    </tr>
                    <? } ?>
                  </table>
                 </div>
                </div>
                <div id="bio">
                 <table height="38" id="tabKolega">
                  <tr>
                   <th bgcolor="#999999" colspan="3">.::  DAFTAR GURU & TEMAN-TEMAN  ::.</th>
                  </tr>
                  <tr>
                	<td width="54" valign="top"><strong>Guru</strong></td>
                    <td width="149">&nbsp;</td>
                    <td width="85">&nbsp;<a href="#" onClick="document.location.href='viewallguru.php'">
                      <em>View All <span class="style4">(<?=$jumguru?>)</span> ...</em></a></td>
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
							<td align="center" style="text-align:center">
                            <img src="../library/gambar.php?replid=<?=$row_gr[replid]?>&table=jbsvcr.profil" style="cursor:pointer;" 
                             onClick="document.location.href='view_profil_guru.php?replid=<?=$row_gr[replid]?>';" 
                             width="50px" height="50px" border="1"><br><em><?=$row_pg[panggilan]?></em></td>
                         <?
							}
						 ?>
                       </tr>
                      </table>                    </td>
                  </tr>
                  <tr>
                    <td height="25" valign="top"><div align="left"><strong>Siswa </strong></div></td>
                    <td height="25" valign="top">&nbsp;</td>
                    <td height="25" align="right" valign="top">&nbsp;<a href="#" onClick="document.location.href='viewallsiswa.php'">
                       <em>View All <span class="style4">(<?=$jumsiswa?>)</span> ...</em></a></td>
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
						<td align="center" style="text-align:center">
                           <img style="cursor:pointer;" 
                           onClick="document.location.href='view_profil_siswa.php?replid=<?=$row_s[replid]?>';" 
                           src="../library/gambar.php?replid=<?=$row_s[replid]?>&table=jbsvcr.profil" 
                           width="50px" height="50px" border="1"><br><em><?=$row_pgs[panggilan]?></em>                        </td>
                        <?
						  }
						?>
                      </tr>
                     </table>                   </td>
                  </tr>
                 </table>
                </div>
                
                <div>
                 <table id="tabKomentar">
                  <tr>
                   <th bgcolor="#999999" colspan="3">.:: Komentar ::.</th>
                  </tr>
                  <tr>
                   <td colspan="3">
                   	<? if ($op=="komen"){ ?>
				       <input name="komentar" type="submit" class="but" value="Kirim Komentar">
					<? } else { ?>
					   <input style="visibility:hidden;" onClick="document.location.href='profile.php?op=komen'" 
                           name="komentar" type="button" class="but" value="Tulis Komentar">
				    <? } ?>                   </td>
                  </tr> 
                  <tr>
                    <td colspan="3">
                      <table width="100%" border="0" cellspacing="0">
                        <? if ($op=="komen"){ ?>
						  <input type="hidden" name="op" value="komensimpan">
						  <tr>
                            <td width="18%" valign="top">Nama</td>
                            <td colspan="2" valign="top">
                              <input type="hidden" name="sender" value="<?=SI_USER_ID()?>"><?=SI_USER_NICKNAME()?></td>
                          </tr>
						  <tr>
							<td valign="top">Komentar</td>
							<td width="35%" valign="top"><textarea name="komentar" id="komentar"></textarea></td>
						    <td width="31%" valign="top">&nbsp;</td>
						  </tr>
					    <? } else { 
						  while ($row_kom=@mysql_fetch_array($res_kom)) {
						   $res_ft_sender = QueryDb("SELECT * FROM jbsvcr.profil WHERE nip='$row_kom[nip]'");
						   $row_ft_sender = @mysql_fetch_array($res_ft_sender);
						   $res_n = QueryDb("SELECT panggilan FROM jbsakad.siswa WHERE nis='$row_kom[nis]'");
							  $row_n = @mysql_fetch_array($res_n);
					    ?>
						  <tr>
                            <td width="18%" valign="middle" style="text-align:center">
                             <img src="../library/gambar.php?replid=<?=$row_ft_sender[replid]?>&table=jbsvcr.profil" 
                              width="50px" height="50px" border="1" style="vertical-align:top"><br>
                            <?=$row_n[panggilan]?></td>
                            <td colspan="2" valign="top">
                                <?=ShortDateFormat($row_kom[tanggal])?> 
                          <?=$row_kom[jam]?><br>
                            <?=$row_kom[komentar]?><img src="../images/ico/hapus.png" height="15" 
                                      style="cursor:pointer;text-align:left;"  
                                   title="Hapus komentar ini" onClick="if (confirm('Anda yakin akan menghapus komentar ini ?'))
                                     document.location.href='profile.php?op=hapuskomentar&replid=<?=$row_kom[replid]?>'" /></td>
                          </tr>
						<!--<tr>
						<td valign="top" colspan="2">&nbsp;</td>
				      </tr>-->
				      <? } } ?>
                      <tr>
                        <td height="130" colspan="2"><em>Ada&nbsp;<?=$jumkomentar?>&nbsp;komentar...</em></td>
                        <td height="130" colspan="2"><?
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
						  <input <?=$disback?> type="button" class="but" title="Sebelumnya" name="back" 
                              value="<" onClick="change_page('<?=(int)$page-1?>')" 
                              onMouseOver="showhint('Sebelumnya', this, event, '75px')">
						  <?=$page+1?>
						  <input <?=$disnext?> type="button" class="but" name="next" title="Selanjutnya" 
                              value=">" onClick="change_page('<?=(int)$page+1?>')" 
                              onMouseOver="showhint('Berikutnya', this, event, '75px')">
						  <? } ?></td>
                        </tr>
                    </table>                   </td>
                  </tr>  
                 </table><br /><br /><? if($opfoto=="viewallphoto"){ echo "<br /><br /><br /><br /><br />"; } ?>
                </div>
    		</div>
          </div>          </td>
          <td style="background-image:url(../images_slice/bg_profil80_09.png); background-repeat:repeat-y;"></td>
        </tr>
        <tr>
          <td style="background-image:url(../images_slice/bg_profil80_10.png); background-repeat:no-repeat; 
                     ">&nbsp;</td>
          <td style="background-image:url(../images_slice/bg_profil80_11.png); background-repeat:repeat-x; width:auto"></td>
          <td style="background-image:url(../images_slice/bg_profil80_12.png); background-repeat:no-repeat;">&nbsp;</td>
        </tr>
      </table>
    </div>
</div>
</form>
</body>
</html>