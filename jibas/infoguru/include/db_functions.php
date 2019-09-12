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
require_once("config.php");
require_once("errorhandler.php");

$mysqlconnection = NULL;

//Buka koneksi ke Database
function OpenDb() 
{
	global $db_host, $db_user, $db_pass, $db_name, $mysqlconnection;
	
	$mysqlconnection = @mysql_connect($db_host, $db_user, $db_pass);
	if (!$mysqlconnection)
	{
		HandleQueryError("Tidak dapat terhubung dengan server database JIBAS di $db_host", 
						 mysql_errno(), mysql_error(), false);
		exit();
	} 
	else 
	{
		$select = @mysql_select_db($db_name, $mysqlconnection);
		if (!$select)
		{
			HandleQueryError("Tidak dapat membuka database $db_name", 
							 mysql_errno(), mysql_error(), false);
			exit();
		}
				  
		mysql_query("SET lc_time_names = 'id_ID';");
		
		return $mysqlconnection;
	}
}	

function OpenDbi() 
{
	global $db_host, $db_user, $db_pass, $db_name, $conni;

	$conni = @mysqli_connect($db_host, $db_user, $db_pass) or trigger_error("Can not connect to database server", E_USER_ERROR);
	$select = @mysqli_select_db($conni, $db_name) or trigger_error("Can not open the database", E_USER_ERROR);
	
	return $conni;
}

//Buat query
function QueryDbi($sql) 
{
	$result = mysqli_query($sql) or trigger_error("Failed to execute sql query: $sql", E_USER_ERROR);
	
	return $result;
}

//Tutup koneksi
function CloseDb() 
{
	global $mysqlconnection;
	
	@mysql_close($mysqlconnection);
}

function HandleQueryError($sql, $errno, $errmsg, $issend)
{
	// Log Error
	LogError($sql, $errno, $errmsg);
	
	// Error Handler
	session_name("jbsinfoguru");
	session_start();	  	 
	
	$_SESSION['errtype'] = 1; //mysql
	$_SESSION['errfile'] = $_SERVER['SCRIPT_NAME'];			
	$_SESSION['errno'] = $errno;
	$_SESSION['errmsg'] = "Query: $sql<br>ErrNo: $errno<br>Error: $errmsg";
	$_SESSION['issend'] = $issend;
	
	trigger_error("exception", E_USER_ERROR);
}

//Buat query
function QueryDb($sql) 
{
	global $mysqlconnection;
	
	$result = @mysql_query($sql, $mysqlconnection);
	
	if (mysql_errno() > 0)
	{
		// Save Error Information
		$errmsg = mysql_error();
		$errno = mysql_errno();
		
		// Force Closing Database Connection
		CloseDb();
		
		// Handle Error
		HandleQueryError($sql, $errno, $errmsg, true);
		exit();
	}

	return $result;
}

function QueryDbTrans($sql, &$success) 
{
	global $mysqlconnection;
	
	$result = @mysql_query($sql, $mysqlconnection);
	$success = ($result && 1); 
	
	if (!$success)
	{
		// Save Error Information
		$errmsg = mysql_error();
		$errno = mysql_errno();
		
		// Force Rolling Back and Closing Database Connection
		RollbackTrans();
		CloseDb();
		
		// Handle Error
		HandleQueryError($sql, $errno, $errmsg, true);
		exit();
	}
	
	return $result;
}

function LogError($sql, $errno, $error)
{
	global $G_ENABLE_QUERY_ERROR_LOG;
	
	if (!$G_ENABLE_QUERY_ERROR_LOG)
		return;
		
	$logPath = @realpath(@dirname(__FILE__)) . "/../../log";
	$logExists = @file_exists($logPath) && @is_dir($logPath);
	if (!$logExists)
		@mkdir($logPath, 0740, true);
	
	$logFile = @realpath(@dirname(__FILE__)) . "/../../log/infoguru-error.log";
	$modeFile = (@file_exists($logFile) && @filesize($logFile) > 1024 * 1024) ? "w" : "a";
	
	$fp = @fopen($logFile, $modeFile);
	@fwrite($fp, "-- Query Error on " . date('d-M-Y H:i:s') . " --------\r\n");
	@fwrite($fp, " SCRIPT > " . $_SERVER['SCRIPT_NAME'] . "\r\n");
	@fwrite($fp, " QUERY  > $sql\r\n");
	@fwrite($fp, " ERRNO  > $errno\r\n");
	@fwrite($fp, " ERROR  > $error\r\n");
	@fwrite($fp, "\r\n");
	@fclose($fp);
}

function BeginTrans() 
{
	global $mysqlconnection;
	
	@mysql_query("SET AUTOCOMMIT=0", $mysqlconnection);
	@mysql_query("BEGIN", $mysqlconnection);
}

function CommitTrans() 
{
	global $mysqlconnection;
	
	@mysql_query("COMMIT", $mysqlconnection);
	@mysql_query("SET AUTOCOMMIT=1", $mysqlconnection);
}

function RollbackTrans() 
{
	global $mysqlconnection;
	
	@mysql_query("ROLLBACK", $mysqlconnection);
	@mysql_query("SET AUTOCOMMIT=1", $mysqlconnection);
}

function GetValue($tablename, $column, $where) 
{
	$sql = "SELECT $column FROM $tablename WHERE $where";
	$result_get_value = QueryDb($sql);
	$row_get_value = mysql_fetch_row($result_get_value);
	
	return $row_get_value[0];
}

function FetchSingle($sql)
{
	global $mysqlconnection;
	
	$res = QueryDb($sql);
	$row = @mysql_fetch_row($res);
	return $row[0];
}

function FetchRow($sql)
{
	global $mysqlconnection;
	
	$res = QueryDb($sql);
	$row = @mysql_fetch_row($res);
	return $row;
}

function QueryDbEx($sql)
{
	global $mysqlconnection;
		
    $result = @mysql_query($sql, $mysqlconnection);
	LogQuery($sql);
	
	if (mysql_errno() > 0)
	{
		LogIfError($sql);
		throw new DbException(mysql_error(), mysql_errno());
	}
		
    return $result;
}

function FetchSingleEx($sql)
{
	$res = QueryDbEx($sql);
	LogQuery($sql);
	LogIfError($sql);
	
	if (mysql_num_rows($res) > 0)
	{
		$row = mysql_fetch_row($res);
		return $row[0];
	}
	else
	{
		return NULL;
	}
}

function LogQuery($sql)
{
	global $G_ENABLE_QUERY_LOG, $G_FILE_LOG_QUERY;
	
	if (!$G_ENABLE_QUERY_LOG)
		return;
		
	$logPath = @realpath(@dirname(__FILE__)) . "/../../log";
	$logExists = @file_exists($logPath) && @is_dir($logPath);
	if (!$logExists)
		@mkdir($logPath, 0644);
	
	$logFile = @realpath(@dirname(__FILE__)) . "/../../log/" . $G_FILE_LOG_QUERY;
	$modeFile = (@file_exists($logFile) && @filesize($logFile) > 1024 * 1024) ? "w" : "a";
	
	$fp = @fopen($logFile, $modeFile);
	@fwrite($fp, "-- Query Executed on " . date('d-M-Y H:i:s') . " --------\r\n");
	@fwrite($fp, " SCRIPT > " . $_SERVER['SCRIPT_NAME'] . "\r\n");
	@fwrite($fp, " QUERY  > $sql\r\n");
	@fwrite($fp, "\r\n");
	@fclose($fp);
}

?>