<?
/**[N]**
 * JIBAS Education Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 3.0 (January 09, 2013)
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
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../include/common.php');
OpenDb();
//echo "<pre>";
//print_r($_REQUEST);
//echo "</pre>";
$op	= $_REQUEST['op'];

$Type		= $_REQUEST['Type'];
$Dep		= $_REQUEST['Dep'];
$Kls		= $_REQUEST['Kls'];
$NIS		= $_REQUEST['NIS'];
$Pres		= $_REQUEST['Pres'];
$Date1		= $_REQUEST['Date1'];
$Date2		= $_REQUEST['Date2'];
//echo $Date1."_".$Date2;
$Sender		= CQ($_REQUEST['Sender']);
$KeSiswa	= $_REQUEST['KeSiswa'];
if ($KeSiswa=="")
	$KeSiswa = 0;
$KeOrtu		= $_REQUEST['KeOrtu'];
if ($KeOrtu=="")
	$KeOrtu = 0;
$SendDate	= $_REQUEST['SendDate'];
$Receiver	= 0;
if ($op=='SavePresensi'){
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
	if ($Pres=='0')
		$smsgeninfo .= ", Presensi : Harian";
	else
		$smsgeninfo .= ", Presensi : Pelajaran";
	
	$smsgeninfo .= ", Pengirim : ".$Sender;
	
	$idsmsgeninfo = GetLastId('replid','smsgeninfo');	
	$sql = "INSERT INTO smsgeninfo SET replid='$idsmsgeninfo',tanggal='$x[0]',tipe='0',info='$smsgeninfo',pengirim='$Sender'";
	$res = QueryDb($sql);
	
	$NIS2 = "";
	$ALLNIS	= split(',',$NIS);
	for ($i=0;$i<count($ALLNIS);$i++){
		if ($NIS2 == "")
			$NIS2 = "'".trim($ALLNIS[$i])."'";
		else
			$NIS2 = $NIS2.",'".trim($ALLNIS[$i])."'";
	}
	$Dt1  = $Date1;
	$x	= split('-',$Date1);
	$Tgl1 = $x[2];
	$Bln1 = (int)$x[1];
	$Thn1 = $x[0];
	
	$Dt2  = $Date2;
	$x	= split('-',$Date2);
	$Tgl2 = $x[2];
	$Bln2 = (int)$x[1];
	$Thn2 = $x[0];
	
	if ($Pres=='0'){//harian
		$sql = "SELECT format FROM format WHERE tipe=0";
		$res = QueryDb($sql);
		$row = @mysql_fetch_row($res);
		$format = $row[0];

		$sql =	"SELECT SUM(hadir) AS H,SUM(ijin) AS I,SUM(sakit) AS S,SUM(cuti) AS C,SUM(alpa) AS A, p.nis AS nis, s.nama AS nama ".
				"FROM $db_name_akad.presensiharian ph, $db_name_akad.phsiswa p, $db_name_akad.siswa s ".
				"WHERE ph.tanggal1>='$Dt1' AND ph.tanggal2<='$Dt2' AND ph.replid=p.idpresensi AND ".
				"p.nis=s.nis AND ".
				"p.nis IN ($NIS2) GROUP BY p.nis";
		$res = QueryDb($sql);	
		//echo $sql;
		while ($row = @mysql_fetch_array($res)){
			//Configuring SMS Text Message
			$sumHadir  = $row['H'];
			$sumAbsen  = (int)$row['I']+(int)$row['S']+(int)$row['C']+(int)$row['A'];
			$newformat = str_replace('[SISWA]','harian '.$row['nama'],$format);
			$newformat = str_replace('[TANGGAL1]',$Tgl1,$newformat);
			$newformat = str_replace('[BULAN1]',$Bln1,$newformat);
			//$newformat = str_replace('#TAHUN1',$Thn1,$newformat);
			$newformat = str_replace('[TANGGAL2]',$Tgl2,$newformat);
			$newformat = str_replace('[BULAN2]',$Bln2,$newformat);
			//$newformat = str_replace('#TAHUN2',$Thn2,$newformat);
			$newformat = str_replace('[HADIR]',$sumHadir,$newformat);
			$newformat = str_replace('[ABSEN]',$sumAbsen,$newformat);
			$newformat = str_replace('[PENGIRIM]',$Sender,$newformat);
			$TextMsg = CQ($newformat);
			
			//Finding Phone Number
			$query	= "SELECT nis,hpsiswa,namaayah,hportu FROM $db_name_akad.siswa WHERE nis='$row[nis]'";
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
			if ($KeOrtu==1 && $hportu!=''){
				$nohp = $hportu;
				$nohp = str_replace(" 62","0",$nohp);
				$nohp = str_replace("+62","0",$nohp);
				
				$sql = "INSERT INTO outbox SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', CreatorID='$Sender',idsmsgeninfo='$idsmsgeninfo'";
				QueryDb($sql);

				$sql = "INSERT INTO outboxhistory SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', idsmsgeninfo='$idsmsgeninfo'";
				QueryDb($sql);
				$Receiver++;
			}
			if ($KeSiswa==1 && $hpsiswa!=''){
				$nohp = $hpsiswa;
				$nohp = str_replace(" 62","0",$nohp);
				$nohp = str_replace("+62","0",$nohp);

				$sql = "INSERT INTO outbox SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender',CreatorID='$Sender', idsmsgeninfo='$idsmsgeninfo'";
				QueryDb($sql);

				$sql = "INSERT INTO outboxhistory SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', idsmsgeninfo='$idsmsgeninfo'";
				QueryDb($sql);
				$Receiver++;
			}
			//echo "SQL = ".$sql."<br>";
			//echo "<pre>";
			//print_r($data);
			//echo "</pre>";
		}

	} elseif ($Pres=='1'){//pelajaran
		$sql = "SELECT format FROM format WHERE tipe=0";
		$res = QueryDb($sql);
		$row = @mysql_fetch_row($res);
		$format = $row[0];
		
		$sql = "SELECT
				pp.idpp,
				pp.nis
				FROM $db_name_akad.presensipelajaran p, $db_name_akad.ppsiswa pp 
				WHERE  p.replid=pp.idpp
				AND pp.nis IN
				($NIS2) GROUP BY pp.nis,pp.statushadir,p.replid";
		//echo $sql;/* p.tanggal>='$Date1' AND p.tanggal<='$Date2' AND */
		$res = QueryDb($sql);
		$IDPP = "";
		while ($row = @mysql_fetch_row($res)){
			if ($IDPP == "")
				$IDPP = $row[0];
			else
				$IDPP = $IDPP.','.$row[0];
		}
		//echo "ALLNIS=".count($ALLNIS)."<br>";
		//exit;
		for ($i=0;$i<count($ALLNIS);$i++){
			//echo "i=".$i."<br>";
			$sql = "SELECT count(statushadir)  
					FROM $db_name_akad.ppsiswa 
					WHERE nis='$ALLNIS[$i]' AND idpp IN ($IDPP) AND statushadir=0";
			//echo $sql."<br>";
			$res = QueryDb($sql);
			$row = @mysql_fetch_row($res);
			$NumHadir = $row[0];
				
			$sql = "SELECT count(statushadir)  
					FROM $db_name_akad.ppsiswa 
					WHERE nis='$ALLNIS[$i]' AND idpp IN ($IDPP) AND statushadir<>0";
			//echo $sql."<br>";
			$res = QueryDb($sql);
			$row = @mysql_fetch_row($res);
			$NumAbsen = $row[0];
			
			
			$newformat = str_replace('[TANGGAL1]',$Tgl1,$format);
			$newformat = str_replace('[BULAN1]',$Bln1,$newformat);
			//$newformat = str_replace('#TAHUN1',$Thn1,$newformat);
			$newformat = str_replace('[TANGGAL2]',$Tgl2,$newformat);
			$newformat = str_replace('[BULAN2]',$Bln2,$newformat);
			//$newformat = str_replace('#TAHUN2',$Thn2,$newformat);
			$newformat = str_replace('[HADIR]',$NumHadir,$newformat);
			$newformat = str_replace('[ABSEN]',$NumAbsen,$newformat);
			$newformat = str_replace('[PENGIRIM]',$Sender,$newformat);
			
				
			//Finding Phone Number
			$query	= "SELECT nis,hpsiswa,namaayah,hportu,nama FROM $db_name_akad.siswa WHERE nis='$ALLNIS[$i]'";
			$result = QueryDb($query);
			$data	= @mysql_fetch_row($result);
			
			$newformat = str_replace('[SISWA]','pelajaran '.$data[4],$newformat);
			$TextMsg = CQ($newformat);
			
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
			if ($KeOrtu==1 && $hportu!=''){
				$nohp = $hportu;
				$nohp = str_replace(" 62","0",$nohp);
				$nohp = str_replace("+62","0",$nohp);

				$sql = "INSERT INTO outbox SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', CreatorID='$Sender',idsmsgeninfo='$idsmsgeninfo'";
				//echo "Ngirim ke ortunya ".$data[4]."<br>";
				QueryDb($sql);

				$sql = "INSERT INTO outboxhistory SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', idsmsgeninfo='$idsmsgeninfo'";
				//echo $sql."<br>";
				QueryDb($sql);
				$Receiver++;
			}
			if ($KeSiswa==1 && $hpsiswa!=''){
				$nohp = $hpsiswa;
				$nohp = str_replace(" 62","0",$nohp);
				$nohp = str_replace("+62","0",$nohp);

				$sql = "INSERT INTO outbox SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', CreatorID='$Sender',idsmsgeninfo='$idsmsgeninfo'";
				//echo "Ngirim ke siswa ".$data[4]."<br>";
				QueryDb($sql);

				$sql = "INSERT INTO outboxhistory SET InsertIntoDB=now(), SendingDateTime='$SendDate', Text='$TextMsg', DestinationNumber='$nohp', SenderID='$Sender', idsmsgeninfo='$idsmsgeninfo'";
				//echo $sql."<br>";
				QueryDb($sql);
				$Receiver++;
			}	
			//echo "NIS = ".$ALLNIS[$i].", Hadir=".$NumHadir.", Absen=".$NumAbsen."<br>";	
		//echo "<hr>";
		}

	}
	
}

?>
<script language='javascript'>
	parent.bottom.PresensiAfterSend('<?=$Receiver?>');
</script>