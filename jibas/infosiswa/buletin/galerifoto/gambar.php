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
header("Cache-Control: no-cache");
sleep(2);

$p = $_GET['page'];

switch($p) {
case "galeri":
echo '<h2>Halaman Galeri</h2>';
?>
<?
     OpenDb();
	 $sql="SELECT replid,keterangan FROM jbsvcr.galerifoto WHERE nis='".SI_USER_ID()."' LIMIT 0,27";
	 $result=QueryDb($sql);
	 CloseDb();
	 while ($row=@mysql_fetch_array($result)){ ?>
			<img style="cursor:pointer;" title="Klik untuk tampilan lebih besar !" src="../../library/gambar.php?replid=	
						 <?=$row['replid']?>&table=jbsvcr.galerifoto" border="0" width="100px" height="100px" onclick=
                             "tampil('<?=$row['replid']?>')" id="theImage"/>&nbsp;
	<?  } ?><br />
<?
break;
			  
case "contact":
?>

<?
     OpenDb();
	 $sql="SELECT * FROM jbsvcr.profil WHERE nis='".SI_USER_ID()."' ";
	 $result=QueryDb($sql);
	 CloseDb();
	 $row=@mysql_fetch_array($result);
	 echo "<h3>$row[nama]</h3>";
	 echo "<blockquote>";
	 ?>
	 <table>
       <tr>
        <td style="font-size:16px">Alamat</td>
        <td>:</td>
        <td style="font-size:16px"><?=$row[alamat]; ?></td>
       </tr>
       <tr>
        <td style="font-size:16px">No Telepon</td>
        <td>:</td>
        <td style="font-size:16px"><?=$row[telpon]; ?></td>
       </tr>
       <tr></tr>
       <tr></tr>
     </table>
	 <?="</blockquote>";
?>

<?
break;

case "about": default:
?>
<?
     OpenDb();
	 $sql="SELECT * FROM jbsvcr.profil WHERE nis='".SI_USER_ID()."' ";
	 $result=QueryDb($sql);
	 CloseDb();
	 $row=@mysql_fetch_array($result);
	 $replid=$row[replid]
	 ?>
	 
     
     <table width="500px" border="1" style="margin:10px">
  	  <tr>
       <td width="43" rowspan="2" style="width:auto; margin:0">
       
       <img src="../../library/gambar.php?replid=<?=$replid?>&table=jbsvcr.profil" 
          width="140px" height="140px" id="theImage"/><br /></td>
       <td width="634" style="">Nama &nbsp;&nbsp;&nbsp; : <?=$row[nama]; ?><br />
         Alamat &nbsp; : <?=$row[alamat]; ?><br  />
         No. Telp : <?=$row[telpon]; ?> </td>
      </tr>
  	  <tr>
  	    <td style="">&nbsp;</td>
       </tr>
      <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
      </tr>
     </table>

     
	 <?
?>

<?
break;
}

?>