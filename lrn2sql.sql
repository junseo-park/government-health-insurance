SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS publichealth;
USE publichealth;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS lifeexpectancy(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
expectancy INT);

SELECT *
FROM lifeexpectancy;

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/government-health-insurance/lifeexpectancy/lifeexpectancy2.csv'
INTO TABLE lifeexpectancy
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummytesttable, country_name, country_code, @var1, expectancy)
SET date = STR_TO_DATE(@var1, '%Y');

CREATE TABLE IF NOT EXISTS gdp(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
gdp INT);

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/government-health-insurance/gdp/gdp2.csv'
INTO TABLE gdp
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, gdp)
SET date = STR_TO_DATE(@var1, '%Y');


CREATE TABLE IF NOT EXISTS publicexpenditure(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
pct_publicexpenditure DECIMAL(2, 2));

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/government-health-insurance/publicexpenditure/publicexpenditure2.csv'
INTO TABLE publicexpenditure
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, pct_publicexpenditure)
SET date = STR_TO_DATE(@var1, '%Y');


DROP TABLE publicexpenditure;
SELECT * FROM publicexpenditure;


SELECT le.*, gdp.gdp, pe.pct_publicexpenditure
FROM lifeexpectancy AS le
INNER JOIN gdp
ON le.country_code = gdp.country_code
INNER JOIN publicexpenditure AS pe
ON le.country_code = pe.country_code
WHERE le.date >= '1995';