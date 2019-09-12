<?
function GetTitle()
{
    global $kodepustaka;
    
    $judul = "";
    
    $sql = "SELECT p.judul
              FROM pustaka p, daftarpustaka dp
             WHERE p.replid = dp.pustaka
               AND dp.kodepustaka = '$kodepustaka'";
    $res = QueryDb($sql);
    if (mysql_num_rows($res) > 0)
    {
        $row = mysql_fetch_row($res);
        $judul = $row[0];
    }
    
    return $judul;
}

function GetReturnDate()
{
    global $kodepustaka;
    
    $kembali = "";
    $sql = "SELECT DATE_FORMAT(tglkembali, '%d-%m-%Y')
              FROM pinjam
             WHERE kodepustaka = '$kodepustaka'
               AND status = 1";
    $res = QueryDb($sql);
    if (mysql_num_rows($res) > 0)
    {
        $row = mysql_fetch_row($res);
        $kembali = $row[0];
    }
    
    return $kembali;           
               
}

function SimpanData()
{
    $kodepustaka = $_REQUEST['kodepustaka'];
    $tglkembali = MySqlDateFormat($_REQUEST['tglkembali']);
    $keterangan = $_REQUEST['keterangan'];
    
    $sql = "UPDATE pinjam
               SET tglkembali = '$tglkembali', keterangan = '$keterangan'
             WHERE kodepustaka = '$kodepustaka'
               AND status = 1";
    //echo $sql;
    //exit();
    QueryDb($sql);
    ?>
    <script>
        opener.RefreshPage();
        window.close();
    </script>
    <?
    CloseDb();
    exit();
}
?>