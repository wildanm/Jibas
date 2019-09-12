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
$sql = "SELECT DISTINCT t.idtabungan, dt.nama
          FROM jbsfina.tabungan t, jbsfina.datatabungan dt
         WHERE t.idtabungan = dt.replid
           AND dt.departemen = '$departemen'
           AND t.tanggal BETWEEN '$datetime1' AND '$datetime2'";
if ($petugas != "ALL")
    $sql .= " AND t.petugas = '$petugas'";
    
$res = QueryDb($sql);
while($row = mysql_fetch_row($res))
{
    $lsTab[] = array($row[0], $row[1]);   
}

if (count($lsTab) == 0)
{
    echo "<br><br><i>Belum ada transaksi Tabungan</i>";  
}
else
{
?>
<table cellpadding="5" border="1" style="border-width:1px; border-color:#999; border-collapse:collapse;" cellspacing="0" align="center">
<tr height="30" align="center" class="header">
	<td width="30">No</td>
    <td width="200">Tabungan</td>
    <td width="140">Jumlah Setoran</td>
    <td width="140">Jumlah Tarikan</td>
    <td width="140">Jumlah Saldo</td>
</tr>
<?
$totsetor = 0;
$tottarik = 0;
$totsaldo = 0;
for($i = 0; $i < count($lsTab); $i++)
{
    $no = $i + 1;    
    $idTab = $lsTab[$i][0];
    $nmTab = $lsTab[$i][1];
    
    $jumsetor = 0;
    $jumtarik = 0;
    $jumsaldo = 0;
    $sql = "SELECT SUM(debet), SUM(kredit)
              FROM jbsfina.tabungan 
             WHERE idtabungan = '$idTab'
               AND tanggal BETWEEN '$datetime1' AND '$datetime2' ";
    if ($petugas != "ALL")
        $sql .= " AND petugas = '$petugas'";
 
    $res = QueryDb($sql);
    if($row = mysql_fetch_row($res))
    {
        $jumtarik = $row[0];
        $jumsetor = $row[1];
        $jumsaldo = $jumsetor - $jumtarik;
    }
    
    $totsetor += $jumsetor;
    $tottarik += $jumtarik;
    $totsaldo += $jumsaldo;
?>
    <tr height='40'>
        <td align='center'><?=$no?></td>
        <td align='left'><?=$nmTab?></td>
        <td align='right' style='background-color:#E0F3FF'>
            <a style='color: blue; font-weight: normal; text-decoration: underline'
               href="JavaScript:ShowDetail('<?=$departemen?>', '<?=$idTab?>', '<?=$datetime1?>', '<?=$datetime2?>', '<?=$petugas?>', 'SETORAN')">
                <strong><?=FormatRupiah($jumsetor)?></strong>
            </a>
        </td>
        <td align='right' style='background-color:#F2E9C6'>
            <a style='color: blue; font-weight: normal; text-decoration: underline'
               href="JavaScript:ShowDetail('<?=$departemen?>', '<?=$idTab?>', '<?=$datetime1?>', '<?=$datetime2?>', '<?=$petugas?>', 'TARIKAN')">
                <strong><?=FormatRupiah($jumtarik)?></strong>
            </a>
        </td>
        <td align='right' style='background-color:#DBF4C1'><strong><?=FormatRupiah($jumsaldo)?></strong></td>
    </tr>
<?
}
?>
<tr height='40'>
    <td align='center' colspan='2' bgcolor="#999"><font color="#FFF"><strong>T O T A L</strong></font></td>
    <td align='right' style='background-color:#E0F3FF'><strong><?=FormatRupiah($totsetor)?></strong></td>
    <td align='right' style='background-color:#F2E9C6'><strong><?=FormatRupiah($tottarik)?></strong></td>
    <td align='right' style='background-color:#DBF4C1'><strong><?=FormatRupiah($totsaldo)?></strong></td>
</tr>
</table>
<?
}
?>