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

/** angkatan 2012, kelas 1A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       505 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=1;                                                                                                                                                                             
       
/** angkatan 2009, kelas 1B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       506 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=2;   
       
/** angkatan 2009, kelas 1C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       507 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=3;                                                                                                                                                                                            

/** angkatan 2009, kelas 1D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       508 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=4;                                                                                                                                                                                            

/** angkatan 2009, kelas 2A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       512 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=5;                                                                                                                                                                                            

/** angkatan 2009, kelas 2B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       513 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=6;                                                                                                                                                                                            

/** angkatan 2009, kelas 2C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       514 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=7;                                                                                                                                                                                            

/** angkatan 2009, kelas 2D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       515 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=8;                                                                                                                                                                                            

/** angkatan 2009, kelas 3A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       519 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=9;                                                                                                                                                                                            

/** angkatan 2009, kelas 3B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       520 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=10;                                                                                                                                                                                            

/** angkatan 2009, kelas 3C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       521 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=11;                                                                                                                                                                                            

/** angkatan 2009, kelas 3D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       522 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=12;                                                                                                                                                                                            

/** angkatan 2009, kelas 4A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       526 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=13;                                                                                                                                                                                            

/** angkatan 2009, kelas 4B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       527 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=14;                                                                                                                                                                                            

/** angkatan 2009, kelas 4C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       528 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=15;                                                                                                                                                                                            

/** angkatan 2009, kelas 4D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       529 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=16;                                                                                                                                                                                            

/** angkatan 2009, kelas 5A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       533 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=17;                                                                                                                                                                                            

/** angkatan 2009, kelas 5B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       534 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=18;                                                                                                                                                                                            

/** angkatan 2009, kelas 5C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       535 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=19;                                                                                                                                                                                            

/** angkatan 2009, kelas 5D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       536 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=20;                                                                                                                                                                                            

/** angkatan 2009, kelas 6A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       540 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=39;                                                                                                                                                                                            

/** angkatan 2009, kelas 6B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       541 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=40;                                                                                                                                                                                            

/** angkatan 2009, kelas 6C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       542 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=41;                                                                                                                                                                                            

/** angkatan 2009, kelas 6D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 25 AS idangkatan, 
       543 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=42;                                                                                                                                                                                            

/** angkatan 2009, kelas 7A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       547 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=21;                                                                                                                                                                                            

/** angkatan 2009, kelas 7B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       548 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=22;                                                                                                                                                                                            

/** angkatan 2009, kelas 7C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       549 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=23;                                                                                                                                                                                            

/** angkatan 2009, kelas 7D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       550 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=24;                                                                                                                                                                                            

/** angkatan 2009, kelas 8A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       554 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=25;                                                                                                                                                                                            

/** angkatan 2009, kelas 8B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       555 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=26;                                                                                                                                                                                            

/** angkatan 2009, kelas 8C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       556 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=27;                                                                                                                                                                                            

/** angkatan 2009, kelas 8D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       557 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=28;                                                                                                                                                                                            

/** angkatan 2009, kelas 9A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       561 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=29;                                                                                                                                                                                            

/** angkatan 2009, kelas 9B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       562 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=43;                                                                                                                                                                                            

/** angkatan 2009, kelas 9C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       563 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=44;                                                                                                                                                                                            
       
/** angkatan 2009, kelas 9D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 27 AS idangkatan, 
       564 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=45;                                                                                                                                                                                                   

/** angkatan 2009, kelas XA **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       568 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=30;                                                                                                                                                                                                   

/** angkatan 2009, kelas XB **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       569 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=31;                                                                                                                                                                                                   

/** angkatan 2009, kelas XC **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       570 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=32;                                                                                                                                                                                                   

/** angkatan 2009, kelas XD **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       571 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=48;                                                                                                                                                                                                   

/** angkatan 2009, kelas XI IPA 1 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       575 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=34;                                                                                                                                                                                                   

/** angkatan 2009, kelas XI IPA 2 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       576 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=33;                                                                                                                                                                                                   

/** angkatan 2009, kelas XI IPS 1 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       577 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=35;                                                                                                                                                                                                   
       
/** angkatan 2009, kelas XI IPS 2 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       578 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=49;                                                                                                                                                                                                          

/** angkatan 2009, kelas XII IPA 1 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       582 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=37;                                                                                                                                                                                                          

/** angkatan 2009, kelas XII IPA 2 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       583 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=36;                                                                                                                                                                                                          

/** angkatan 2009, kelas XII IPS 1 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       584 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=50;                                                                                                                                                                                                          

/** angkatan 2009, kelas XII IPS 2 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 28 AS idangkatan, 
       585 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2012'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=61;                                                                                                                                                                                                          
       
/** set tahun ajaran yang aktif hanya TA 2012/2013 **/
UPDATE tahunajaran SET aktif=0 ;
UPDATE tahunajaran SET aktif=1 WHERE tahunajaran='2012/2013' ;

/** set angkatan yang aktif hanya TA 2012/2013 **/
UPDATE angkatan SET aktif=0 ;
UPDATE angkatan SET aktif=1 WHERE angkatan='2012' ;
              
set foreign_key_checks=1 ;
