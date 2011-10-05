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
class CInfo{
	var $nis;
	var $nama;
	function get_info_js(){
		?>
        <script language="javascript" src="info.js"></script>
        <script src="../script/ajax.js" type="text/javascript"></script>
		<script src="../script/SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
		<link href="../script/SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css"><!---->
        <?
	}
	function get_name($nis){
		$sql = "SELECT nama FROM siswa WHERE nis = '$nis'";
		$result = QueryDb($sql);
		$row = @mysql_fetch_array($result);
		echo $row[nama];
	}
	function get_info_tabs(){
		$nis = $this->nis ;
		$nama = $this->nama ;
		
		?>
        <link href="../style/style.css" rel="stylesheet" type="text/css">
		
        <span class="err"><?=$nis?></span> <span class="news_title1"><?=$this->get_name($nis)?></span>
		<div id="TabbedPanels2" class="TabbedPanels">
          <ul class="TabbedPanelsTabGroup">
            <li class="TabbedPanelsTab" tabindex="0">Data Pribadi</li>
            <li class="TabbedPanelsTab" tabindex="1">Keuangan</li>
            <li class="TabbedPanelsTab" tabindex="2">Presensi Harian</li>
            <li class="TabbedPanelsTab" tabindex="3">Presensi Pelajaran</li>
            <li class="TabbedPanelsTab" tabindex="4">Nilai</li>
            <li class="TabbedPanelsTab" tabindex="5">Rapor</li>
            <li class="TabbedPanelsTab" tabindex="6">Perpustakaan</li>
          </ul>
          <div class="TabbedPanelsContentGroup">
            <div class="TabbedPanelsContent" id="datapribadi"></div>
            <div class="TabbedPanelsContent" id="keuangan"></div>
            <div class="TabbedPanelsContent" id="ph"></div>
            <div class="TabbedPanelsContent" id="pp"></div>
            <div class="TabbedPanelsContent" id="nilai"></div>
            <div class="TabbedPanelsContent" id="rapor"></div>
            <div class="TabbedPanelsContent" id="perpus"></div>
          </div>
        </div>
		<?
		$this -> get_info_js();
        ?>
		<script type="text/javascript">
		<!--
        var TabbedPanels2 = new Spry.Widget.TabbedPanels("TabbedPanels2");

        getInfoTabContent('<?=$nis?>');
		//-->
        </script>
        <?
	}
}
?>