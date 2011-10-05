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
function AddSystemConfig($relPath)
{
	if (!file_exists("$relPath/include/global.patch-0003.done"))
   {
       $license = "<? \r\n/**[N]** \r\n * JIBAS Road To Community \r\n * Jaringan Informasi Bersama Antar Sekolah \r\n *  \r\n * @version: 2.5.0 (Juni 20, 2011) \r\n * @notes: JIBAS Education Community will be managed by Yayasan Indonesia Membaca (http://www.indonesiamembaca.net) \r\n *  \r\n * Copyright (C) 2009 PT.Galileo Mitra Solusitama (http://www.galileoms.com) \r\n *  \r\n * This program is free software: you can redistribute it and/or modify \r\n * it under the terms of the GNU General Public License as published by \r\n * the Free Software Foundation, either version 3 of the License, or \r\n * (at your option) any later version. \r\n *  \r\n * This program is distributed in the hope that it will be useful, \r\n * but WITHOUT ANY WARRANTY; without even the implied warranty of \r\n * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the \r\n * GNU General Public License for more details. \r\n *  \r\n * You should have received a copy of the GNU General Public License \r\n **[N]**/ ?>\r\n";
	   RewriteMainConfig003($license, $relPath);
       CreateDoneFile003($relPath);
   }
	
	
}


function CreateDoneFile003($relPath)
{
    $fDone = "$relPath/include/global.patch-0003.done";
    if (!file_exists($fDone))
    {
        if ($fp = @fopen($fDone, "w"))
        {
            @fwrite($fp, ".");
            @fclose($fp);
        }
    }
}


function RewriteMainConfig003($license, $relPath)
{
	$fHandle = fopen("$relPath/include/mainconfig.php", "w");
	fwrite($fHandle, $license);
	fwrite($fHandle, "<?\r\n\r\n");
	fwrite($fHandle, "require_once('database.config.php');\r\n");
	fwrite($fHandle, "require_once('version.config.php');\r\n");
	fwrite($fHandle, "require_once('application.config.php');\r\n");
	fwrite($fHandle, "require_once('system.config.php');\r\n");
	fwrite($fHandle, "\r\n?>");
	fclose($fHandle);
}
?>