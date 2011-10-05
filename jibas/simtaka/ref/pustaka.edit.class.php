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
class CPustakaEdit{
	var $rak, $replid, $keterangan;
	function OnStart(){
		global $db_name_umum;
		if (isset($_REQUEST[simpan])){
			$sql = "SELECT nama FROM perpustakaan WHERE nama='$_REQUEST[nama]' AND replid <> $_REQUEST[replid]";
			$result = QueryDb($sql);
			$num = @mysql_num_rows($result);
			if ($num>0){
				$this->exist();
			} else {
				$sql = "UPDATE $db_name_umum.identitas SET perpustakaan='$_REQUEST[nama]' WHERE departemen='$_REQUEST[dep]'";
				$result = QueryDb($sql);
				$sql = "UPDATE perpustakaan SET nama='$_REQUEST[nama]', keterangan='$_REQUEST[keterangan]' WHERE replid=$_REQUEST[replid]";
				$result = QueryDb($sql);
				if ($result)
					$this->success();
			}
		} else {
			$sql = "SELECT * FROM perpustakaan WHERE replid=$_REQUEST[id]";
			$result = QueryDb($sql);
			$row = @mysql_fetch_array($result);
			$this->replid = $_REQUEST[id];
			$this->nama = $row[nama];
			$this->keterangan = $row[keterangan];

			$sql = "SELECT perpustakaan FROM $db_name_umum.identitas WHERE perpustakaan='$this->nama'";
			$result = QueryDb($sql);
			$row = @mysql_fetch_array($result);
			$this->dep = $row[perpustakaan];
		}
	}
	function exist(){
		?>
        <script language="javascript">
			alert('Perpustakaan sudah digunakan!');
			document.location.href="pustaka.edit.php?id=<?=$_REQUEST[replid]?>";
		</script>
        <?
	}
	function success(){
		?>
        <script language="javascript">
			parent.opener.getfresh();
			window.close();
        </script>
        <?
	}
	function edit(){
		global $db_name_akad;
		?>
        <form name="editpustaka" onSubmit="return validate()">
        <input name="replid" type="hidden" id="replid" value="<?=$this->replid?>">
		<table width="100%" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td colspan="2" align="left">
            	<font style="color:#FF9900; font-size:30px;"><strong>.:</strong></font>
        		<font style="font-size:18px; color:#999999">Ubah Perpustakaan</font>            </td>
  		  </tr>
          <tr>
            <td>&nbsp;<strong>Departemen</strong></td>
            <td>
            <select id="dep" name="dep" class="cmbfrm2">
            	<?
				$sql = "SELECT departemen FROM $db_name_akad.departemen ORDER BY urutan ASC";
				$res = QueryDb($sql);
				while ($row = @mysql_fetch_row($res)){
					echo "<option value='".$row[0]."' ";
					if ($this->dep==$row[0])
						echo "Selected";	
					echo ">".$row[0]."</option>";
				}
				?>
            </select>
            </td>
          </tr>
		  <tr>
            <td width="6%">&nbsp;<strong>Nama</strong></td>
            <td width="94%"><input name="nama" type="text" class="inputtxt" id="nama" value="<?=$this->nama?>"></td>
          </tr>
          <tr>
            <td>&nbsp;Keterangan</td>
            <td><textarea name="keterangan" cols="45" rows="5" class="areatxt" id="keterangan"><?=$this->keterangan?></textarea></td>
          </tr>
          <tr>
            <td colspan="2" align="center"><input type="submit" class="cmbfrm2" name="simpan" value="Simpan" >&nbsp;<input type="button" class="cmbfrm2" name="batal" value="Batal" onClick="window.close()" ></td>
          </tr>
        </table>
		</form>
		<?
	}
}
?>