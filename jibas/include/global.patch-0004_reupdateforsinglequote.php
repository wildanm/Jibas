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
function CreateReUpdateScheduler($relPath)
{
	if (!file_exists("$relPath/include/global.patch-0004.done"))
   {
       require_once("$relPath/include/mainconfig.php");
	   require_once("$relPath/include/db_functions.php");
	   OpenDb();
	   QueryDb("DELETE FROM `jbsclient`.`liveupdate` WHERE liveupdateid>182");
	   CloseDb();
       CreateDoneFile004($relPath);
   }
	
	
}


function CreateDoneFile004($relPath)
{
    $fDone = "$relPath/include/global.patch-0004.done";
    if (!file_exists($fDone))
    {
        if ($fp = @fopen($fDone, "w"))
        {
            @fwrite($fp, ".");
            @fclose($fp);
        }
    }
}



?>