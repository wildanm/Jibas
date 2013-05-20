set foreign_key_checks=0 ;

TRUNCATE tahunajaran ; 
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (1,'2006/2007','A');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (2,'2006/2007','B');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (3,'2006/2007','C');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (4,'2006/2007','D');

INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (5,'2007/2008','A');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (6,'2007/2008','B');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (7,'2007/2008','C');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (8,'2007/2008','D');

INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (9,'2008/2009','A');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (10,'2008/2009','B');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (11,'2008/2009','C');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (12,'2008/2009','D');

INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (13,'2009/2010','A');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (14,'2009/2010','B');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (15,'2009/2010','C');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (16,'2009/2010','D');

INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (17,'2010/2011','A');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (18,'2010/2011','B');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (19,'2010/2011','C');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (20,'2010/2011','D');

INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (21,'2011/2012','A');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (22,'2011/2012','B');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (23,'2011/2012','C');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (24,'2011/2012','D');

INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (25,'2012/2013','A');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (26,'2012/2013','B');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (27,'2012/2013','C');
INSERT IGNORE INTO tahunajaran (replid,tahunajaran,departemen) VALUES (28,'2012/2013','D');

TRUNCATE angkatan ; 
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(1,'2006','A',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(2,'2006','B',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(3,'2006','C',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(4,'2006','D',1);

INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(5,'2007','A',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(6,'2007','B',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(7,'2007','C',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(8,'2007','D',1);

INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(9,'2008','A',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(10,'2008','B',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(11,'2008','C',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(12,'2008','D',1);

INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(13,'2009','A',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(14,'2009','B',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(15,'2009','C',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(16,'2009','D',1);

INSERT IGNORE  INTO angkatan (replid, angkatan,departemen,aktif) values(17,'2010','A',1);
INSERT IGNORE  INTO angkatan (replid, angkatan,departemen,aktif) values(18,'2010','B',1);
INSERT IGNORE  INTO angkatan (replid, angkatan,departemen,aktif) values(19,'2010','C',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(20,'2010','D',1);

INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(21,'2011','A',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(22,'2011','B',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(23,'2011','C',1);
INSERT IGNORE  INTO angkatan (replid, angkatan,departemen,aktif) values(24,'2011','D',1);

INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(25,'2012','A',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(26,'2012','B',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(27,'2012','C',1);
INSERT IGNORE INTO angkatan (replid, angkatan,departemen,aktif) values(28,'2012','D',1);

TRUNCATE tingkat ;

INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(1,'1','A',1);
INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(2,'2','A',1);
INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(3,'3','A',1);
INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(4,'4','A',1);
INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(5,'5','A',1);
INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(6,'6','A',1);

INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(7,'7','C',1);
INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(8,'8','C',1);
INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(9,'9','C',1);

INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(10,'10','D',1);
INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(11,'11','D',1);
INSERT IGNORE INTO tingkat (replid, tingkat, departemen,aktif) values(12,'12','D',1);

TRUNCATE kelas ;

/** === KELAS TAHUN AJARAN 2006 === **/
/** tingkat kelas 1 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  SELECT kode_kelas.kelas AS kelas, 1 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       1 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(1,2,3,4)
       GROUP BY kelas;
       
/** tingkat kelas 2 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 1 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       2 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(5,6,7,8)
       GROUP BY kelas;       
       
/** tingkat kelas 3 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 1 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       3 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(9,10,11,12)
       GROUP BY kelas;              
       
/** tingkat kelas 4 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 1 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       4 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(13,14,15,16)
       GROUP BY kelas;                     
       
/** tingkat kelas 5 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 1 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       5 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(17,18,19,20)
       GROUP BY kelas;                            
       
/** tingkat kelas 6 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 1 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       6 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(39,40,41,42)
       GROUP BY kelas;              
       
/** tingkat kelas 7 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 3 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       7 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(21,22,23,24)
       GROUP BY kelas;                     
       
/** tingkat kelas 8 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 3 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       8 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(25,26,27,28)
       GROUP BY kelas;                            

/** tingkat kelas 9 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 3 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       9 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(29,43,44,45)
       GROUP BY kelas;                              
       
/** tingkat kelas 10 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 4 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       10 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(30,31,32,48)
       GROUP BY kelas;                                     
       
/** tingkat kelas 11 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 4 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       11 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(33,34,35,49)
       GROUP BY kelas;                                            
       
/** tingkat kelas 12 : tahun ajaran 2006 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 4 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       12 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(36,37,38,50,61)
       GROUP BY kelas;                                                   
       
/** === KELAS TAHUN AJARAN 2007 === **/
/** tingkat kelas 1 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 5 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       1 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(1,2,3,4)
       GROUP BY kelas;
       
/** tingkat kelas 2 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 5 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       2 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(5,6,7,8)
       GROUP BY kelas;       
       
/** tingkat kelas 3 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 5 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       3 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(9,10,11,12)
       GROUP BY kelas;              
       
/** tingkat kelas 4 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 5 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       4 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(13,14,15,16)
       GROUP BY kelas;                     
       
/** tingkat kelas 5 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 5 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       5 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(17,18,19,20)
       GROUP BY kelas;                            
       
/** tingkat kelas 6 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 5 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       6 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(39,40,41,42)
       GROUP BY kelas;              
       
/** tingkat kelas 7 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 7 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       7 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(21,22,23,24)
       GROUP BY kelas;                     
       
/** tingkat kelas 8 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 7 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       8 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(25,26,27,28)
       GROUP BY kelas;                            

/** tingkat kelas 9 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 7 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       9 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(29,43,44,45)
       GROUP BY kelas;                              
       
/** tingkat kelas 10 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 8 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       10 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(30,31,32,48)
       GROUP BY kelas;                                     
       
/** tingkat kelas 11 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 8 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       11 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(33,34,35,49)
       GROUP BY kelas;                                            
       
/** tingkat kelas 12 : tahun ajaran 2007 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 8 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       12 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(36,37,38,50,61)
       GROUP BY kelas;       
       
/** === KELAS TAHUN AJARAN 2008 === **/
/** tingkat kelas 1 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 9 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       1 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(1,2,3,4)
       GROUP BY kelas;
       
/** tingkat kelas 2 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 9 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       2 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(5,6,7,8)
       GROUP BY kelas;       
       
/** tingkat kelas 3 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 9 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       3 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(9,10,11,12)
       GROUP BY kelas;              
       
/** tingkat kelas 4 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 9 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       4 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(13,14,15,16)
       GROUP BY kelas;                     
       
/** tingkat kelas 5 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 9 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       5 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(17,18,19,20)
       GROUP BY kelas;                            
       
/** tingkat kelas 6 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 9 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       6 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(39,40,41,42)
       GROUP BY kelas;              
       
/** tingkat kelas 7 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 11 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       7 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(21,22,23,24)
       GROUP BY kelas;                     
       
/** tingkat kelas 8 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 11 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       8 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(25,26,27,28)
       GROUP BY kelas;                            

/** tingkat kelas 9 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 11 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       9 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(29,43,44,45)
       GROUP BY kelas;                              
       
/** tingkat kelas 10 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 12 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       10 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(30,31,32,48)
       GROUP BY kelas;                                     
       
/** tingkat kelas 11 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 12 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       11 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(33,34,35,49)
       GROUP BY kelas;                                            
       
/** tingkat kelas 12 : tahun ajaran 2008 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 12 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       12 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(36,37,38,50,61)
       GROUP BY kelas;        
       
/** === KELAS TAHUN AJARAN 2009 === **/
/** tingkat kelas 1 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 13 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       1 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(1,2,3,4)
       GROUP BY kelas;
       
/** tingkat kelas 2 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 13 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       2 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(5,6,7,8)
       GROUP BY kelas;       
       
/** tingkat kelas 3 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 13 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       3 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(9,10,11,12)
       GROUP BY kelas;              
       
/** tingkat kelas 4 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 13 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       4 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(13,14,15,16)
       GROUP BY kelas;                     
       
/** tingkat kelas 5 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 13 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       5 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(17,18,19,20)
       GROUP BY kelas;                            
       
/** tingkat kelas 6 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 13 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       6 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(39,40,41,42)
       GROUP BY kelas;              
       
/** tingkat kelas 7 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 15 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       7 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(21,22,23,24)
       GROUP BY kelas;                     
       
/** tingkat kelas 8 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 15 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       8 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(25,26,27,28)
       GROUP BY kelas;                            

/** tingkat kelas 9 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 15 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       9 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(29,43,44,45)
       GROUP BY kelas;                              
       
/** tingkat kelas 10 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 16 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       10 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(30,31,32,48)
       GROUP BY kelas;                                     
       
/** tingkat kelas 11 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 16 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       11 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(33,34,35,49)
       GROUP BY kelas;                                            
       
/** tingkat kelas 12 : tahun ajaran 2009 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 16 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       12 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(36,37,38,50,61)
       GROUP BY kelas;                                                   
       
/** === KELAS TAHUN AJARAN 2010 === **/
/** tingkat kelas 1 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 17 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       1 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(1,2,3,4)
       GROUP BY kelas;
       
/** tingkat kelas 2 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 17 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       2 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(5,6,7,8)
       GROUP BY kelas;       
       
/** tingkat kelas 3 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 17 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       3 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(9,10,11,12)
       GROUP BY kelas;              
       
/** tingkat kelas 4 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 17 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       4 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(13,14,15,16)
       GROUP BY kelas;                     
       
/** tingkat kelas 5 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 17 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       5 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(17,18,19,20)
       GROUP BY kelas;                            
       
/** tingkat kelas 6 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 17 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       6 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(39,40,41,42)
       GROUP BY kelas;              
       
/** tingkat kelas 7 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 19 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       7 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(21,22,23,24)
       GROUP BY kelas;                     
       
/** tingkat kelas 8 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 19 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       8 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(25,26,27,28)
       GROUP BY kelas;                            

/** tingkat kelas 9 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 19 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       9 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(29,43,44,45)
       GROUP BY kelas;                              
       
/** tingkat kelas 10 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 20 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       10 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(30,31,32,48)
       GROUP BY kelas;                                     
       
/** tingkat kelas 11 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 20 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       11 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(33,34,35,49)
       GROUP BY kelas;                                            
       
/** tingkat kelas 12 : tahun ajaran 2010 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 20 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       12 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(36,37,38,50,61)
       GROUP BY kelas;                                                   
       
/** === KELAS TAHUN AJARAN 2011 === **/
/** tingkat kelas 1 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 21 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       1 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(1,2,3,4)
       GROUP BY kelas;
       
/** tingkat kelas 2 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 21 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       2 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(5,6,7,8)
       GROUP BY kelas;       
       
/** tingkat kelas 3 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 21 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       3 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(9,10,11,12)
       GROUP BY kelas;              
       
/** tingkat kelas 4 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 21 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       4 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(13,14,15,16)
       GROUP BY kelas;                     
       
/** tingkat kelas 5 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 21 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       5 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(17,18,19,20)
       GROUP BY kelas;                            
       
/** tingkat kelas 6 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 21 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       6 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(39,40,41,42)
       GROUP BY kelas;              
       
/** tingkat kelas 7 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 23 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       7 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(21,22,23,24)
       GROUP BY kelas;                     
       
/** tingkat kelas 8 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 23 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       8 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(25,26,27,28)
       GROUP BY kelas;                            

/** tingkat kelas 9 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 23 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       9 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(29,43,44,45)
       GROUP BY kelas;                              
       
/** tingkat kelas 10 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 24 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       10 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(30,31,32,48)
       GROUP BY kelas;                                     
       
/** tingkat kelas 11 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 24 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       11 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(33,34,35,49)
       GROUP BY kelas;                                            
       
/** tingkat kelas 12 : tahun ajaran 2011 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 24 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       12 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(36,37,38,50,61)
       GROUP BY kelas;                                                   
       
/** === KELAS TAHUN AJARAN 2012 === **/
/** tingkat kelas 1 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 25 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       1 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(1,2,3,4)
       GROUP BY kelas;
       
/** tingkat kelas 2 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 25 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       2 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(5,6,7,8)
       GROUP BY kelas;       
       
/** tingkat kelas 3 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 25 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       3 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(9,10,11,12)
       GROUP BY kelas;              
       
/** tingkat kelas 4 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 25 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       4 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(13,14,15,16)
       GROUP BY kelas;                     
       
/** tingkat kelas 5 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 25 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       5 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(17,18,19,20)
       GROUP BY kelas;                            
       
/** tingkat kelas 6 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 25 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       6 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(39,40,41,42)
       GROUP BY kelas;              
       
/** tingkat kelas 7 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 27 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       7 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(21,22,23,24)
       GROUP BY kelas;                     
       
/** tingkat kelas 8 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 27 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       8 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(25,26,27,28)
       GROUP BY kelas;                            

/** tingkat kelas 9 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 27 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       9 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(29,43,44,45)
       GROUP BY kelas;                              
       
/** tingkat kelas 10 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 28 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       10 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(30,31,32,48)
       GROUP BY kelas;                                     
       
/** tingkat kelas 11 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 28 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       11 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(33,34,35,49)
       GROUP BY kelas;                                            
       
/** tingkat kelas 12 : tahun ajaran 2012 **/
INSERT IGNORE INTO kelas (kelas, idtahunajaran, kapasitas, nipwali, aktif, keterangan, idtingkat)  
       SELECT kode_kelas.kelas AS kelas, 28 AS tahun_ajaran, 50 AS kapasitas, 
       guru_walikelas.nip AS nipwali, 1 AS aktif, kode_kelas.kelas AS keterangan, 
       12 AS idtingkat FROM h05322_simmsit.siswa_kelas LEFT JOIN h05322_simmsit.kode_kelas ON h05322_simmsit.siswa_kelas.kd_kelas=h05322_simmsit.kode_kelas.kd_kelas
       LEFT JOIN h05322_simmsit.guru_walikelas ON h05322_simmsit.kode_kelas.kd_kelas=h05322_simmsit.guru_walikelas.kd_kelas 
       WHERE h05322_simmsit.siswa_kelas.kd_kelas IN(36,37,38,50,61)
       GROUP BY kelas;                                                                                                                                                               
       
TRUNCATE siswa ;
/*** === angkatan 2006 **/
/** angkatan 2006, kelas 1 A**/
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       1 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=1;
       
/** angkatan 2006, kelas 1 B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       2 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=2;
       
/** angkatan 2006, kelas 1 C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       3 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=3;       
       
/** angkatan 2006, kelas 1 D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       4 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=4;              
       
/** angkatan 2006, kelas 2 A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       8 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=5;                     
       
/** angkatan 2006, kelas 2 B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       9 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=6;                            
       
/** angkatan 2006, kelas 2 C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       10 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=7;                                   
       
/** angkatan 2006, kelas 2 D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       11 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=8;                                          
       
/** angkatan 2006, kelas 3A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       15 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=9;                                                 
       
/** angkatan 2006, kelas 3B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       16 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=10;                                                        
       
/** angkatan 2006, kelas 3C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       17 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=11;                                                               
       
/** angkatan 2006, kelas 3D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       18 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=12;                                                                      
       
/** angkatan 2006, kelas 4A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       22 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=13;                                                                             

/** angkatan 2006, kelas 4C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       24 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=15;                                                                             
       
/** angkatan 2006, kelas 4D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       25 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=16;                                                                                    
       
/** angkatan 2006, kelas 5A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       29 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=17;                                                                                           
       
/** angkatan 2006, kelas 5B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       30 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=18;                                                                                                  
       
/** angkatan 2006, kelas 5C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       31 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=19;                                                                                                         
       
       
/** angkatan 2006, kelas 5D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       32 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=20;                                                                                                                
       
       
/** angkatan 2006, kelas 6A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       36 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=39;                                                                                                                       
       
/** angkatan 2006, kelas 6B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       37 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=40;                                                                                                                              
       
       
/** angkatan 2006, kelas 6C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       38 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=41;                                                                                                                                     


/** angkatan 2006, kelas 6D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 1 AS idangkatan, 
       39 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=42;                                                                                                                                     

set foreign_key_checks=1 ;
