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

// ------------------------------------------------------------
// PATCH MANAGEMENT FRAMEWORK                                  
// ------------------------------------------------------------

if (file_exists('../include/global.patch.manager.php'))
{
	require_once('../include/global.patch.manager.php');
	ApplyGlobalPatch("..");	
}
elseif (file_exists('../../include/global.patch.manager.php'))
{
	require_once('../../include/global.patch.manager.php');
	ApplyGlobalPatch("../..");
}
elseif (file_exists('../../../include/global.patch.manager.php'))
{
	require_once('../../../include/global.patch.manager.php');
	ApplyGlobalPatch("../../..");
}

require_once('module.patch.manager.php');
ApplyModulePatch();

// ------------------------------------------------------------
// MAIN CONFIGURATION                                          
// ------------------------------------------------------------

if (file_exists('../include/mainconfig.php'))
{
	require_once('../include/mainconfig.php');
}
elseif (file_exists('../../include/mainconfig.php'))
{
	require_once('../../include/mainconfig.php');
}
elseif (file_exists('../../../include/mainconfig.php'))
{
	require_once('../../../include/mainconfig.php');
}

// ------------------------------------------------------------
// DEFAULT CONSTANTS                                           
// ------------------------------------------------------------

$db_name = "jbsakad";

$maxfoto = 20;
$max_uploaded_file_size = "50 MB";

$UPLOAD_DIR = $FS_UPLOAD_DIR;
$WEB_UPLOAD_DIR = "http://$G_SERVER_ADDR/filesharing/";
$GALLERY_DIR = $IG_GALLERY_DIR;
$WEB_GALLERY_DIR = "http://$G_SERVER_ADDR/jibas/infoguru/buletin/galerifoto/";
$WEB_GALLERY_DIR_IS = "http://$G_SERVER_ADDR/jibas/infosiswa/buletin/galerifoto/";
$SITE_FINAL_ADDR = "http://$G_SERVER_ADDR/jibas/infoguru/"; 
$G_WEB_ADDR = "http://$G_SERVER_ADDR/jibas/infoguru/";
$VAR_CATATAN_SISWA = 3 ;
$VAR_BERITA_SISWA = 3 ;
$VAR_BERITA_GURU = 3 ;

$G_ENABLE_QUERY_ERROR_LOG = false;
$full_url = "http://$G_SERVER_ADDR/jibas/infoguru/";
?>