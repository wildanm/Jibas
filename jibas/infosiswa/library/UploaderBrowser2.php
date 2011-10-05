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
OpenDb();
function delete($file) {
 if (file_exists($file)) {
   chmod($file,0777);
   if (is_dir($file)) {
     $handle = opendir($file); 
     while($filename = readdir($handle)) {
       if ($filename != "." && $filename != "..") {
         delete($file."/".$filename);
       }
     }
     closedir($handle);
     rmdir($file);
   } else {
     unlink($file);
   }
 }
 }
$bulan="";
if (isset($_REQUEST[bulan]))
	$bulan=$_REQUEST[bulan];
$tahun="";
if (isset($_REQUEST[tahun]))
	$tahun=$_REQUEST[tahun];

$op="";
if (isset($_REQUEST[op]))
	$op=$_REQUEST[op];
if ($op=="09vn4230984cn2048723n98423"){
	$sql_get="SELECT replid, direktori, namafile, namagambar FROM jbsvcr.gambartinypesan WHERE replid='$_REQUEST[replid]'";
	$res_get=QueryDb($sql_get);
	$row_get=@mysql_fetch_array($res_get);
	$dir=str_replace("/","\\",$row_get[direktori]);
	$file=$UPLOAD_DIR."gambarpesan\\".$dir.$row_get[namafile];
	delete($file);
	QueryDb("DELETE FROM jbsvcr.gambartinypesan WHERE replid='$_REQUEST[replid]'");
}
$sql_bln="SELECT bulan FROM jbsvcr.gambartinypesan WHERE nis='".SI_USER_ID()."' GROUP BY bulan";
$result_bln=QueryDb($sql_bln);
$sql_thn="SELECT tahun FROM jbsvcr.gambartinypesan WHERE nis='".SI_USER_ID()."' GROUP BY tahun";
$result_thn=QueryDb($sql_thn);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <link href="Style/style.css" rel="Stylesheet" />
    <title>Untitled Page</title>
    <script language="javascript" src="../script/tools.js"></script>
    <script language="javascript">
    function OpenGambar(imgaddr) {
        var addr = "UploaderOpenGambar2.php?imgaddr=" + imgaddr;
	    newWindow(imgaddr, 'Gambar','720','630','resizable=1,scrollbars=1,status=0,toolbar=0');
    }
    
    function DelGambar(id) {
        if (confirm("Apakah anda yakin akan menghapus gambar ini?")) {
            document.location.href = "UploaderBrowser2.php?op=09vn4230984cn2048723n98423&replid="+id;
        }
    }
        
    function PilihGambar(img) {
        parent.opener.Accept(img);
        parent.close();
    }
    </script>
    <link href="../style/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Bulan: 
	<select name="bulan" id="bulan">
	<?
	if (@mysql_num_rows($result_bln)>0){
		while ($row_bln=@mysql_fetch_array($result_bln)){
			if ($bulan=="")
				$bulan=$row_bln[bulan];
		?>
		<option value="<?=$row_bln[bulan]?>"><?=$bulan_pjg[$row_bln[bulan]]?></option>
		<?
		}
	} else {
	?>
	<option value=""> - - - </option>
	<?
	}
	?>
	</select><?//=$bulan?>
	<select name="tahun" id="tahun">
	<?
	if (@mysql_num_rows($result_thn)>0){
		while ($row_thn=@mysql_fetch_array($result_thn)){
			if ($tahun=="")
				$tahun=$row_thn[tahun];
		?>
		<option value="<?=$row_thn[tahun]?>"><?=$row_thn[tahun]?></option>
		<?
		}
	} else {
	?>
	<option value=""> - - - </option>
	<?
	}
	?>
	</select>
    <br /><br />
       <? if ($bulan!="" && $tahun!=""){ ?>
       <table width="100%" border="0" cellspacing="2" class="tab">
          <?
		  $sql="SELECT replid, direktori, namafile, namagambar FROM jbsvcr.gambartinypesan WHERE nis='".SI_USER_ID()."' AND bulan='$bulan' AND tahun='$tahun'";
		  $result=QueryDb($sql);
		  $i=1;
		  while ($row=@mysql_fetch_array($result)){
		  if ($i==1 || $i-1%5==0) { ?>
			 <tr>
		  <? } ?>
				<td align="center">
                    <table width="100%" border="0" cellspacing="0">
                      <tr>
                        <td><div align="center"><img onclick="OpenGambar('<?=$WEB_UPLOAD_DIR."gambarpesan/".$row[direktori].$row[namafile]?>')" width="100" src="<?=$WEB_UPLOAD_DIR."gambarpesan/".$row[direktori].$row[namafile]?>" /></div></td>
                      </tr>
                      <tr>
                        <td><div align="center">
                          <?=$row[namagambar]?>
                          <br />
                          <?=$row[namafile]?>
                          <br />
                          <img src="../images/ico/lihat.png" style="cursor:pointer;" onclick="OpenGambar('<?=$WEB_UPLOAD_DIR."gambarpesan/".$row[direktori].$row[namafile]?>')" />
                          <input type="submit" name="ambil" id="ambil" value="Pilih" class="but" onclick="PilihGambar('<?=$WEB_UPLOAD_DIR."gambarpesan/".$row[direktori].$row[namafile]?>')"/>
                        <img src="../images/ico/hapus.png" style="cursor:pointer;" onclick="DelGambar('<?=$row[replid]?>')" /></div></td>
                      </tr>
                    </table>
               </td>
         <? if ($i%5==0) { ?>
		    <tr>
	     <? } ?>
          <? $i++; 
		  } ?>
        </table>
        <? } ?>
    </div>
    </form>
</body>
</html>