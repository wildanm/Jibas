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
class CPustaka
{
	function OnStart()
	{
		$op = $_REQUEST[op];
		if ($op == "del")
		{
			$sql = "DELETE FROM format
					 WHERE replid='$_REQUEST[id]'";
			QueryDb($sql);
		}
		
		if (isset($_REQUEST[simpan]))
			$this->save();
	}
	
	function reload_page()
	{
		?>
		<script language='JavaScript'>
			document.location.href="pustaka.baru.php";
        </script>
		<?
	}
	
	function OnFinish()
	{
		//
    }
	
	function GetKatalog()
	{
		$this->katalog = $_REQUEST[katalog];
		
		$sql = "SELECT MAX(LENGTH(kode))
			      FROM katalog";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$maxlen = $row[0];
		?>
		
		<select name="katalog" id="katalog" class="cmbfrm" style="width:100%; font-family:'Courier New'">
		
<?      $sql = "SELECT replid, kode, nama
			      FROM katalog
				 ORDER BY nama";
		$result = QueryDb($sql);
		while ($row = @mysql_fetch_row($result))
		{
			$len = strlen(trim($row[1]));
			$space = $this->GetSpace($maxlen, $len);
			
			if ($this->katalog=="")
				$this->katalog = $row[0];	?>
			<option value="<?=$row[0]?>" <?=IntIsSelected($row[0], $this->katalog)?>>
				<?= "$space$row[1] - $row[2]" ?>
            </option>
<?		} ?>
		</select>
		<?
	}
	
	function GetPenulis()
	{
		$this->penulis = $_REQUEST[penulis];
		
		$sql = "SELECT MAX(LENGTH(kode))
			      FROM penulis";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$maxlen = $row[0];	?>
		
		<select name="penulis" id="penulis" class="cmbfrm" style="width:100%; font-family:'Courier New'">
			
<?		$sql = "SELECT replid, kode, nama
			      FROM penulis
				 ORDER BY nama";
		$result = QueryDb($sql);
		while ($row = @mysql_fetch_row($result))
		{
			$len = strlen(trim($row[1]));
			$space = $this->GetSpace($maxlen, $len);
			
			if ($this->penulis=="")
				$this->penulis = $row[0]; ?>
				
			<option value="<?=$row[0]?>" <?=IntIsSelected($row[0], $this->penulis)?>>
				<?= "$space$row[1] - $row[2]" ?>
            </option>
			
<?		}	?>
		</select>
		<?
	}
	
	function GetPenerbit()
	{
		$this->penerbit = $_REQUEST[penerbit];
		
		$sql = "SELECT MAX(LENGTH(kode))
			      FROM penerbit";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$maxlen = $row[0];	?>
		
		<select name="penerbit" id="penerbit" class="cmbfrm" style="width:100%; font-family:'Courier New'">
			
<?      $sql = "SELECT replid, kode, nama
				  FROM penerbit
				 ORDER BY nama";
		$result = QueryDb($sql);
		while ($row = @mysql_fetch_row($result))
		{
			$len = strlen(trim($row[1]));
			$space = $this->GetSpace($maxlen, $len);
			if ($this->penerbit=="")
				$this->penerbit = $row[0];	?>
			<option value="<?=$row[0]?>" <?=IntIsSelected($row[0], $this->penerbit)?>>
				<?= "$space$row[1] - $row[2]" ?>
			</option>
<?		}	?>
		</select>
		<?
	}
	
	function GetFormat()
	{
		$this->format = $_REQUEST[format];
		
		$sql = "SELECT MAX(LENGTH(kode))
			      FROM format";
		$result = QueryDb($sql);
		$row = mysql_fetch_row($result);
		$maxlen = $row[0]; ?>
		
		<select name="format" id="format" class="cmbfrm" style="width:100%; font-family:'Courier New'">
			
<?		$sql = "SELECT replid, kode, nama
				  FROM format
				 ORDER BY nama";
		$result = QueryDb($sql);
		
		while ($row = @mysql_fetch_row($result))
		{
			$len = strlen(trim($row[1]));
			$space = $this->GetSpace($maxlen, $len);
			
			if ($this->format == "")
				$this->format = $row[0];	?>
				
			<option value="<?=$row[0]?>" <?=IntIsSelected($row[0],$this->format)?>>
				<?= "$space$row[1] - $row[2]" ?>
			</option>
			
<?		}	?>
		</select>
		<?
	}
	
    function Content()
	{	?>
        <form action="pustaka.baru.php" method="post" onsubmit="return validate(<?=$this->CountPustaka()?>)" enctype="multipart/form-data">
		<table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr>
            <td width="47%" valign="top">
            	<fieldset>
					<legend><strong>Informasi Pustaka</strong></legend>
                    <table width="99%" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                        <td width="24%" align="right" valign="top">&nbsp;<strong>Judul</strong></td>
                        <td colspan="2"><textarea name="judul" cols="45" rows="3" class="areatxt2" id="judul" style="width:100%"></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">&nbsp;<strong>Harga&nbsp;Satuan</strong></td>
                        <td colspan="2"><input name="harga" type="text" class="inputtxt" id="harga" onfocus="unformatRupiah('harga')" onblur="formatRupiah('harga')" onkeyup="tempel('harga','hargaasli')" /><input name="hargaasli" type="hidden" class="inputtxt" id="hargaasli" /></td>
                      </tr>
                      <tr>
                        <td align="right">&nbsp;<strong>Katalog</strong></td>
                        <td colspan="2"><?=$this->GetKatalog()?></td>
                      </tr>
                      <tr>
                        <td align="right">&nbsp;<strong>Penulis</strong></td>
                        <td colspan="2">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><div id="PenulisInfo"><?=$this->GetPenulis()?></div></td>
                                <td width="18" align="right"><a href="javascript:ManagePenulis()"><img src="../img/ico/tambah.png" width="16" height="16" border="0" /></a></td>
                              </tr>
                            </table>  
                        </td>
                      </tr>
                      <tr>
                        <td align="right"><strong>&nbsp;Penerbit</strong></td>
                        <td colspan="2">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><div id="PenerbitInfo"><?=$this->GetPenerbit()?></div></td>
                                <td width="18" align="right"><a href="javascript:ManagePenerbit()"><img src="../img/ico/tambah.png" width="16" height="16" border="0" /></a></td>
                              </tr>
                            </table>
                        </td>
                      </tr>
                      <tr>
                        <td align="right">&nbsp;<strong>Tahun&nbsp;Terbit</strong></td>
                        <td width="27%"><input name="tahun" type="text" class="inputtxt" id="tahun" size='5' maxlength="4" /></td>
                        <td width="49%">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td align="right"><strong>Format&nbsp;</strong></td>
                                <td><?=$this->GetFormat()?></td>
                              </tr>
                            </table>
						</td>
                      </tr>
                      <tr>
                        <td align="right">&nbsp;<strong>Keyword</strong></td>
                        <td colspan="2"><input name="keyword" type="text" class="inputtxt" id="keyword" size="48" /></td>
                      </tr>
                      <tr>
                        <td align="right" valign="top">&nbsp;<strong>Keterangan&nbsp;Fisik</strong></td>
                        <td colspan="2"><textarea name="keteranganfisik" cols="45" rows="5" class="areatxt2" id="keteranganfisik" style="width:100%"></textarea></td>
                      </tr>
                	</table>
            	</fieldset>
				
				<fieldset>
                <legend><strong>Alokasi Jumlah</strong></legend>
				<?=$this->GetPustaka()?>
                </fieldset>
				
			</td>
            <td width="53%" valign="top">
                <table width="100%" border="0" cellspacing="2" cellpadding="0">
                <tr>
                    <td colspan="2">
                    	<fieldset>
							<legend><strong>Gambar Cover</strong></legend>
                    		<table width="130" border="0" cellspacing="0" cellpadding="0" bgcolor="#CCCCCC">
                            <tr height="130">
								<td align="center" valign="middle"><img src="../img/noimage.png" /></td>
                            </tr>
                            </table><br />
							<input name="cover" id="cover" type="file" />
                        </fieldset>
					</td>
                </tr>
                <tr>
                    <td colspan="2">
						<fieldset>
							<legend><strong>Abstraksi</strong></legend>
							<textarea name="abstraksi" id="abstraksi" cols="" rows="" style="width:100%"></textarea>
						</fieldset>
					</td>
                </tr>
                <tr>
                    <td width="25%" align="left" valign="top" colspan="2">
                    	<fieldset>
							<legend><strong>Keterangan&nbsp;Tambahan</strong></legend>
							<textarea name="keterangan" id="keterangan" cols="45" rows="5"></textarea>
                    	</fieldset>
					</td>
                </tr>
                </table>
			</td>
          </tr>
          
          <tr>
          	<td colspan="2" align="center">
            	<input name="simpan" type="submit" class="cmbfrm2" value="Simpan" />            </td>
          </tr>  
        </table>
		</form>
        <?
	}
	
	function GetPustaka()
	{
		if (SI_USER_LEVEL()==2)
			$sql = "SELECT *
					  FROM perpustakaan
					 WHERE replid = '".SI_USER_IDPERPUS()."'
					 ORDER BY nama";
		 else 
			$sql = "SELECT *
					  FROM perpustakaan
					 ORDER BY nama";
		 
		$result = QueryDb($sql); ?>
		<table width="100%" border="1" cellspacing="0" cellpadding="5" class="tab">
        <tr>
            <td width="63%" height="25" align="center" valign="middle" class="header">Perpustakaan</td>
            <td width="37%" height="25" align="center" valign="middle" class="header">Jumlah</td>
        </tr>
		
<?		$cnt = 0;
		while ($row = @mysql_fetch_array($result))
		{
			?>
            <tr>
               <td height="25" valign="middle">&nbsp;<?=$row[nama]?></td>
               <td height="20" align="left" valign="middle">
               		<input type="text" name="jumlah<?=$cnt?>" maxlength='3' size='4' id="jumlah<?=$cnt?>" class="inputtxt" />&nbsp;buah
 		            <input type="hidden" name="replid<?=$cnt?>" id="replid<?=$cnt?>" class="inputtxt" value="<?=$row[replid]?>" />     
               </td>
             </tr>
<?	 		$cnt++;
		}  ?>
        </table>
		
<?		if (SI_USER_LEVEL() == 2)
		{
			$sql = "SELECT * FROM perpustakaan WHERE replid<>".SI_USER_IDPERPUS()." ORDER BY nama";
			$result = QueryDb($sql);
			$cnt=1;
			while ($row = @mysql_fetch_array($result)){ ?>
					<input type="hidden" name="jumlah<?=$cnt?>" id="jumlah<?=$cnt?>" class="inputtxt" />
 		            <input type="hidden" name="replid<?=$cnt?>" id="replid<?=$cnt?>" class="inputtxt" value="<?=$row[replid]?>" />
			<?
            $cnt++;
			}
		}
    }
	
	function CountPustaka()
	{
		$sql = "SELECT * FROM perpustakaan ORDER BY nama";
		$result = QueryDb($sql);
		$num = @mysql_num_rows($result);
		
		return $num;
	}
	
	function GenerateBarcode($length = 6)
	{
		$dict = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		$barcode = "";
		for($i = 0; $i < $length; $i++)
		{
			$pos = rand(0, strlen($dict) - 1);
			$barcode .= substr($dict, $pos, 1);
		}
		
		return $barcode;
	}
	
	function GetNewBarcode()
	{
		$barcode = "";
		do
		{
			$barcode = $this->GenerateBarcode(6);
			
			$sql = "SELECT COUNT(replid)
					  FROM daftarpustaka
					 WHERE info1 = '$barcode'";
			$res = QueryDb($sql);
			$row = mysql_fetch_row($res);
			$ndata = (int)$row[0];		 
		}
		while($ndata != 0);
		
		return $barcode;
	}
	
	function save()
	{
		$judul = trim(addslashes($_REQUEST[judul]));
		$abstraksi = trim(addslashes($_REQUEST[abstraksi]));
		$keyword = trim(addslashes($_REQUEST[keyword]));
		$harga = UnformatRupiah(trim(addslashes($_REQUEST[harga])));
		$tahun = trim(addslashes($_REQUEST[tahun]));
		$keteranganfisik = trim(addslashes($_REQUEST[keteranganfisik]));
		$penulis = trim(addslashes($_REQUEST[penulis]));
		$penerbit = trim(addslashes($_REQUEST[penerbit]));
		$format = trim(addslashes($_REQUEST[format]));
		$katalog = trim(addslashes($_REQUEST[katalog]));
		$keterangan = trim(addslashes($_REQUEST[keterangan]));
		$cover = $_FILES['cover'];
		$uploadedfile = $cover['tmp_name'];
		$uploadedfile_name = $cover['name'];

		if (strlen($uploadedfile) != 0)
		{
			$tmp_path = realpath(".") . "/../../temp";
			$tmp_exists = file_exists($tmp_path) && is_dir($tmp_path);
			if (!$tmp_exists)
				mkdir($tmp_path, 0755);
			
			$filename = "$tmp_path/ad-pus-tmp.jpg";
			ResizeImage($cover, 160, 120, 70, $filename);
			
			$fh = fopen($filename, "r");
        	$cover_binary = addslashes(fread($fh, filesize($filename)));
			fclose($fh);
			
			$fill_cover = ", cover='$cover_binary'"; 
		}
		
		BeginTrans();
		$success = true;

		$sql = "SELECT *
				  FROM pustaka
				 WHERE judul='$judul'
				   AND penulis='$penulis'
				   AND format='$format'
				   AND katalog='$katalog'
				   AND penerbit='$penerbit'";
		//echo "$sql<br>";		   
		$result = QueryDbTrans($sql, $success);
		$num = @mysql_num_rows($result);
		$goon = 0;
		
		if ($success)
		{
			if ($num == 0) 
			{
				$sql = "INSERT INTO pustaka
						   SET harga='$harga', judul='$judul', abstraksi='$abstraksi', keyword='$keyword',
							   tahun='$tahun', keteranganfisik='$keteranganfisik', penulis='$penulis',
							   format='$format', katalog='$katalog', penerbit='$penerbit',
							   keterangan='$keterangan' $fill_cover ";
				//echo "$sql<br>";			   
				$result = QueryDbTrans($sql, $success);
				if ($success) 
				{
					$sql = "SELECT LAST_INSERT_ID()";
					//echo "$sql<br>";
					$result = QueryDb($sql);
					$row = @mysql_fetch_row($result);
					$lastid = $row[0];
					
					$goon = 1;
				}
			} 
			else 
			{
				$sql = "SELECT replid
						  FROM pustaka
						 WHERE judul='$judul'
						   AND penulis='$penulis'
						   AND format='$format'
						   AND katalog='$katalog'
						   AND penerbit='$penerbit'
						 ORDER BY replid DESC
						 LIMIT 1";
				//echo "$sql<br>";		 
				$result = QueryDbTrans($sql, $success);
				$row = @mysql_fetch_row($result);
				$lastid = $row[0];
				
				$goon = 1;
			}
		}
		
		if ($success && $goon == 1)
		{
			$sql = "SELECT counter
					  FROM katalog
					 WHERE replid = '$katalog'";
			//echo "$sql<br>";		 
			$result = QueryDbTrans($sql, $success);
			$r = @mysql_fetch_row($result);
			$counter = $r[0];
			for ($i = 0; $success && $i < $this->CountPustaka(); $i++)
			{
				$replid = $_REQUEST['replid'.$i];
				$parm = "jumlah$i";
				if ($_REQUEST[$parm] != "" && $_REQUEST[$parm] > 0)
				{
					for ($j = 1; $success && $j <= $_REQUEST[$parm]; $j++)
					{
						$counter++;
						$kodepustaka = $this->GenKodePustaka($katalog, $penulis, $judul, $format, $counter);
						$barcode = $this->GetNewBarcode();
						$sql = "INSERT INTO daftarpustaka
								   SET pustaka='$lastid', perpustakaan='$replid',
									   kodepustaka='$kodepustaka', info1='$barcode'";
						//echo "$sql<br>";			   
						QueryDbTrans($sql, $success);
					}
				}
			}
			
			if ($success)
			{
				$sql = "UPDATE katalog
						   SET counter = $counter
						 WHERE replid = '$katalog'";
				//echo "$sql<br>";		 
				QueryDbTrans($sql, $success);	
			}
		}
		
		if ($success)
		{
			//echo "OK";
			//RollbackTrans();
			CommitTrans();
		}
		else
		{
			//echo "FAILED";
			RollbackTrans();
		}
		//exit();
		
		$this->reload_page();	
	}
	
	function GenKodePustaka($katalog,$penulis,$judul,$format,$counter)
	{
		$sql = "SELECT kode FROM katalog WHERE replid='$katalog'";
		$result = QueryDb($sql);
		$ktlg = @mysql_fetch_row($result);

		$sql = "SELECT kode FROM penulis WHERE replid='$penulis'";
		$result = QueryDb($sql);
		$pnls = @mysql_fetch_row($result);
		
		$jdl = substr($judul, 0, 1);
	
		$sql = "SELECT kode FROM format WHERE replid='$format'";
		$result = QueryDb($sql);
		$frmt = @mysql_fetch_row($result);
		
		$cnt = str_pad($counter, 5, "0", STR_PAD_LEFT);

		$unique = true;
		$addcnt = 0;
		do
		{
			$kode = $ktlg[0] . "/" . $pnls[0] . "/" . $jdl . "/" . $cnt . "/" . $frmt[0];
			
			$sql = "SELECT COUNT(replid) FROM daftarpustaka WHERE kodepustaka = '$kode'";
			$result = QueryDb($sql);
			$row = mysql_fetch_row($result);
			
			if ($row[0] > 0)
			{
				$addcnt++;
				$cnt = "$cnt.$addcnt";
				$unique = false;
			}
			else
			{
				$unique = true;
			}
		}
		while(!$unique);
		
		return $kode;
	}
	
	function GetSpace($maxlength, $length)
	{
		$spacer = "";
		for ($i = 1; $i <= $maxlength - $length; $i++)
			$spacer .= "&nbsp;";
			
		return $spacer;	
	}
}
?>