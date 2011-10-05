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
class CK{
	var $nis, $db_name_fina;
	function get_student_finance(){
		$nis = $this -> nis;
		$db_name_fina = $this -> db_name_fina;
		$sql = 	"SELECT d.departemen AS departemen FROM departemen d, kelas k, siswa s, tingkat ti, tahunajaran ta WHERE ".
				"s.nis='$nis' AND s.idkelas=k.replid AND k.idtahunajaran=ta.replid AND ".
				"k.idtingkat=ti.replid AND ti.departemen=d.departemen AND ta.departemen=d.departemen";
		$result=QueryDb($sql);
		$row=@mysql_fetch_array($result);
		$departemen=$row[departemen];
		//echo "Dep=".$departemen;
		if ($departemen=="")
			exit;
		
		$sql =	"SELECT count(*) FROM $db_name_fina.besarjtt b, $db_name_fina.penerimaanjtt p WHERE p.idbesarjtt = b.replid AND b.nis='$nis'";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$nwajib = $row[0];
		
		$sql = "SELECT count(*) FROM $db_name_fina.penerimaaniuran WHERE nis='$nis'"; 
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$niuran = $row[0];
		
		
		$sql =	"SELECT s.nama, k.kelas FROM siswa s, kelas k WHERE s.nis = '$nis' AND s.idkelas = k.replid ";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$namasiswa = $row[0];
		$kelas = $row[1];
		?>
<link href="../style/style.css" rel="stylesheet" type="text/css">

		<br />
		<? if (($nwajib + $niuran) >  0) {
			//CloseDb();
			//echo "<br><br><br><br><br><center><i>Tidak ada data pembayaran siswa tersebut di rentang tanggal terpilih</i></center>";
			//exit();
		?>
        <form name="panelkeuangan"><input type="hidden" name="nis" id="nis" value="<?=$nis?>" /></form>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
		<tr>
			<td valign="top" background="" style="background-repeat:no-repeat; background-attachment:fixed">
            <div align="right"><a href="javascript:cetak(2)"><img src="../img/print.png" border="0" />&nbsp;Cetak</a></div>
			<table class="tab" id="table" border="1"  width="100%" align="center">
		   
		<?
		$sql =	"SELECT DISTINCT b.replid, b.besar, b.lunas, b.keterangan, d.nama FROM $db_name_fina.besarjtt b, $db_name_fina.penerimaanjtt p, $db_name_fina.datapenerimaan d WHERE p.idbesarjtt = b.replid AND b.idpenerimaan = d.replid AND b.nis='$nis' ORDER BY nama";
		
		$result = QueryDb($sql);
		while ($row = mysql_fetch_array($result)) {
			$idbesarjtt = $row['replid'];
			$namapenerimaan = $row['nama']; 
			$besar = $row['besar'];
			$lunas = $row['lunas'];
			$keterangan = $row['keterangan'];
			
			$sql = "SELECT SUM(jumlah) FROM $db_name_fina.penerimaanjtt WHERE idbesarjtt = $idbesarjtt";
			$result2 = QueryDb($sql);
			$pembayaran = 0;
			if (mysql_num_rows($result2)) {
				$row2 = mysql_fetch_row($result2);
				$pembayaran = $row2[0];
			};
			$sisa = $besar - $pembayaran;
			
			$sql = "SELECT jumlah, DATE_FORMAT(tanggal, '%d-%b-%Y') AS ftanggal FROM $db_name_fina.penerimaanjtt WHERE idbesarjtt=$idbesarjtt ORDER BY tanggal DESC LIMIT 1";
			
			$result2 = QueryDb($sql);
			$byrakhir = 0;
			$tglakhir = "";
			if (mysql_num_rows($result2)) {
				$row2 = mysql_fetch_row($result2);
				$byrakhir = $row2[0];
				$tglakhir = $row2[1];
			};	?>
		   
			<tr height="35">
				<td colspan="4" bgcolor="#99CC00" class="header"><font size="2"><strong><em><?=$namapenerimaan?></em></strong></font></td>
			</tr>    
			<tr height="25">
				<td width="20%" bgcolor="#CCFF66"><strong>Total Bayaran</strong> </td>
				<td width="15%" bgcolor="#FFFFFF" align="right"><?=FormatRupiah($besar) ?></td>
				<td width="22%" bgcolor="#CCFF66" align="center"><strong>Pembayaran Terakhir</strong></td>
				<td width="43%" bgcolor="#CCFF66" align="center"><strong>Keterangan</strong></td>
			</tr>
			<tr height="25">
				<td bgcolor="#CCFF66"><strong>Jumlah Pembayaran</strong> </td>
				<td bgcolor="#FFFFFF" align="right"><?=FormatRupiah($pembayaran) ?></td>
				<td bgcolor="#FFFFFF" align="center" valign="top" rowspan="2"><?=FormatRupiah($byrakhir) . "<br><i>" . $tglakhir . "</i>" ?> </td>
				<td bgcolor="#FFFFFF" align="left" valign="top" rowspan="2"><?=$keterangan ?></td>
			</tr>
			<tr height="25">
				<td bgcolor="#CCFF66"><strong>Sisa Bayaran</strong> </td>
				<td bgcolor="#FFFFFF" align="right"><?=FormatRupiah($sisa) ?></td>
			</tr>
			<tr height="3">
				<td colspan="4" bgcolor="#E8E8E8">&nbsp;</td>
			</tr>
		<? 
		} //while iuran wajib
		
		$sql =	"SELECT DISTINCT p.idpenerimaan, d.nama FROM $db_name_fina.penerimaaniuran p, $db_name_fina.datapenerimaan d WHERE p.idpenerimaan = d.replid AND p.nis='$nis' ".
				"ORDER BY nama";
		$result = QueryDb($sql);
		while ($row = mysql_fetch_array($result)) {
			$idpenerimaan = $row['idpenerimaan'];
			$namapenerimaan = $row['nama'];
			
			$sql = "SELECT SUM(jumlah) FROM $db_name_fina.penerimaaniuran WHERE idpenerimaan=$idpenerimaan AND nis='$nis'";
			$result2 = QueryDb($sql);
			$pembayaran = 0;
			if (mysql_num_rows($result2)) {
				$row2 = mysql_fetch_row($result2);
				$pembayaran = $row2[0];
			};
		
			$sql = "SELECT jumlah, DATE_FORMAT(tanggal, '%d-%b-%Y') AS ftanggal FROM $db_name_fina.penerimaaniuran WHERE idpenerimaan=$idpenerimaan AND nis='$nis' ORDER BY tanggal DESC LIMIT 1";
			$result2 = QueryDb($sql);
			$byrakhir = 0;
			$tglakhir = "";
			if (mysql_num_rows($result2)) {
				$row2 = mysql_fetch_row($result2);
				$byrakhir = $row2[0];
				$tglakhir = $row2[1];
			};	
		?>
			<tr height="35">
				<td colspan="4" bgcolor="#99CC00" class="header"><font size="2"><strong><em><?=$namapenerimaan?></em></strong></font></td>
			</tr>  
			<tr height="25">
				<td width="22%" bgcolor="#CCFF66" align="center"><strong>Total Pembayaran</strong> </td>
				<td width="22%" bgcolor="#CCFF66" align="center"><strong>Pembayaran Terakhir</strong></td>
				<td width="50%" colspan="2" bgcolor="#CCFF66" align="center"><strong>Keterangan</strong></td>
			</tr>
			<tr height="25">
				<td bgcolor="#FFFFFF" align="center"><?=FormatRupiah($pembayaran) ?></td>
				<td bgcolor="#FFFFFF" align="center"><?=FormatRupiah($byrakhir) . "<br><i>" . $tglakhir . "</i>" ?></td>
				<td colspan="2" bgcolor="#FFFFFF" align="left">&nbsp;</td>
			</tr>
			<tr height="3">
				<td colspan="4" bgcolor="#E8E8E8">&nbsp;</td>
			</tr>
		<?
		} //while iuran sukarela
		?>
			</table>
    <?	} else { ?>
				<td></td>
			</tr>
			</table>
			<table width="100%" border="0" align="center">          
			<tr>
				<td align="center" valign="middle" height="250">    
					<font size = "2" color ="red"><b>Tidak ditemukan adanya data.         
					</font>
				</td>
			</tr>
			</table>  
		<? } ?>    
			</tr>
		</td>
		</table>
        <?
			}
}
?>