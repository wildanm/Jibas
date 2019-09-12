<?
/**[N]**
 * JIBAS Education Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 18.0 (August 01, 2019)
 * @notes: JIBAS Education Community will be managed by Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
 * 
 * Copyright (C) 2009 Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
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
require_once("../include/config.php");
require_once("../include/common.php");
require_once("../include/compatibility.php");
require_once("../include/db_functions.php");
require_once("galeri.list.func.php");
require_once("galeri.list.config.php");
require_once("infosekolah.common.func.php");

$op = $_REQUEST['op'];
if ($op == "getlist")
{
    $dept = $_REQUEST['dept'];
    $start = $_REQUEST['start'];
    
    OpenDb();
   
    ShowGalleryList($dept, $start, $RowPerPage);
    
    CloseDb();
}
elseif ($op == "refreshlist")
{
    $dept = $_REQUEST['dept'];
    $currrow = $_REQUEST['currrow'];
    
    OpenDb();
   
    ShowGalleryList($dept, 0, $currrow);
    
    CloseDb();
}