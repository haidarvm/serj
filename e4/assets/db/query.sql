LOAD DATA INFILE '/var/lib/mysql-files/insertUnitKerja.txt' INTO TABLE tlhp_unit_kerja FIELDS TERMINATED BY '\n' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'  (
	unit_kerja
);
