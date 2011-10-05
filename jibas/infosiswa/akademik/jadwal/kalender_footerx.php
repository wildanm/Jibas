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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/getheader.php');
require_once('../include/db_functions.php');
require_once('../include/rupiah.php');
require_once('../library/departemen.php');
OpenDb();
$op=$_REQUEST['op'];
if ($op==""){

	$query="SELECT * FROM jbsakad.aktivitaskalender WHERE idkalender=".$_REQUEST['kalender'];
	$result=QueryDb($query);
}
if ($op=="dfgdf8e4o834uh349783"){
	$sql_hapus="DELETE FROM jbsakad.aktivitaskalender WHERE replid=".$_REQUEST[replid];
	$result_hapus=QueryDb($sql_hapus);
	if ($result_hapus){
	?>
    <script language="JavaScript">
		//alert ('Replid='<?=$_REQUEST[replid]?>);
		refresh();
	</script>
	<?
	}
}
CloseDb();
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../style/style.css" rel="stylesheet" type="text/css">
</head>


<script language="JavaScript">
function refresh(){
document.location.reload();
}
</script>
<script language="JavaScript" src="../script/tools.js"></script>
<script language="JavaScript" src="../script/tables.js"></script>
<body topmargin="0" leftmargin="0">
<table width="100%" border="0" background="../images/ico/b_calendar.png" style="background-repeat:no-repeat">
  <tr>
    <td><table width="70%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="296" align="right">&nbsp;</td>
    <td width="140" align="right" colspan="2"><a href="#" onClick="newWindow('tambah_kegiatan.php?kalender=<?=$_REQUEST['kalender'];?>','kalender','502','303','')"><img style="cursor:pointer" src="../images/ico/tambah.png" width="16" height="16" border="0">Tambah Kegiatan </a><a href="#" onClick="newWindow('cetak_kalenderakademik.php?replid=<?=$_REQUEST['kalender']; ?>','pdf','700','800','')"><? if(mysql_num_rows($result)!=0){?><img src="../images/ico/print.png" width="16" height="16" border="0" style="cursor:pointer" > Cetak
        <? }?></a></td>
  </tr>
  <tr>
    <td colspan="3"><table id=table width="100%"  border="1" align="center" class="tab">
      <tr class="header">
        <td width="50" height="30" align="center">No</td>
        <td width="100" height="30" align="center">Tanggal Mulai </td>
		 <td width="117" height="30" align="center">Tanggal Selesai</td>
        <td width="319" height="30" align="center">Kegiatan</td>
        <td width="70" height="30">&nbsp;</td>
      </tr>
	  <?
	  $a=0;
	  if(mysql_num_rows($result)!=0)
	  	{
		  while($fetch=mysql_fetch_array($result)){
		  $a++;
	  ?>
      <tr valign="top">
        <td height="25" align="center"><?=$a; ?></td>
        <td height="25"><?=format_tgl($fetch['tanggalawal']); ?></td>
		<td height="25"><?=format_tgl($fetch['tanggalakhir']); ?></td>
        <td height="25"><div align="justify"><?=$fetch['kegiatan']; ?>
          </div></td>
        <td height="25" align="center" bgcolor="#FFFFFF">
        <!--<a href="JavaScript:lihat(<?=$fetch['replid']?>)"><img src="../images/ico/lihat.png" border="0" onMouseOver="showhint('Lihat Siswa!', this, event, '50px')"/></a>-->
        <img src="../images/ico/ubah.png" style="cursor:pointer" width="16" height="16" onClick="newWindow('edit_kegiatan.php?op=edit&replid=<?=$fetch['replid'];?>&kalender=<?=$_GET['kalender'];?>','kalender','525','313','')"> <img style="cursor:pointer" src="../images/ico/hapus.png" width="16" height="16" onClick="javascript:a=confirm('Apakah anda yakin untuk menghapus data ini?'); if(a==true){window.location='kalender_footer.php?op=dfgdf8e4o834uh349783&kalender=<?=$_GET['kalender'];?>&replid=<?=$fetch['replid']; ?>';}"></td>
      </tr>
	  <?
	  	}
	  }
	  else
	  {
	  	echo "<tr><td align=center colspan=5 height='25' >Data tidak ada</td></tr>";
	  }
	  ?>
    </table></td>
  </tr>
</table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<script language='JavaScript'>
            Tables('table', 1, 0);
        </script>
</body>
</html>