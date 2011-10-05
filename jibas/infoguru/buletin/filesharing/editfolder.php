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
require_once('../../include/errorhandler.php');
require_once('../../include/sessioninfo.php');
require_once('../../include/common.php');
require_once('../../include/config.php');
require_once('../../include/db_functions.php');
require_once('../../include/theme.php'); 

if (isset($_REQUEST['iddir']))
	$iddir = $_REQUEST['iddir'];
OpenDb();
$sql = "SELECT dirfullpath FROM jbsvcr.dirshare WHERE idroot=0";
$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$rootname = $row[0];

$sql = "SELECT dirfullpath,idroot,dirname FROM jbsvcr.dirshare WHERE replid='$iddir'";
$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$dfullpath = $row[0];
$idroot = $row[1];
$dirname = $row[2];

$sql = "SELECT dirfullpath FROM jbsvcr.dirshare WHERE replid='$idroot'";
$result = QueryDb($sql);
$row = mysql_fetch_row($result);
$root = $row[0];
CloseDb();

$cek = 0;
$ERROR_MSG = "";
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
function my_dir_copy($oldname, $newname){
 echo "masuk $oldname, $newname<br>";
 if(!is_dir($newname)){
    $makefolder = mkdir($newname, 0644);
	
	if ($makefolder)
		echo "Bisa`".$newname."`<br>";
	else
		echo "gagal `".$newname."`<br>";
	
	chmod($newname, 0777);
	//echo "Bikin folder baru `".$newname."`<br>";
 }
 $dir = opendir($oldname);
 while($file = readdir($dir)){
    if($file == "." || $file == ".."){
      continue;
    }
    my_copy("$oldname/$file", "$newname/$file");
	//echo $oldname."/".$file."<br>".$newname."/".$file."<br>";
 }
 //closedir($dir);
}
function my_copy($oldname, $newname){
 if(is_file($oldname)){
    $perms = fileperms($oldname);
    return copy($oldname, $newname) && chmod($newname, $perms);
 }else if(is_dir($oldname)){
    my_dir_copy($oldname, $newname);
	//echo $oldname."<br>".$newname."<br>";
 }else{
    die("Cannot copy file: $oldname (it's neither a file nor a directory)");
 } 
}
function recurse_copy($src,$dst) { 
    $dir = opendir($src); 
    @mkdir($dst); 
    while(false !== ( $file = readdir($dir)) ) { 
        if (( $file != '.' ) && ( $file != '..' )) { 
            if ( is_dir($src . '/' . $file) ) { 
                recurse_copy($src . '/' . $file,$dst . '/' . $file); 
            } 
            else { 
                copy($src . '/' . $file,$dst . '/' . $file); 
            } 
        } 
    } 
    closedir($dir); 
} 
function smartCopy($source, $dest) 
    { 
		$options=array('folderPermission'=>0755,'filePermission'=>0755);
        $result=false; 
        
        if (is_file($source)) { 
            if ($dest[strlen($dest)-1]=='/') { 
                if (!file_exists($dest)) { 
                    cmfcDirectory::makeAll($dest,$options['folderPermission'],true); 
                } 
                $__dest=$dest."/".basename($source); 
            } else { 
                $__dest=$dest; 
            } 
            $result=copy($source, $__dest); 
            chmod($__dest,$options['filePermission']); 
            
        } elseif(is_dir($source)) { 
            if ($dest[strlen($dest)-1]=='/') { 
                if ($source[strlen($source)-1]=='/') { 
                    //Copy only contents 
                } else { 
                    //Change parent itself and its contents 
                    $dest=$dest.basename($source); 
                    @mkdir($dest); 
                    chmod($dest,$options['filePermission']); 
                } 
            } else { 
                if ($source[strlen($source)-1]=='/') { 
                    //Copy parent directory with new name and all its content 
                    @mkdir($dest,$options['folderPermission']); 
                    chmod($dest,$options['filePermission']); 
                } else { 
                    //Copy parent directory with new name and all its content 
                    @mkdir($dest,$options['folderPermission']); 
                    chmod($dest,$options['filePermission']); 
                } 
            } 

            $dirHandle=opendir($source); 
            while($file=readdir($dirHandle)) 
            { 
                if($file!="." && $file!="..") 
                { 
                     if(!is_dir($source."/".$file)) { 
                        $__dest=$dest."/".$file; 
                    } else { 
                        $__dest=$dest."/".$file; 
                    } 
                    //echo "$source/$file ||| $__dest<br />"; 
                    $result=smartCopy($source."/".$file, $__dest, $options); 
                } 
            } 
            closedir($dirHandle); 
            
        } else { 
            $result=false; 
        } 
        return $result; 
    } 

function travsearch($iddir,$dirname,$namafolder){
	global $idroot;
	$idroot = $_REQUEST[iddir];
	OpenDb();
	$sql="SELECT replid,dirfullpath FROM jbsvcr.dirshare WHERE idroot='$iddir'";
	$result=QueryDb($sql);
	while ($row = @mysql_fetch_array($result)){
		$df = str_replace($dirname,$namafolder,$row[dirfullpath]);
		$sql1="UPDATE jbsvcr.dirshare SET dirfullpath='$df' WHERE replid='$row[replid]'";
		QueryDb($sql1);
		travsearch($row[replid],$dirname,$namafolder);
	}

}
if (isset($_REQUEST['Simpan'])) {
	OpenDb();
	$sql = "SELECT dirfullpath,idroot,dirname FROM jbsvcr.dirshare WHERE replid='$iddir'";
	$result = QueryDb($sql);
	$row = mysql_fetch_row($result);
	$dfullpath = $row[0];
	$idroot = $row[1];
	$dirname = $row[2];
	
	OpenDb();
	$namaroot = str_replace("/",GetOSSlash(),$_REQUEST[root]);
	$namafolder = str_replace(" ","",$_REQUEST[folder]);
	$namafolder = trim($namafolder);
	//echo $UPLOAD_DIR."fileshare\\".$namaroot.$dirname."<br>";
	//echo $UPLOAD_DIR."fileshare\\".$namaroot.$namafolder;
	$src = $UPLOAD_DIR."fileshare".GetOSSlash().$namaroot.$dirname;
	$dst = $UPLOAD_DIR."fileshare".GetOSSlash().$namaroot.$namafolder;
	$src = str_replace("root/","",$src);
	$src = str_replace("root\\","",$src);
	$dst = str_replace("root/","",$dst);
	$dst = str_replace("root\\","",$dst);
	my_dir_copy($src, $dst);
	//rename($src, $dst);
	//recurse_copy($UPLOAD_DIR."fileshare".GetOSSlash().$namaroot.$dirname,$UPLOAD_DIR."fileshare".GetOSSlash().$namaroot.$namafolder);
	//smartCopy($UPLOAD_DIR."fileshare".GetOSSlash().$namaroot.$dirname.GetOSSlash(), $UPLOAD_DIR."fileshare".GetOSSlash().$namaroot.$namafolder.GetOSSlash());
	//echo $src."<br>";
	//echo $dst;
	//copy($UPLOAD_DIR."fileshare\\".$namaroot.$dirname."\\",$UPLOAD_DIR."fileshare\\".$namaroot.$namafolder."\\");
	$df = str_replace($dirname,$namafolder,$dfullpath);
	$sql = "UPDATE jbsvcr.dirshare SET dirfullpath='$df', dirname='$namafolder' WHERE replid='$iddir'";
	QueryDb($sql);
	//deldir($UPLOAD_DIR."fileshare".GetOSSlash().$namaroot.$dirname);
	
	$cntxx=0;
		global $idroot;
		$idroot = $iddir;
	OpenDb();
	$sql0="SELECT replid,dirfullpath FROM jbsvcr.dirshare WHERE replid='$iddir'";
	$result0=QueryDb($sql0);
	$row0 = @mysql_fetch_array($result0);
	$dir = str_replace($WEB_UPLOAD_DIR,$UPLOAD_DIR,$row0[dirfullpath]);
	//$dirnya = str_replace("/","\\",$dir);
	$dirnya=str_replace("/",GetOSSlash(),$dir);
	$dirnya=str_replace("root\\",$UPLOAD_DIR."fileshare".GetOSSlash(),$dirnya);
	$dirnya=str_replace("root/",$UPLOAD_DIR."fileshare".GetOSSlash(),$dirnya);
	//echo "2".$dirnya;
	//exit;
	deldir($dirnya);
	$sql="SELECT replid,dirfullpath FROM jbsvcr.dirshare WHERE idroot='$iddir'";
	$result=QueryDb($sql);
	while ($row = @mysql_fetch_array($result)){
		$df = str_replace($dirname,$namafolder,$row[dirfullpath]);
		$sql1="UPDATE jbsvcr.dirshare SET dirfullpath='$df' WHERE replid='$row[replid]'";
		QueryDb($sql1);
		travsearch($row[replid],$dirname,$namafolder);
	}
	?>
	<script language="javascript" >
		opener.get_fresh();
		//window.close();
	</script>
	<?
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../../style/style.css">
<link rel="stylesheet" type="text/css" href="../../style/tooltips.css">
<link rel="stylesheet" type="text/css" href="../../script/SpryAssets/SpryValidationTextField.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS INFOGURU [Tambah Folder]</title>
<script language="JavaScript" src="../../script/tooltips.js"></script>
<script language="javascript" src="../../script/tables.js"></script>
<script language="javascript" src="../../script/tools.js"></script>
<script language="javascript" src="../../script/validasi.js"></script>
<script language="javascript" src="../../script/SpryAssets/SpryValidationTextField.js"></script>
<script language="javascript" >
function validate(){
var folder=document.getElementById('folder').value;
if (folder.length==0){
	alert ('Anda harus mengisikan nama untuk Folder!');
	document.getElementById('folder').focus();	
	return false;
	}
	return true
	
}
function caripegawai() {
	newWindow('../../../jibassimaka2/library/caripegawai.php?flag=0', 'CariPegawai','600','565','resizable=1,scrollbars=1,status=0,toolbar=0');
}
function kopikecopy(){
	var x=document.getElementById('folder').value;
	document.getElementById('copydir').value=x;
}
</script>
<style type="text/css">
<!--
.style1 {color: #0000FF}
-->
</style>
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" style="background-color:#FFFFFF" onLoad="document.getElementById('folder').focus();">
<form name="main" onSubmit="return validate()" method="GET" enctype="multipart/form-data">
<input name="fullpath" id="fullpath" type="hidden" readonly value="<?=$dfullpath?>" />
<input name="root" id="root" type="hidden" readonly value="<?=$root?>" />
<input name="iddir" id="iddir" type="hidden" readonly value="<?=$iddir?>" />
<table border="0" width="95%" cellspacing="0" align="center">
<!-- TABLE CONTENT -->
<tr height="25">
<td height="25" colspan="2" class="header"><div align="center">Ubah Folder</div></td>
</tr>
<tr>
  <td width="6%" align="right"><div align="left"><strong>Folder&nbsp;:&nbsp;</strong></div></td>
  <td width="94%" height="25" align="left">&nbsp;<?="(root)/".$root?>
    <input onKeyUp="kopikecopy()" name="folder" id="folder" type="text" value="<?=$dirname?>" /></td>
</tr>
<tr>
	<td colspan="2" align="center" bgcolor="#CCCCCC">
    <input type="submit" name="Simpan" id="Simpan" value="Simpan" class="but" />&nbsp;
    <input type="button" name="Tutup" id="Tutup" value="Tutup" class="but" onClick="window.close()" />    </td>
</tr>
<!-- END OF TABLE CONTENT -->
</table>
</form>
<!-- Tamplikan error jika ada -->
<? if (strlen($ERROR_MSG) > 0) { ?>
<script language="javascript">
	alert('<?=$ERROR_MSG?>');
</script>
<? } ?>

<!-- Pilih inputan pertama -->
</body>
</html>
<script language="javascript">
	var sprytextfield1 = new Spry.Widget.ValidationTextField("folder");
</script>