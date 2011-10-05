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
function CreateHtaccess($relPath)
{
   if (!file_exists("$relPath/include/global.patch-0002.done"))
   {
       ApplyCreateHtaccess();
       CreateDoneFile($relPath);
   }
}
 
function ApplyCreateHtaccess()
{
   $docRoot = $_SERVER['DOCUMENT_ROOT'];
   $scriptName = $_SERVER['SCRIPT_NAME'];
   
   $pos = strpos($scriptName, "/", 1); 
   if ($pos !== FALSE)
   {
       $rootDir = $docRoot . substr($scriptName, 0, $pos);
       TraverseDir($rootDir);
   }
}

function CreateDoneFile($relPath)
{
    $fDone = "$relPath/include/global.patch-0002.done";
    if (!file_exists($fDone))
    {
        if ($fp = @fopen($fDone, "w"))
        {
            @fwrite($fp, ".");
            @fclose($fp);
        }
    }
}
 
function TraverseDir($dirPath)
{
	$fhtaccess = $dirPath . "/.htaccess";
	if (!file_exists($fhtaccess))
	{
		if ($fp = @fopen($fhtaccess, "w"))
		{
			@fwrite($fp, "Options -Indexes\r\n");
			@fclose($fp);
		}
	}

	if ($handle = @opendir($dirPath))
	{
		$ndir = 0;
		$dir_arr = array();
		while (false !== ($file = @readdir($handle))) 
		{
			$full = $dirPath . "/" . $file;
			if (@is_dir($full))
			{
				if ($file != "." && $file != "..")
				{
					$dir_arr[$ndir] = $full;
					$ndir++;
				}
			}
    	}
		@closedir($handle);	
		
		for($i = 0; $i < $ndir; $i++)
		{
			$dir = $dir_arr[$i];
			TraverseDir($dir);
		}
	}
}
?>