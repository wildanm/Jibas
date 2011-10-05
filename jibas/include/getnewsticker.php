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
<?php
	require_once('httprequest.php');

	$content = http_request("GET", "jibas.net", 80, "/content/newsticker/newsticker.php?id=$_REQUEST[id]&type=$_REQUEST[type]");
    //echo $content;
    $pos1 = strpos($content, "[", 0);
    if ($pos1 !== FALSE)
    {
        $pos2 = strpos($content, "]", $pos1);
        if ($pos2 !== FALSE)
        {
            $response = substr($content, $pos1 + 1, $pos2 - $pos1 - 1);
            $header = substr($response, 0, 3);
            
            if ($header == "400")
            {
				$n	= substr($response, 3);
				$n = explode("|",$n);
				$content = '{"status":"1","id":"'.trim($n[1]).'","type":"'.trim($n[2]).'","news":"'.str_replace("\r\n"," ",trim($n[0])).'"}';
            }
            else
            {
				$content = '{"status":"0","id":"-1","type":"0","news":"Tidak terhubung dengan JIBAS News"}';
            }
        }
    }
    else
    {
		$content = '{"status":"0","id":"-1","type":"0","news":"Tidak  terhubung dengan JIBAS News"}';
    }
   
    echo $content;
?>