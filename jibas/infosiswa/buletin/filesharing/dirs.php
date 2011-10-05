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
require_once("../../include/config.php");
require_once("../../include/common.php");
require_once("../../include/db_functions.php");
require_once("../../include/sessioninfo.php");
function deldir($dir){
  $current_dir = opendir($dir);
  while($entryname = readdir($current_dir)){
     if(is_dir("$dir/$entryname") and ($entryname != "." and $entryname!="..")){
        deldir("${dir}/${entryname}");
     }elseif($entryname != "." and $entryname!=".."){
        unlink("${dir}/${entryname}");
     }
  }
  closedir($current_dir);
  rmdir(${dir});
}
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
function travsearch($iddir){
	global $idroot;
	$idroot = $_REQUEST[iddir];
	OpenDb();
	$sql="SELECT replid,dirfullpath FROM jbsvcr.dirshare WHERE idroot=$iddir";
	$result=QueryDb($sql);
	while ($row = @mysql_fetch_array($result)){
		$sql1="DELETE FROM jbsvcr.dirshare WHERE replid=$row[replid]";
		QueryDb($sql1);
		$sql2="DELETE FROM jbsvcr.fileshare WHERE iddir=$row[replid]";
		QueryDb($sql2);
		travsearch($row[replid]);
	}

}
if (isset($_REQUEST[op]))
$op=$_REQUEST[op];
if ($op=="q836bzsda53cx5429h3cs52"){// Kalo EOF Begin jgn di apapain..............
	$iddir=$_REQUEST[iddir];
	OpenDb();
	$sql_dir="SELECT dirfullpath FROM jbsvcr.dirshare WHERE replid=$iddir";
	$result_dir=QueryDb($sql_dir);
	$row_dir=@mysql_fetch_array($result_dir);
	$dirfullpath=str_replace($WEB_UPLOAD_DIR,$UPLOAD_DIR,$row_dir[dirfullpath]);
	$dirpath=str_replace("/","\\",$dirfullpath);
	$sql_file="SELECT * FROM jbsvcr.fileshare WHERE iddir=$iddir";
	$result_file=QueryDb($sql_file);
	if (@mysql_num_rows($result_file)>0){
	   ?><script language="javascript">
		 if (confirm('Direktori tidak kosong, \nAnda yakni akan menghapus Direktori ini?')){
		   return true;
		 } else {
			document.location.href="dirs.php?afteradd";
		 }
		 </script><?
			
		 while ($row_file=@mysql_fetch_array($result_file)){
			delete($dirpath.$row_file[filename]);
		 }
		 $sql_del_file="DELETE FROM jbsvcr.fileshare WHERE iddir=$iddir";
		 QueryDb($sql_del_file);
	}
	$sql_del_dir="DELETE FROM jbsvcr.dirshare WHERE replid=$iddir";
	QueryDb($sql_del_dir);
	if (is_dir($dirpath))
		rmdir($dirpath);
	CloseDb();
	?><script language="javascript">				
		get_fresh();
	</script><?
	
}//End Jgn di apa apain.......................................
if ($op=="cx5429zsda53h3cs52q836b"){ ///Kalo NOT EOF
	$cntxx=0;
	$iddir=$_REQUEST[iddir];
		global $idroot;
		$idroot = $iddir;
	OpenDb();
	$sql0="SELECT replid,dirfullpath FROM jbsvcr.dirshare WHERE replid=$iddir";
	$result0=QueryDb($sql0);
	$row0 = @mysql_fetch_array($result0);
	$dir = str_replace($WEB_UPLOAD_DIR,$UPLOAD_DIR,$row0[dirfullpath]);
	$dirnya = str_replace("/","\\",$dir);
	deldir($dirnya);
	$sql="SELECT replid,dirfullpath FROM jbsvcr.dirshare WHERE idroot=$iddir";
	$result=QueryDb($sql);
	while ($row = @mysql_fetch_array($result)){
		$sql1="DELETE FROM jbsvcr.dirshare WHERE replid=$row[replid]";
		QueryDb($sql1);
		$sql2="DELETE FROM jbsvcr.fileshare WHERE iddir=$row[replid]";
		QueryDb($sql2);
		travsearch($row[replid]);
	}
	CloseDb();
OpenDb();
$sql="DELETE FROM jbsvcr.dirshare WHERE replid=$_REQUEST[iddir]";
QueryDb($sql);
$sql2="DELETE FROM jbsvcr.fileshare WHERE iddir=$_REQUEST[iddir]";
QueryDb($sql2);
CloseDb();
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="../../script/mktree.css" />
<script language="javascript" src="../../script/mktree.js"></script>
<script language="javascript" src="../../script/tools.js"></script>
<script language="javascript" src="../../script/tooltips.js"></script>
<link rel="stylesheet" href="../../style/tooltips.css" />
<link rel="stylesheet" href="../../style/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Untitled Document</title>
<script language="javascript">
function createfolder(iddir){
	newWindow('addfolder.php?iddir='+iddir,'BuatFolder','554','183','resizable=1,scrollbars=0,status=0,toolbar=0');
}
function deletefolderend(iddir){
	if (confirm('Anda yakin akan menghapus direktori ini beserta file-file yang ada di dalamnya?')){
		document.location.href="dirs.php?op=q836bzsda53cx5429h3cs52&iddir="+iddir+"&afteradd";
	}
}
function deletefoldernotend(iddir){
	if (confirm('Anda yakin akan menghapus direktori ini beserta direktori dan file-file yang ada di dalamnya?')){
		document.location.href="dirs.php?op=cx5429zsda53h3cs52q836b&iddir="+iddir+"&afteradd";
	}
}
function get_fresh(){
	parent.files.location.href="blank.php";
	document.location.href="dirs.php?afteradd";
}
</script>
</head>

<body style="background-color:#FBFBFB" <? if (isset($_REQUEST[afteradd])) { ?> onLoad="expandTree('tree1');" <? } ?>>
<a href="#" onClick="document.location.reload()"><img src="../../images/ico/refresh.png" border="0" /></a>&nbsp;|&nbsp;<a href="#" onClick="expandTree('tree1'); return false;">Expand All</a>&nbsp;|&nbsp;
<a href="#" onClick="collapseTree('tree1'); return false;">Collapse All</a><br /><br />
<?
function getNSubDir($idroot) {
	global $idvolume;
	
	$sql = "SELECT count(*) FROM jbsvcr.dirshare WHERE idroot=$idroot";
	$result = QueryDb($sql);
	$row = mysql_fetch_row($result);
	return $row[0];
}

function spacing($count) {
	$str = "";
	for ($i = 0; $i < $count * 2; $i++) 
		$str = $str . " ";
	return $str;
}

function traverse($iddir, $count) {
	global $idvolume;
	
	$sql = "SELECT d.replid, d.dirname, d.idguru, p.nama FROM jbsvcr.dirshare d, jbssdm.pegawai p WHERE d.idroot=$iddir AND p.nip=d.idguru ORDER BY d.dirname";
	$result = QueryDb($sql);
	$space = spacing($count);
	
	while ($row = mysql_fetch_row($result)) {
		$iddir = $row[0];
		$dirname = $row[1];
		$idguru = $row[2];
		$namaguru = $row[3];
		$nsubdir = getNSubDir($iddir);
		
		if ($dirname==$idguru){
			$sql_get_wk = "SELECT p.nama as nama, k.kelas as kelas FROM jbsakad.kelas k, jbssdm.pegawai p WHERE p.nip='$idguru' AND k.nipwali=p.nip";
			$res_get_wk	= QueryDb($sql_get_wk);
			$num_wk = @mysql_num_rows($res_get_wk);
			$row_wk = @mysql_fetch_array($res_get_wk);
			$kelas = $row_wk[kelas];
			$namaguru = $row_wk[nama];

			$sql_get_id = "SELECT pel.nama as pelajaran, pel.departemen as dep FROM jbsakad.pelajaran pel, jbsakad.guru g WHERE g.nip='$idguru' AND g.idpelajaran=pel.replid";
			$res_get_id	= QueryDb($sql_get_id);
			$num_pel = @mysql_num_rows($res_get_id);
			if ($num_pel>0){
			$ajar="<b><u>Mengajar : </u></b>";
			$cnt=1;
			while ($row_pel = @mysql_fetch_array($res_get_id)){
				$ajar=$ajar."<br>".$cnt.". ".$row_pel[pelajaran]." (".$row_pel[dep].")";
				$cnt++;
			}
			$ajar=$ajar."<br>";
			}

			if ($num_wk>0){
			$ajar=$ajar."<b><u> Walikelas ".$kelas." </u></b> <br>";
			}

			if ($num_wk>0 || $num_pel>0){
				$msg="onMouseOver=\"showhint('$ajar', this, event, '140px')\"";
			} else {
				$msg="";
			}
		}				

		if ($nsubdir == 0) {
			echo "$space<li class='liBullet'>&nbsp;</span><a $msg style='text-decoration:none;' href='files.php?iddir=$iddir' target='files'><img src='../../images/ico/folder.gif' border='0'>&nbsp;$dirname</a>&nbsp;";
			if (SI_USER_ID()==$idguru){
				echo "<img onclick='createfolder($iddir)' src='../../images/ico/tambah.png'>&nbsp;";
				echo "<img onclick='deletefolderend($iddir)' src='../../images/ico/hapus.png'>";
			} else if (SI_USER_ID()=="LANDLORD" || SI_USER_ID()=="landlord"){
			echo "<img onclick='deletefoldernotend($iddir)' src='../../images/ico/hapus.png'>";
			}
			echo "\r\n";
		} else {
			echo "$space<li class='liClosed'>&nbsp;<a $msg style='text-decoration:none;' href='files.php?iddir=$iddir' target='files'><img src='../../images/ico/folder.gif' border='0'>&nbsp;$dirname</a>&nbsp;";
			if (SI_USER_ID()==$idguru){
			echo "<img onclick='createfolder($iddir)' src='../../images/ico/tambah.png'>&nbsp;";
			echo "<img onclick='deletefoldernotend($iddir)' src='../../images/ico/hapus.png'>";
			} else if (SI_USER_ID()=="LANDLORD" || SI_USER_ID()=="landlord"){
			echo "<img onclick='deletefoldernotend($iddir)' src='../../images/ico/hapus.png'>";
			}
			echo "\r\n";
			echo "$space<ul>\r\n";
			traverse($iddir, ++$count);
			echo "$space</ul></li>\r\n";
		}
	}
}

OpenDb();
$sql = "SELECT d.replid, d.dirname, d.idguru FROM jbsvcr.dirshare d WHERE d.idroot=0";
$result = QueryDb($sql);
if (mysql_num_rows($result) > 0) {
	$row = mysql_fetch_row($result);
	$iddir = $row[0];
	$dirname = $row[1];
	$idguru = $row[2];
	$nsubdir = getNSubDir($iddir);
	
	echo "<ul class='mktree' id='tree1'>\r\n";
	if ($nsubdir == 0) {
		echo "&nbsp;<li class='liBullet'>&nbsp;<a style='text-decoration:none;' href='files.php?iddir=$iddir' target='files'><img src='../../images/ico/folder.gif' border='0'>&nbsp;(root)</a>&nbsp;";
		if (SI_USER_ID()==$idguru || SI_USER_ID=="LANDLORD" || SI_USER_ID=="landlord")
		//echo "<img onclick='createfolder($iddir)' src='../../images/ico/tambah.png'>";
		echo "</li>\r\n";
	} else {
		echo "&nbsp;<li class='liClosed'>&nbsp;<a style='text-decoration:none;' href='files.php?iddir=$iddir' target='files'><img src='../../images/ico/folder.gif' border='0'>&nbsp;(root)</a>&nbsp;";
		if (SI_USER_ID()==$idguru)
		echo "<img onclick='createfolder($iddir)' src='../../images/ico/tambah.png'>";
		echo "\r\n";
		echo "  <ul>\r\n";
		traverse($iddir, 2);
		echo "  </ul></li>\r\n";
	}
	echo "</ul>\r\n";
}
CloseDb();
?>
<script language="javascript">
collapseTree('tree1');
</script>
</body>
</html>