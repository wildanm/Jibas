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
<?php
function ReadParams()
{
    global $idpelajaran, $idtingkat, $kdaspek, $komentar, $no;

    if (isset($_REQUEST['idpelajaran']))
        $idpelajaran = $_REQUEST['idpelajaran'];

    if (isset($_REQUEST['idtingkat']))
        $idtingkat = $_REQUEST['idtingkat'];

    if (isset($_REQUEST['kdaspek']))
        $kdaspek = CQ($_REQUEST['kdaspek']);

    if (isset($_REQUEST['komentar']))
        $komentar = CQ($_REQUEST['komentar']);

    if (isset($_REQUEST['no']))
        $no = CQ($_REQUEST['no']);

    $komentar = urldecode($komentar);
}

function SimpanData()
{
    global $idpelajaran, $idtingkat, $kdaspek, $komentar, $no;

    if (!isset($_REQUEST['Simpan']))
        return;

    OpenDb();
    $komentar = CQ($komentar);
    $sql = "INSERT INTO pilihkomenpel 
               SET idpelajaran = '$idpelajaran',
                   idtingkat = '$idtingkat',
                   dasarpenilaian = '$kdaspek',
                   komentar = '$komentar'";
    $result = QueryDb($sql);
    if ($result)
    { 	?>
        <script language="javascript">
            opener.refreshListKomentar(<?=$no?>);
            window.close();
        </script>
        <?
    }
    CloseDb();
    exit();

}
?>