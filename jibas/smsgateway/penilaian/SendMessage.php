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
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../include/common.php');
OpenDb();
//echo "<pre>";
//print_r($_REQUEST);
//echo "</pre>";
/*
   [op] => SavePenilaian
    [Type] => 1
    [Dep] => SMA
    [Kls] => -1
    [IDPel] => 35
    [IDUjian] => 89
    [NumData] => 9
    [Date1] => 2007-1-1
    [Date2] => 2007-1-1
    [Sender] => GMS
    [KeSiswa] => 1
    [SendDate] => 2007-1-1 15:15:00

	
*/
$op	= $_REQUEST['op'];

$Type		= $_REQUEST['Type'];
$Dep		= $_REQUEST['Dep'];
$Kls		= $_REQUEST['Kls'];
$NIS		= $_REQUEST['NIS'];
$IDPel		= $_REQUEST['IDPel'];
$IDUjian	= $_REQUEST['IDUjian'];
$NumData	= $_REQUEST['NumData'];
$Date1		= $_REQUEST['Date1'];
$Date2		= $_REQUEST['Date2'];
$Sender		= CQ($_REQUEST['Sender']);
$KeSiswa	= $_REQUEST['KeSiswa'];
if ($KeSiswa=="")
	$KeSiswa = 0;
$KeOrtu		= $_REQUEST['KeOrtu'];
if ($KeOrtu=="")
	$KeOrtu = 0;
$SendDate	= $_REQUEST['SendDate'];

if ($op=='SavePenilaian'){
	if ($Type=='0'){
		$NIS = $NIS;	
	} else {
		if ($Kls=='-1'){
			$sql =  "SELECT s.nis FROM $db_name_akad.siswa s, $db_name_akad.kelas k, $db_name_akad.tingkat ti, $db_name_akad.tahunajaran ta ".
					"WHERE ta.departemen='$Dep' AND ti.departemen='$Dep' AND ta.replid=k.idtahunajaran AND ti.replid=k.idtingkat AND ".
					"s.idkelas=k.replid AND s.aktif=1";
		} else {
			$sql =  "SELECT nis FROM $db_name_akad.siswa WHERE idkelas='$Kls' AND aktif=1";
		}
		$res = QueryDb($sql);
		$NIS = "";
		while ($row = @mysql_fetch_row($res)){
			if ($NIS == "")
				$NIS = $row[0];
			else
				$NIS = $NIS.','.$row[0];
		}
	}
	
	$smsgeninfo = "";
	$x = split(' ',$SendDate);
	$dt = split('-',$x[0]);
	$smsgeninfo .= $dt[2].'-'.$SMonth[$dt[1]-1].'-'.$dt[0]."<br>";
	if ($Type=='0'){
		$smsgeninfo .= "NIS : ".$NIS;
	} else {
		$smsgeninfo .= "Dept : ".$Dep.", Kelas : ";
		if ($Kls=='-1'){
			$smsgeninfo .= "All";
		} else {
			$sql = "SELECT kelas FROM $db_name_akad.kelas WHERE replid='$Kls'";
			$res = QueryDb($sql);
			$row = @mysql_fetch_row($res);
			$smsgeninfo .= $row[0];
		}
	}
	
	if ($IDPel=='-1'){
		$smsgeninfo .= ", Penilaian : All";
	} else {
		$sql = "SELECT nama FROM $db_name_akad.pelajaran WHERE replid='$IDPel'";
		$res = QueryDb($sql);
		$row = @mysql_fetch_row($res);
		$smsgeninfo .= ", Penilaian : ".$row[0];
	}

	

	if ($IDUjian=='-1'){
		$smsgeninfo .= ", Jenis Ujian : All";
	} else {
		$sql = "SELECT jenisujian FROM $db_name_akad.jenisujian WHERE replid='$IDUjian'";
		$res = QueryDb($sql);
		$row = @mysql_fetch_row($res);
		$smsgeninfo .= ", Jenis Ujian : ".$row[0];
	}
	
	$smsgeninfo .= ", Pengirim : ".$Sender;
	
	$idsmsgeninfo = GetLastId('replid','smsgeninfo');	
	$sql = "INSERT INTO smsgeninfo SET replid='$idsmsgeninfo',tanggal='$x[0]',tipe='1',info='$smsgeninfo',pengirim='$Sender'";
	$res = QueryDb($sql);
	
	$NIS2 = "";
	$ALLNIS	= split(',',$NIS);
	for ($i=0;$i<count($ALLNIS);$i++){
		if ($NIS2 == "")
			$NIS2 = "'".trim($ALLNIS[$i])."'";
		else
			$NIS2 = $NIS2.",'".trim($ALLNIS[$i])."'";
	}
	//echo "Jumlah".count($ALLNIS);
	//exit;
	$x	= split('-',$Date1);
	$Tgl1 = $x[2];
	$Bln1 = (int)$x[1];
	$Thn1 = $x[0];
	
	$x	= split('-',$Date2);
	$Tgl2 = $x[2];
	$Bln2 = (int)$x[1];
	$Thn2 = $x[0];

	$sql = "SELECT format FROM format WHERE tipe=1";
	$res = QueryDb($sql);
	$row = @mysql_fetch_row($res);
	$format = $row[0];
	$Receiver = 0;
	for ($i=0;$i<count($ALLNIS);$i++){
		$nisnya = trim($ALLNIS[$i]);
		//echo "<span style='background-color:#FF0000; font-family:Courier'>".$ALLNIS[$i]."</span><br>";
		$filterpesan = "";
		//Get Idkelas & IdSemester
		$sql =	"SELECT s.idkelas,ti.departemen FROM $db_name_akad.siswa s, $db_name_akad.kelas k, $db_name_akad.tahunajaran ta, $db_name_akad.tingkat ti ".
				"WHERE s.nis='$nisnya' AND s.idkelas=k.replid AND k.idtingkat=ti.replid AND k.idtahunajaran=ta.replid ";
		//echo $sql."<br>";
		$res = QueryDb($sql);
		$row = @mysql_fetch_row($res);
		$idkelas	= $row[0];
		$departemen = $row[1];

		$sql = "SELECT replid FROM $db_name_akad.semester WHERE aktif=1 AND departemen='$departemen'";
		//echo $sql."<br>";
		$res = QueryDb($sql);
		$row = @mysql_fetch_row($res);
		$idsemester	= $row[0];
		//echo "Dep=".$departemen." idsemester=".$idsemester." idkelas=".$idkelas."<br>";

		//Set Filter
		$filter = '';
		if ($IDPel!='-1'){
			$filter .= " AND idpelajaran='".$IDPel."' ";
			$sql1 = "SELECT kode FROM $db_name_akad.pelajaran WHERE replid='$IDPel'";
			$res1 = QueryDb($sql1);
			$row1 = @mysql_fetch_row($res1);
			$namapelajaran	= $row1[0];
			$filterpesan = ", $namapelajaran : ";
			
			if ($IDUjian!='-1'){
				$sql2 = "SELECT info1 FROM $db_name_akad.jenisujian WHERE replid='$IDUjian'";
				$res2 = QueryDb($sql2);
				$row2 = @mysql_fetch_row($res2);
				$namajenisujian	= $row2[0];
				$filter .= " AND idjenis='".$IDUjian."' ";
				$filterpesan = ", $namajenisujian $namapelajaran : ";
			}
		}
			
		$sql = "SELECT replid,idpelajaran,idjenis FROM $db_name_akad.ujian WHERE tanggal>='$Date1' AND tanggal<='$Date2' AND idkelas='$idkelas' AND idsemester='$idsemester' $filter ORDER BY replid DESC LIMIT $NumData";
		//echo $sql."<br>";
		//echo " NIS ".$ALLNIS[$i]."_";
		$res = QueryDb($sql);
		$x	 = @mysql_num_rows($res);
		//echo "Jumlah nilai".$x."<br>";

		while ($row = @mysql_fetch_row($res)){
						
			$sql1 = "SELECT kode FROM $db_name_akad.pelajaran WHERE replid='$row[1]'";
			$res1 = QueryDb($sql1);
			$row1 = @mysql_fetch_row($res1);
			$namapelajaran	= $row1[0];

			$sql2 = "SELECT info1 FROM $db_name_akad.jenisujian WHERE replid='$row[2]'";
			$res2 = QueryDb($sql2);
			$row2 = @mysql_fetch_row($res2);
			$namajenisujian	= $row2[0];
			
			$idujian = $row[0];
			$sql2 = "SELECT nilaiujian FROM $db_name_akad.nilaiujian WHERE idujian='$idujian' AND nis='$nisnya'";
			$res2 = QueryDb($sql2);
			$row2 = @mysql_fetch_row($res2);
			$nilai = $row2[0];
			if ($nilai=='')
				$nilai = '0';	
			//$filterpesan = "";
			if ($IDPel=='-1'){
				$filterpesan .= ", $namajenisujian $namapelajaran ".$nilai;
			} else {
				if ($IDUjian=='-1'){
					$filterpesan .= " $namajenisujian ".$nilai;
				} else {
					$filterpesan .= " ".$nilai." ";
				}
			}

			//Finding Phone Number
			$query	= "SELECT nis,hpsiswa,namaayah,hportu,nama FROM $db_name_akad.siswa WHERE nis='$nisnya'";
			$result = QueryDb($query);
			$data	= @mysql_fetch_row($result);
			
			$hpsiswa	= $data[1];
			/*
			for ($x=0;$x<strlen($hpsiswa);$x++){
				if ($x==0)
					$newhpsiswa = "+62";
				else
					$newhpsiswa .= substr($hpsiswa,$x,1);
			}
			$hpsiswa	= $newhpsiswa;
			*/
			$hportu		= $data[3];
			/*
			for ($x=0;$x<strlen($hportu);$x++){
				if ($x==0)
					$newhportu = "+62";
				else
					$newhportu .= substr($hportu,$x,1);
			}
			$hportu		= $newhportu;
			*/
			$namasiswa	= $data[4];
			//echo ", Pesan = ".$filterpesan;
			$newformat = str_replace('[SISWA]',$namasiswa,$format);
			$newformat = str_replace('[TANGGAL1]',$Tgl1,$newformat);
			$newformat = str_replace('[BULAN1]',$Bln1,$newformat);
			//$newformat = str_replace('#TAHUN1',$Thn1,$newformat);
			$newformat = str_replace('[TANGGAL2]',$Tgl2,$newformat);
			$newformat = str_replace('[BULAN2]',$Bln2,$newformat);
			//$newformat = str_replace('#TAHUN2',$Thn2,$newformat);
			$newformat = str_replace('. [PENGIRIM]',$filterpesan.'. [PENGIRIM]',$newformat);
			$newformat = str_replace('[PENGIRIM]',$Sender,$newformat);
			$TextMsg = CQ($newformat);
			//echo $TextMsg."<br>";
		}

		if ($filterpesan!=''){
			if ($KeOrtu==1 && $hportu!=''){
				$nohp = $hportu;
				$nohp = str_replace(" 62","0",$nohp);
				$nohp = str_replace("+62","0",$nohp);
				$sql = "INSERT INTO outbox SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', CreatorID='$Sender', idsmsgeninfo=$idsmsgeninfo";
				//echo $sql."_Ortu<br>";
				QueryDb($sql);

				$sql = "INSERT INTO outboxhistory SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', idsmsgeninfo=$idsmsgeninfo";
				QueryDb($sql);

				$Receiver++;
			}
			if ($KeSiswa==1 && $hpsiswa!=''){
				$nohp = $hpsiswa;
				$nohp = str_replace(" 62","0",$nohp);
				$nohp = str_replace("+62","0",$nohp);

				$sql = "INSERT INTO outbox SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender',CreatorID='$Sender', idsmsgeninfo=$idsmsgeninfo";
				//echo $sql."_Siswa<br>";
				QueryDb($sql);

				$sql = "INSERT INTO outboxhistory SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', idsmsgeninfo=$idsmsgeninfo";
				QueryDb($sql);
				$Receiver++;
			}
		}
		//echo $filterpesan."<br>";
		//echo "<hr>";
 	}
}

?>
<script language='javascript'>
	parent.bottom.PenilaianAfterSend('<?=$Receiver?>');
</script>