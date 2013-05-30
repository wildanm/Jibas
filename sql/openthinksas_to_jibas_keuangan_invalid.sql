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


/** angkatan 2006, kelas 7A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 3 AS idangkatan, 
       43 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=21;                                                                                                                                     
       
       
/** angkatan 2006, kelas 7B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 3 AS idangkatan, 
       44 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=22;                                                                                                                                            
       
/** angkatan 2006, kelas 7C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 3 AS idangkatan, 
       45 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=23;                                                                                                                                                   
       
/** angkatan 2006, kelas 7D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 3 AS idangkatan, 
       46 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2006' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=24;  
       
/** angakatan 2006, SMP dan SMPA tidak ada datanya **/                                                                                                                                                        

/** angkatan 2007, kelas 1A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       85 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=1; 
       
/** angkatan 2007, kelas 1B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       86 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=2;         
       
/** angkatan 2007, kelas 1C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       87 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=3;                
       
/** angkatan 2007, kelas 1D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       88 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=4;                       
       
/** angkatan 2007, kelas 2A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       92 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=5;                       
       
/** angkatan 2007, kelas 2B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       93 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=6;                              
       
/** angkatan 2007, kelas 2C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       94 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=7;                                     
       
/** angkatan 2007, kelas 2D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       95 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=8;                                            
       
/** angkatan 2007, kelas 3A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       99 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=9;                                                   
       
/** angkatan 2007, kelas 3B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       100 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=10;                                                          

/** angkatan 2007, kelas 3C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       101 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=11;         
       
/** angkatan 2007, kelas 3D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       102 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=12;                
       
/** angkatan 2007, kelas 4A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       106 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=13;                       
       
/** angkatan 2007, kelas 4B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       107 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=14;                              
       
/** angkatan 2007, kelas 4C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       108 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=15;                                     
       
/** angkatan 2007, kelas 4D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       109 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=16;
       
/** angkatan 2007, kelas 5A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       113 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=17;                                                   
       
/** angkatan 2007, kelas 5B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       114 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=18;                                                          
       
/** angkatan 2007, kelas 5C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       115 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=19;                                                                 
       
/** angkatan 2007, kelas 5D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       116 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=20;                                                                        
       
/** angkatan 2007, kelas 6A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       120 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=39;   
       
/** angkatan 2007, kelas 6B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       121 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=40;                                                                                       
       
/** angkatan 2007, kelas 6C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       122 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=41;                                                                                              
       
/** angkatan 2007, kelas 6C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       123 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=42;                                                                                                     
       
       
/** angkatan 2007, kelas 7A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       127 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=21;    
       
       
/** angkatan 2007, kelas 7B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       128 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=22;     
       
/** angkatan 2007, kelas 7C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       129 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=23;     
       
/** angkatan 2007, kelas 7D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       130 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=24;                                                                                                                         
       
/** angkatan 2007, kelas 8A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       134 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=25;  
       
/** angkatan 2007, kelas 8B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       135 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=26;                                                                                                                                       
       
       
/** angkatan 2007, kelas 8C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       136 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=27;  
                                                                                                                                                   
/** angkatan 2007, kelas 8D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       137 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=28;  
       
/** angkatan 2007, kelas 9A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       141 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=29;  
       
/** angkatan 2007, kelas 9B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       142 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=43;    
       
/** angkatan 2007, kelas 9C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       143 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=44;               
       
/** angkatan 2007, kelas 9D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       144 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=45;                      
       
/** angkatan 2007, kelas XA**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       148 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=30;                             
       
/** angkatan 2007, kelas XB**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       149 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=31;                                    
       
/** angkatan 2007, kelas XC**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       150 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=32;
       
/** angkatan 2007, kelas XD**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       151 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=48;                                           
       
/** angkatan 2007, kelas XI IPA 1**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       155 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=34;                                                  
       
/** angkatan 2007, kelas XI IPA 2**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       156 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=33;        
       
/** angkatan 2007, kelas XI IPS 1**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       157 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=35;               
       
/** angkatan 2007, kelas XI IPS 2**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       158 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=49; 
       
/** angkatan 2007, kelas XII IPA 1**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       162 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=37;                             
       
       
/** angkatan 2007, kelas XII IPA 2**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       163 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=36;                                    
       
/** angkatan 2007, kelas XII IPS 1**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       164 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=50;                                           
       
/** angkatan 2007, kelas XII IPS 2**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 5 AS idangkatan, 
       165 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2007' 
       AND h05322_simmsit.siswa_kelas.kd_kelas=61;                                                  
       
/** angkatan 2008, kelas 1A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       169 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=1;                                                  
       
/** angkatan 2008, kelas 1B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       170 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=2;                                                         
       
/** angkatan 2008, kelas 1C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       171 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=3;                                                                
       
/** angkatan 2008, kelas 1D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       172 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=4;                                                                       
       
/** angkatan 2008, kelas 2A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       176 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=5;                                                                              
       
/** angkatan 2008, kelas 2B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       177 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=6;                                                                                     
       
       
/** angkatan 2008, kelas 2C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       178 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=7;                                                                                            
       
/** angkatan 2008, kelas 2D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       179 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=8;                                                                                             
       
/** angkatan 2008, kelas 3A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       183 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=9;                                                                                                          
       
/** angkatan 2008, kelas 3B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       184 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=10;                                                                                                                 
       
/** angkatan 2008, kelas 3C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       185 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=11;                                                                                                                        
       
/** angkatan 2008, kelas 3D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       186 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=12;                                                                                                                               
       
/** angkatan 2008, kelas 4A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       190 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=13;                                                                                                                                      
       
/** angkatan 2008, kelas 4B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       191 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=14;                                                                                                                                             
       
/** angkatan 2008, kelas 4C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       192 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=15;                                                                                                                                                    
       
/** angkatan 2008, kelas 4D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       193 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=16;                                                                                                                                                           
       
/** angkatan 2008, kelas 5A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       197 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=17;                                                                                                                                                                  
       
/** angkatan 2008, kelas 5B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       198 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=18;                                                                                                                                                                         


/** angkatan 2008, kelas 5C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       199 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=19;                                                                                                                                                                         

/** angkatan 2008, kelas 5D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       200 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=20;                                                                                                                                                                         

/** angkatan 2008, kelas 6A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       204 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=39;                                                                                                                                                                         

/** angkatan 2008, kelas 6B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       205 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=40;                                                                                                                                                                         
       
/** angkatan 2008, kelas 6C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       206 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=41;                                                                                                                                                                         

/** angkatan 2008, kelas 6D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       207 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=42;                                                                                                                                                                         

/** angkatan 2008, kelas 7A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       211 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=21;      
       
/** angkatan 2008, kelas 7B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       212 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=22;                                                                                                                                                                             

/** angkatan 2008, kelas 7C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       213 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=23;                                                                                                                                                                             

/** angkatan 2008, kelas 7D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       214 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=24;                                                                                                                                                                             

/** angkatan 2008, kelas 8A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       218 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=25;                                                                                                                                                                             

/** angkatan 2008, kelas 8B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       219 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=26;                                                                                                                                                                             

/** angkatan 2008, kelas 8C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       220 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=27;                                                                                                                                                                             

/** angkatan 2008, kelas 8D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       221 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=28;                                                                                                                                                                             

/** angkatan 2008, kelas 9A**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       225 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=29;                                                                                                                                                                             

/** angkatan 2008, kelas 9B**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       226 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=43;                                                                                                                                                                             

/** angkatan 2008, kelas 9C**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       227 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=44;                                                                                                                                                                             

/** angkatan 2008, kelas 9D**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       228 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=45;                                                                                                                                                                             

/** angkatan 2008, kelas XA**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       232 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=30;                                                                                                                                                                             

/** angkatan 2008, kelas XB**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       233 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=31;                                                                                                                                                                             

/** angkatan 2008, kelas XC**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       234 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=32;                                                                                                                                                                             

/** angkatan 2008, kelas XD**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       235 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=48;                                                                                                                                                                             

/** angkatan 2008, kelas XI IPA 1**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       239 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=34;                                                                                                                                                                             

/** angkatan 2008, kelas XI IPA 2**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       240 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=33;                                                                                                                                                                             

/** angkatan 2008, kelas XI IPS 1**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       241 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=35;                                                                                                                                                                             

/** angkatan 2008, kelas XI IPS 2**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       242 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=49;                                                                                                                                                                             

/** angkatan 2008, kelas XII IPA 1**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       246 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=37;                                                                                                                                                                             

/** angkatan 2008, kelas XII IPA 2**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       247 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=36;                                                                                                                                                                             

/** angkatan 2008, kelas XII IPS 1**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       248 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=50;                                                                                                                                                                             

/** angkatan 2008, kelas XII IPS 2**/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 9 AS idangkatan, 
       249 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2008'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=61;                                                                                                                                                                             

/** angkatan 2009, kelas 1A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       253 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=1;                                                                                                                                                                             
       
/** angkatan 2009, kelas 1B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       254 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=2;   
       
/** angkatan 2009, kelas 1C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       255 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=3;                                                                                                                                                                                            

/** angkatan 2009, kelas 1D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       256 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=4;                                                                                                                                                                                            

/** angkatan 2009, kelas 2A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       260 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=5;                                                                                                                                                                                            

/** angkatan 2009, kelas 2B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       261 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=6;                                                                                                                                                                                            

/** angkatan 2009, kelas 2C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       262 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=7;                                                                                                                                                                                            

/** angkatan 2009, kelas 2D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       263 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=8;                                                                                                                                                                                            

/** angkatan 2009, kelas 3A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       267 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=9;                                                                                                                                                                                            

/** angkatan 2009, kelas 3B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       268 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=10;                                                                                                                                                                                            

/** angkatan 2009, kelas 3C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       269 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=11;                                                                                                                                                                                            

/** angkatan 2009, kelas 3D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       270 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=12;                                                                                                                                                                                            

/** angkatan 2009, kelas 4A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       274 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=13;                                                                                                                                                                                            

/** angkatan 2009, kelas 4B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       275 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=14;                                                                                                                                                                                            

/** angkatan 2009, kelas 4C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       276 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=15;                                                                                                                                                                                            

/** angkatan 2009, kelas 4D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       277 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=16;                                                                                                                                                                                            

/** angkatan 2009, kelas 5A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       281 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=17;                                                                                                                                                                                            

/** angkatan 2009, kelas 5B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       282 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=18;                                                                                                                                                                                            

/** angkatan 2009, kelas 5C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       283 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=19;                                                                                                                                                                                            

/** angkatan 2009, kelas 5D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       284 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=20;                                                                                                                                                                                            

/** angkatan 2009, kelas 6A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       288 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=39;                                                                                                                                                                                            

/** angkatan 2009, kelas 6B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       289 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=40;                                                                                                                                                                                            

/** angkatan 2009, kelas 6C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       290 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=41;                                                                                                                                                                                            

/** angkatan 2009, kelas 6D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 13 AS idangkatan, 
       291 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=42;                                                                                                                                                                                            

/** angkatan 2009, kelas 7A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 15 AS idangkatan, 
       295 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=21;                                                                                                                                                                                            

/** angkatan 2009, kelas 7B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 15 AS idangkatan, 
       296 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=22;                                                                                                                                                                                            

/** angkatan 2009, kelas 7C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 15 AS idangkatan, 
       297 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=23;                                                                                                                                                                                            

/** angkatan 2009, kelas 7D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 15 AS idangkatan, 
       298 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=24;                                                                                                                                                                                            

/** angkatan 2009, kelas 8A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 15 AS idangkatan, 
       302 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=25;                                                                                                                                                                                            

/** angkatan 2009, kelas 8B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 15 AS idangkatan, 
       303 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=26;                                                                                                                                                                                            

/** angkatan 2009, kelas 8C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 15 AS idangkatan, 
       304 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=27;                                                                                                                                                                                            

/** angkatan 2009, kelas 8D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 15 AS idangkatan, 
       305 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=28;                                                                                                                                                                                            

/** angkatan 2009, kelas 9A **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       309 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=29;                                                                                                                                                                                            

/** angkatan 2009, kelas 9B **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       310 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=43;                                                                                                                                                                                            

/** angkatan 2009, kelas 9C **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       311 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=44;                                                                                                                                                                                            
       
/** angkatan 2009, kelas 9D **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       312 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=45;                                                                                                                                                                                                   

/** angkatan 2009, kelas XA **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       316 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=30;                                                                                                                                                                                                   

/** angkatan 2009, kelas XB **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       317 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=31;                                                                                                                                                                                                   

/** angkatan 2009, kelas XC **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       318 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=32;                                                                                                                                                                                                   

/** angkatan 2009, kelas XD **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       319 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=48;                                                                                                                                                                                                   

/** angkatan 2009, kelas XI IPA 1 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       323 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=34;                                                                                                                                                                                                   

/** angkatan 2009, kelas XI IPA 2 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       324 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=33;                                                                                                                                                                                                   

/** angkatan 2009, kelas XI IPS 1 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       325 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=35;                                                                                                                                                                                                   
       
/** angkatan 2009, kelas XI IPS 2 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       326 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=49;                                                                                                                                                                                                          

/** angkatan 2009, kelas XII IPA 1 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       330 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=37;                                                                                                                                                                                                          

/** angkatan 2009, kelas XII IPA 2 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       331 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=36;                                                                                                                                                                                                          

/** angkatan 2009, kelas XII IPS 1 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       332 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=50;                                                                                                                                                                                                          

/** angkatan 2009, kelas XII IPS 2 **/       
INSERT IGNORE INTO siswa (nis, nisn, nama, panggilan, aktif, tahunmasuk, idangkatan, idkelas) 
       SELECT siswa.nis, nisn, nama, panggilan, 1 AS aktif,  h05322_simmsit.siswa_kelas.tahun AS tahunmasuk, 16 AS idangkatan, 
       333 AS idkelas FROM h05322_simmsit.siswa LEFT JOIN h05322_simmsit.siswa_kelas ON 
       h05322_simmsit.siswa.nis=h05322_simmsit.siswa_kelas.nis WHERE h05322_simmsit.siswa_kelas.tahun='2009'        
       AND h05322_simmsit.siswa_kelas.kd_kelas=61;                                                                                                                                                                                                          
       
              
set foreign_key_checks=1 ;
