<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script>
function pageScroll() {
    window.scrollBy(0,1500);
}

</script>
<style>
	#result{background-color:#000000;color:#fff;font-family:'Courier new';font-size:11px;padding:5px;text-align:left;}
</style>
<link href="style/style.css" rel="stylesheet" type="text/css" />
</head>

<body onload="pageScroll()">
<?php
require_once("include/config.php");
$jibasDbList = array("jbsakad","jbsfina","jbsperpus","jbssdm","jbssms","jbsumum","jbsuser","jbsvcr");
//$jibasDbList = array("jbsakad");
$dbh = explode(":",$db_host);
$dbHost = (isset($_REQUEST['dbHost']))?trim($_REQUEST['dbHost']):"$dbh[0]";
$dbUser = (isset($_REQUEST['dbUser']))?trim($_REQUEST['dbUser']):"$db_user";
$dbPass = (isset($_REQUEST['dbPass']))?trim($_REQUEST['dbPass']):"";
$dbPort = (isset($_REQUEST['dbPort']))?trim($_REQUEST['dbPort']):"$dbh[1]";
?>
<form method="post">
<div style="background-color:#FFFFFF; color:#000">
<label>Database server : <br /><input type="text" name="dbHost" value="<?php echo $dbHost ?>" readonly="readonly" /></label><br />
<label>Database port : <br /><input type="text" name="dbPort" value="<?php echo $dbPort ?>" readonly="readonly" /></label><br />
<label>Database user : <br /><input type="text" name="dbUser" value="<?php echo $dbUser ?>" readonly="readonly"/></label><br />
<label>Database password : <br /><input type="password" name="dbPass"/></label><br />
<input type="submit" value="Login" name="masuk" />
</div>
</form>
<div id="result">
<?php
if (isset($_REQUEST['masuk'])){
	$cnt = 0;
	$defMaxExecTime = ini_get('max_execution_time');
	$conn = @mysql_connect($dbHost.":".$dbPort,$dbUser,$dbPass) or die("Cannot connect to database server $dbHost on port $dbPort");
	echo "<font size='+1'>";
	if ($defMaxExecTime<7200){
		ini_set('max_execution_time', 7200);
		echo 'max_execution_time has been changed to = ' . ini_get('max_execution_time') . " second(s) to avoid max_execution_time limits<br>";
	}
	
	$resFKOff = @mysql_query("SET FOREIGN_KEY_CHECKS = 0") or die("Failed to deactivate Foreign Key Checks");
	if ($resFKOff)
		echo "Foreign Key Checks has been deactivated<br>";
	echo "</font>";
	echo "<ol>";
	$sql  = "SHOW DATABASES;";
	$res  = @mysql_query($sql) or die("Failed to execute SQL");
	while ($row = @mysql_fetch_row($res)){
		if (in_array($row[0],$jibasDbList)){
			@mysql_query("USE `$row[0]`");
			$sqlTab = "SHOW TABLES;";
			$resTab = @mysql_query($sqlTab) or die("Failed to execute SQL : <br>$sqlTab");
			while ($rowTab = @mysql_fetch_row($resTab)){
				$sqlDesc = "DESC `$rowTab[0]`";
				$resDesc = @mysql_query($sqlDesc) or die("Failed to execute SQL : <br>$sqlDesc");
				$fieldList = array();
				$priKey = "";
				while ($rowDesc = @mysql_fetch_row($resDesc)){
					if (strtolower($rowDesc[3])=='pri' && $priKey="")
						$priKey = $rowDesc[0];	
					if (stripos(strtolower($rowDesc[1]), 'blob')===false)
						array_push($fieldList,$rowDesc[0]);
					
				}
				
				if ($priKey==""){
					if (in_array('replid',$fieldList)){
							$priKey = "replid";
					} else {
						$sqlDesc = "DESC `$rowTab[0]`";
						$resDesc = @mysql_query($sqlDesc) or die("Failed to execute SQL : <br>$sqlDesc");
						while ($rowDesc = @mysql_fetch_row($resDesc)){
							if ($rowDesc[5]=='auto_increment'){
								$priKey  = $rowDesc[0];
								break;
							}
						}
						if ($priKey==""){
							$sqlDesc = "DESC `$rowTab[0]`";
							$resDesc = @mysql_query($sqlDesc) or die("Failed to execute SQL : <br>$sqlDesc");
							$rowDesc = @mysql_fetch_row($resDesc);
							$priKey  = $rowDesc[0];
						}
							
					}
				}
				$sqlPri = "SELECT `$priKey` FROM `$rowTab[0]`";
				$resPri = @mysql_query($sqlPri) or die("Failed to execute SQL : <br>$sqlPri");
				while ($rowPri = @mysql_fetch_row($resPri)){
					$sqlCtn = "SELECT `".implode("`,`",$fieldList)."` FROM `$rowTab[0]` WHERE `$priKey`='$rowPri[0]' ; ";
					$resCtn = @mysql_query($sqlCtn) or die("Failed to execute SQL : <br>$sqlCtn");
					
					while ($rowCtn = @mysql_fetch_row($resCtn)){
						$updValue = array();
						$i = 0;
						foreach($rowCtn as $rowCtn2){
							array_push($updValue,"`$fieldList[$i]`='".CQ($rowCtn2)."'");
							$i++;
						}
						$sqlUpd = "UPDATE `$rowTab[0]` SET ".implode(",",$updValue)." WHERE `$priKey`='".addslashes($rowPri[0])."'";

						$resUpd = @mysql_query($sqlUpd) or die("<font color='#ffb6b6'>$sqlUpd : <b>GAGAL</b></font><br>");
						if ($resUpd){
							$cnt++;
							echo "<li><font color='#9bff5f'>$sqlUpd : sukses</font></li>";
							echo "<script>";
							echo "pageScroll();";
							echo "</script>";
						}
					}
				}
			}
		}
	}
	
	$resFKOn = @mysql_query("SET FOREIGN_KEY_CHECKS = 1") or die("Failed to activate Foreign Key Checks");
	if ($resFKOn)
		echo "Foreign Key Checks has been activated<br>";
	echo "</ol>";
	echo "<font size='+1'>";
	echo "$cnt query has been execute sucessfull<br>";
	if ($defMaxExecTime<7200){
		ini_set('max_execution_time', $defMaxExecTime);
		echo 'max_execution_time has been returned to = ' . ini_get('max_execution_time') . " second(s) (it's default value)<br>";
	}
	echo "</font>";
} else {
	echo "<font size='0' color='#9bff5f'>Fitur ini akan memperbaiki data-data yang telah tersimpan di Database JIBAS, akan mengganti penggunaan Single Quote dan Double Quote dengan Back Single Quote</font>";
}

function CQ($string){
	$string = trim($string);
	$string = str_replace("\'","`",$string);
	$string = str_replace('\"','`',$string);
	$string = str_replace("'","`",$string);
	$string = str_replace('"','`',$string);
	return $string;
}
?>
</div>
</body>
</html>