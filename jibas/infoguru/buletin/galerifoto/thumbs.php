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
require_once('../../sessionchecker.php');
require_once('../../include/common.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/config.php');
require_once('../../include/db_functions.php');
OpenDb();
$sql="SELECT * FROM jbsvcr.galerifoto WHERE idguru='".SI_USER_ID()."'";
$result=QueryDb($sql);
$num=@mysql_num_rows($result);
$cnt=1;
while ($row=@mysql_fetch_array($result)){
	$gbr[$cnt]="../../library/gambar.php?replid=".$row[replid]."&table=jbsvcr.galerifoto";
	$gbrkcl[$cnt]="../../library/gambar.php?replid=".$row[replid]."&table=jbsvcr.galerifoto";
	$ket[$cnt]=$row[keterangan];
	$fn[$cnt]=$row[filename];
	$rep[$cnt]=$row[replid];
$cnt++;
}
CloseDb();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<table width="100%" border="0" cellspacing="0" align="center">
			  <? if ($num>0){ ?>  
			  <?	for ($i=1;$i<=$num;$i++){ ?>
			  <?		if ($i==1 || $i-1%5==0) { ?>
							<tr>
			  <?		} ?>
						<td height="125" align="center"><a title="<?=$ket[$i]?>" href="<?=$WEB_GALLERY_DIR?>photos/<?=$fn[$i]?>" rel="lytebox[vacation]" >
							<img title="Klik untuk melihat ukuran sebenarnya" src="<?=$WEB_GALLERY_DIR?>thumbnails/<?=$fn[$i]?>" width="80" style="cursor:pointer;"></a><br>
							<?=$ket[$i]?>
							<br><img src="../../images/ico/hapus.png" onClick="if (confirm('Anda yakin akan menghapus gambar ini?')) document.location.href='galerifoto.php?op=14075BUSYCODACALLDIFF&replid=<?=$rep[$i]?>&page=t'" title="Hapus gambar ini" style="cursor:pointer;" />
						</td>
			  <?		if ($i%5==0) { ?>
							</tr>
			  <?		} ?>
			  <?	} ?>
			  <? } else {?>
				<tr>
					<td>
						<div align="center"><em>Tidak ada foto</em></div>
					</td>
				</tr>
			  <? } ?>
           </table>
</body>
</html>