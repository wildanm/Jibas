JIBAS Road To Community v2.5.0

Langkah-langkah instalasi :
1. Pastikan sudah terinstall apache web server, php versi 5 ke atas dan mysql database server.

2. Aktifkan fasilitas `short_open_tag` (set menjadi On, biasanya terletak di : folder xampp/php/php.ini).
   Ubah menjadi short_open_tag = On;
   Setelah itu restart apache-nya.

3. Copy-kan folder `jibas` dan `filesharing` ke document root (biasanya terletak di folder xampp/htdocs).

4. Restore master databse JIBAS (jibas_db.sql) dengan menggunakan phpmyadmin atau sejenisnya.

5. Sesuaikan konfigurasi jibas :
   a. Konfigurasi aplikasi (folder jibas/include/application.config.php) :
      - $G_SERVER_ADDR='localhost'; *diisi alamat IP server
      
      - $FS_UPLOAD_DIR='C:\\xampp\\htdocs\\filesharing\\'; 
	/*
	* Folder "filesharing" dengan menggunakan full path
	* Contoh u/ windows : "C:\\xampp\\htdocs\\filesharing\\"
	* Contoh u/ linux   : "/var/www/html/filesharing/"
	*/

      - $G_OS='win'; /* diisi dengan singkatan sistem informasi yang terinstall jibas, untuk Windows 'win', untuk Linux 'lin' */
  
   b. Konfigurasi database jibas (folder jibas/include/database.config.php) :
      - /* Alamat basis data MySQL JIBAS */
	$db_host='localhost:3306'; /*digunakan untuk server database alamatserver(ip):port, port default 3306*/

      - /* User basis data MySQL JIBAS */
	$db_user='root'; /*database username*/

      - /* Password basis data MySQL JIBAS */
	$db_pass=''; /*database password*/

      - /* Basis data default JIBAS */
	$db_name='jbsakad'; /*TIDAK PERLU DIUBAH*/

6. Akses aplikasi jibas dengan menggunakan web browser (disarankan Mozilla Firefox), ketikkan alamat http://alamat_server_jibas/jibas, contoh http://127.0.0.1/jibas.

7. Untuk Username dan Password default Super Administrator JIBAS :
   - Username : jibas
   - Password : password