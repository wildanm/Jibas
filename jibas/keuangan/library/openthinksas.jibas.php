<?php
function getDepartemenInOpenThinkSAS($departemen="") {
	$sql = "SELECT keterangan FROM jbsakad.departemen WHERE departemen='{$departemen}'";
	
	$result = FetchSingle($sql);
	
	return $result;
}
?>