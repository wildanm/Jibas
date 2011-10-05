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
require_once('include/common.php');
require_once('include/config.php');
require_once('include/db_functions.php');

$tanggal = $_REQUEST['tanggal'];
?>
<center>
<table border="0" width="350" cellpadding="2" cellspacing="1">
<tr>
	<td width="10" align="center" style="background-color:#111111; color:#FFFFFF; font-weight:bold">No</td>
    <td width="100" align="center" style="background-color:#111111; color:#FFFFFF; font-weight:bold">Tempat/Jam</td>
    <td width="120" align="center" style="background-color:#111111; color:#FFFFFF; font-weight:bold">Penghulu</td>
    <td width="120" align="center" style="background-color:#111111; color:#FFFFFF; font-weight:bold">Pasangan</td>
</tr>
<? 	OpenDb();
	$sql = "SELECT j.replid,jam,penghulu,nama,pasangan,tempat,keterangan FROM jadwal j, penghulu p WHERE j.penghulu = p.nip AND tanggal='$tanggal' ORDER BY jam ASC";    
	$result = QueryDB($sql);
	$cnt = 0;
	while ($row = mysql_fetch_array($result)) { ?>
    <tr style="line-height:12px">
    	<td align="center" style="background-color:#F4F4F4; font-size:9px;"><?=++$cnt ?></td>
        <td align="center" style="background-color:#F4F4F4; font-size:9px;"><?=$row['tempat'] . "<br>" . $row['jam'] ?></td>
        <td style="background-color:#F4F4F4; font-size:9px;"><?=$row['penghulu'] . " " . $row['nama'] ?></td>
        <td style="background-color:#F4F4F4; font-size:9px;"><?=$row['pasangan'] ?></td>
    </tr>
<?	} 
	CloseDb(); ?>	
	
    
    <!-- END TABLE CONTENT -->
    </table>
</table>
</center>