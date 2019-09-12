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

require_once ("genericreturn.php");
require_once ("debugger.php");

class HttpRequest
{
    private $host;
    private $port;
    private $uri;
    private $method;
    private $protocol = "http";
    private $timeout = 2000;

    private $queryString;
    private $queryData; // key value array
    private $postData; // key value array
    private $cookieData; // key value array
    private $headerData; // key value array

    function __construct($host, $port = 80, $uri = "/", $method = "POST")
    {
        $this->host = $host;
        $this->port = $port;
        $this->uri = $uri;
        $this->method = strtoupper($method);
    }

    function setTimeout($ms)
    {
        $this->timeout = $ms;
    }

    function setProtocol($protocol)
    {
        $this->protocol = strtolower($protocol);
    }

    function setQueryString($queryString)
    {
        $this->queryString = $queryString;
    }

    function setQueryData($queryArray)
    {
        $this->queryData = $queryArray;
    }

    function setPostData($postArray)
    {
        $this->postData = $postArray;
    }

    function setCookie($cookieArray)
    {
        $this->cookieData = $cookieArray;
    }

    function setHeader($headerArray)
    {
        $this->headerData = $headerArray;
    }

    function buildHost()
    {
        if ($this->protocol == "http")
        {
            if ($this->port == 80)
                return $this->host;

            return $this->host . ":" . $this->port;
        }
        else if ($this->protocol == "https")
        {
            if ($this->port == 443)
                return $this->host;

            return $this->host . ":" . $this->port;
        }
        else
        {
            return $this->host . ":" . $this->port;
        }
    }

    function buildRequestGet()
    {
        $crlf = "\r\n";

        $qs = $this->queryString;
        foreach($this->queryData as $k => $v)
        {
            if ($qs != "") $qs .= "&";
            $qs .= urlencode($k) . "=" . urlencode($v);
        }

        $cookie = "";
        foreach ($this->cookieData as $k => $v)
        {
            if ($cookie != "")
                $cookie .= "; ";
            $cookie .= urlencode($k) . "=" . urlencode($v);
        }

        $host = $this->buildHost();
        $url = $this->protocol . "://" . $host . "/" . $this->uri . "?" . $qs;

        $request  = "GET $url HTTP/1.1$crlf";
        $request .= "Host: $host$crlf";
        $request .= "User-Agent: Mozilla/5.0$crlf";
        $request .= "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8$crlf";
        $request .= "Accept-Language: en-us,en;q=0.5$crlf";
        $request .= "Accept-Encoding: gzip, deflate$crlf";
        if (!empty($cookie))
            $request .= "Cookie: $cookie$crlf";
        $request .= $crlf;
        //$request .= "Connection: keep-alive";

        return $request;
    }

    function buildRequestPost()
    {
        $crlf = "\r\n";

        $post = $this->queryString;;
        foreach ($this->postData as $k => $v)
        {
            if ($post != "") $post .= "&";
            $post .= urlencode($k) . "=" . urlencode($v);
        }

        $host = $this->buildHost();
        $url = $this->protocol . "://" . $host . "/" . $this->uri;

        $cookie = "";
        foreach ($this->cookieData as $k => $v)
        {
            if ($cookie != "")
                $cookie .= "; ";
            $cookie .= urlencode($k) . "=" . urlencode($v);
        }

        $request  = "POST $url HTTP/1.1$crlf";
        $request .= "Host: $host$crlf";
        $request .= "User-Agent: Mozilla/5.0$crlf";
        $request .= "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8$crlf";
        $request .= "Accept-Language: en-us,en;q=0.5$crlf";
        $request .= "Accept-Encoding: gzip, deflate$crlf";
        if (!empty($cookie))
            $request .= "Cookie: $cookie$crlf";
        $request .= 'Content-Type: application/x-www-form-urlencoded' . $crlf;
        $request .= 'Content-Length: ' . strlen($post) . $crlf . $crlf;
        //$request .= "Connection: keep-alive$crlf $crlf";
        $request .= $post;

        return $request;
    }

    function send()
    {
        $request = $this->method == "GET"
            ? $this->buildRequestGet()
            : $this->buildRequestPost();

        if (($fp = @fsockopen($this->host, $this->port, $errno, $errstr)) == false)
            return new GenericReturn(-99, "Error $errno: $errstr", "");

        stream_set_timeout($fp, 0, $this->timeout);

        $responseCode = "";
        $responseBody = "";
        $firstLine = true;
        $bodyLine = false;

        fputs($fp, $request);

        //$debug = new Debugger();

        $response = "";
        while(!feof($fp))
        {
            $line = fgets($fp, 1024);
            $response .= $line;
        }
        fclose($fp);

        $response = trim($response) . "\r";

        $startpos = 0;
        $pos = strpos($response, "\r", $startpos);
        while($pos !== false)
        {
            $line = substr($response, $startpos, $pos - $startpos + 1);
            $line = trim($line);

            //$debug->Log("Line: " . $line);

            if ($firstLine)
            {
                $firstLine = false;
                $info = explode(" ", $line);
                $responseCode = $info[1];
            }
            else if ($line == "")
            {
                $bodyLine = true;
            }
            else if ($bodyLine)
            {
                $responseBody .= $line;
            }

            $startpos = $pos + 1;
            $pos = strpos($response, "\r", $startpos);
        }


        //$debug->Log("Response Code: " . $responseCode);
        //$debug->Log("Response Body: " . $responseBody);
        //$debug->Close();

        return new GenericReturn(1, $responseCode, $responseBody);
    }
}
?>