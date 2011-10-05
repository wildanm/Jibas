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
session_name("jbskeu");
session_start();

function getUserName() 
{
	return $_SESSION['namakeuangan'];
}

function getUserTheme() 
{
	return $_SESSION['temakeuangan'];
}

function getLevel() 
{
	return $_SESSION['tingkatkeuangan'];
}

function getAccess() 
{
	if ($_SESSION['tingkatkeuangan'] == 2)
		return $_SESSION['departemenkeuangan'];
	else 
		return "ALL";
}

function getIdUser() 
{
	return $_SESSION['login'];
}

function SI_USER_ID() 
{
	return $_SESSION['login'];
}

?>