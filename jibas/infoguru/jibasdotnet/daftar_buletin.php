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
require_once("../include/sessioninfo.php");
require_once("../include/db_functions.php");
require_once("../include/config.php");
require_once("../include/common.php");
require_once("../sessionchecker.php");
OpenDb();
$sql="SELECT *,DATE_FORMAT(tanggalinput, '%H:%i:%s') as jam FROM jbsvcr.buletin ORDER BY tanggalbuletin DESC";
$result=QueryDb($sql);
$op = "";
if (isset($_REQUEST['op']))
	$op = $_REQUEST['op'];
if ($op == "dw8dxn8w9ms8zs22") {
	$sql = "UPDATE jbsvcr.buletin SET approved = $_REQUEST[newapproved] WHERE replid = $_REQUEST[replid] ";
	QueryDb($sql); ?>
	<script language="javascript" type="text/javascript">
		document.location.href="daftar_buletin.php";
    </script><?
}
if ($op == "xm8r389xemx23xb2378e23") {
	$sql = "DELETE FROM jbsvcr.buletin WHERE replid = '$_REQUEST[replid]'";
	$result = QueryDb($sql);
	?>
	<script language="javascript" type="text/javascript">
		document.location.href="daftar_buletin.php";
    </script><?
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="../script/tools.js"></script>
<script language="javascript" type="text/javascript">
function tambah(){
	newWindow('buletin_add.php', 'TambahBuletin','648','472','resizable=1,scrollbars=0,status=0,toolbar=0')
}
function get_fresh(){
	document.location.href="buletin.php";
}
function bacabuletin(replid){
	document.location.href="baca_buletin.php?replid="+replid;
}
function setapproved(replid, approved) {
	var msg;
	var newapproved;
	
	if (approved == 1) {
		msg = "Apakah anda yakin akan mengubah buletin ini menjadi TIDAK TERLIHAT?";
		newapproved = 0;
	} else {	
		msg = "Apakah anda yakin akan mengubah buletin ini menjadi TERLIHAT?";
		newapproved = 1;
	}
	if (confirm(msg)) 
		document.location.href = "daftar_buletin.php?op=dw8dxn8w9ms8zs22&replid="+replid+"&newapproved="+newapproved;
}
function hapus(replid) {
var msg;
msg = "Apakah anda yakin akan menghapus buletin ini ?";
if (confirm(msg)) 
		document.location.href = "daftar_buletin.php?op=xm8r389xemx23xb2378e23&replid="+replid;
}
</script>

<link href="../style/style.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0">
  <tr>
    <th scope="row" align="right">&nbsp;&nbsp;<font size="5" style="background-color:#ffcc66">&nbsp;</font>&nbsp;<font size="3" face="Arial" color="Gray"><strong>BULETIN JIBAS.NET</strong></font><br /><br /></th>
  </tr><br />
  <tr>
    <th scope="row">
    	<table width="100%" border="0" cellspacing="5" cellpadding="5">
		<?
        $i=1;
		while ($row=@mysql_fetch_array($result)){
			$sql2="SELECT nama FROM jbsakad.siswa WHERE nis='$row[idpengirim]'";
			$result2=QueryDb($sql2);
			if (@mysql_num_rows($result2)>0){
				$row2=@mysql_fetch_array($result2);
				$nama=$row2[nama];
			} else {
				$sql3="SELECT nama FROM jbssdm.pegawai WHERE nip='$row[idpengirim]'";
				$result3=QueryDb($sql3);
				if (@mysql_num_rows($result3)>0){
				$row3=@mysql_fetch_array($result3);
				$nama=$row3[nama];
				} else {
				$nama="Administrator JIBAS INFOGURU";
				}
			}
        
			if ($i==1 || $i%2==1){
		  	?>
            <tr>
          	<?
		  	}
			?>
        		<td align='center' valign='top' width="50%">
                	<table width="80%" border="0" align="center">
                      <tr>
                        <td>
                          <div align="left"><img src="../images/ico/unread.gif" />&nbsp;<em><font color="#006666" size="1" face="Verdana, Arial, Helvetica, sans-serif"><?=$row['tempatbuletin']?>, <?=LongDateFormat($row['tanggalbuletin'])?></font></em><br />
                          <em><a style="text-decoration:none; text-shadow:#00FF00;" href="#" onClick="bacabuletin('<?=$row[replid]?>')" ><font color="#0000FF"><?=$row['judul']?></font></a></em><br /><br />
                          <font size="2" face="Arial">
                          <?=removetag($row['buletin'],200)."..."?>
                          <?//=$row['buletin']?>
                          </font><br /><br />
                          </div>	  </td>
                      </tr>
                      <tr style="border:none;">
                      <td><div align="right"><img src="../images/ico/arr1.gif" />&nbsp;&nbsp;<a href="#" onClick="bacabuletin('<?=$row[replid]?>')" >Baca Selengkapnya</a></div><div align="left"><font color="#666666" size="1" face="Arial"><br /><em>Posted By : <?=$nama?>&nbsp;,On : <?=LongDateFormat($row['tanggalbuletin'])?>&nbsp;<?=$row['jam']?></em></font></div></td>
                      </tr>
                      <tr>
                      <td style="background-image:url(../images/box_hr1.gif); background-repeat:repeat-x">&nbsp;</td>
                      </tr>
                    </table>
                </td>
            <? 
			if ($i%2==0) 
				echo "</tr>";        
		 
		$i++;
		} 
		?>
		</table>
    </th>
  </tr>
</table>
</body>
</html>
<? CloseDb(); ?>
<!--approvement-->
<? //if ($row[approved] == 1) { ?>
				<!--<a title="Approved!" href="JavaScript:setapproved(<?=$row[replid] ?>, <?=$row[approved] ?>)"><img src="../images/ico/ok.png" border="0" onMouseOver="showhint('', this, event, '50px')"/></a>
<?			//} else { ?>
				<a title="Not Yet Approved!" href="JavaScript:setapproved(<?=$row[replid] ?>, <?=$row[approved] ?>)"><img src="../images/ico/not_ok.png" border="0" onMouseOver="showhint('Approved!', this, event, '50px')"/></a>
<?			//} ?>
		<a title="Hapus!" href="JavaScript:hapus(<?=$row[replid] ?>)"><img src="../images/ico/hapus.png" border="0" onMouseOver="showhint('', this, event, '50px')"/></a>-->