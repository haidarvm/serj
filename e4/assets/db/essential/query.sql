LOAD DATA INFILE '/var/lib/mysql-files/insertUnitKerja.txt' INTO TABLE tlhp_unit_kerja FIELDS TERMINATED BY '\n' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n'  (
	unit_kerja
);

LOAD DATA INFILE 'detection.csv'
INTO TABLE atlet_profile
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
(full_name, gender, jabatan_id, cabor_id)
