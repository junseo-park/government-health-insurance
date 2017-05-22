SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS publichealth;
USE publichealth;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS lifeexpectancy(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
expectancy DECIMAL(4, 2));

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/lifeexpectancy.csv'
INTO TABLE lifeexpectancy
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, expectancy)
SET date = STR_TO_DATE(@var1, '%Y');


CREATE TABLE IF NOT EXISTS infantmortality(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
mortality DECIMAL(5, 2));

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/infantmortality.csv'
INTO TABLE infantmortality
FIELDS TERMINATED  BY  ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, mortality)
SET date = STR_TO_DATE(@var1, '%Y');


CREATE TABLE IF NOT EXISTS gdp(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
gdp DECIMAL(8, 2));

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/gdp.csv'
INTO TABLE gdp
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, gdp)
SET date = STR_TO_DATE(@var1, '%Y');


CREATE TABLE IF NOT EXISTS healthexpenditure(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
healthexpenditure DECIMAL(4, 2));

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/healthexpenditure.csv'
INTO TABLE healthexpenditure
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, healthexpenditure)
SET date = STR_TO_DATE(@var1, '%Y');


CREATE TABLE IF NOT EXISTS netaid(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
netaid INT);

LOAD DATA LOCAL  INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/netaid.csv'
INTO TABLE netaid
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, netaid)
SET date = STR_TO_DATE(@var1, '%Y');


CREATE TABLE IF NOT EXISTS militaryexpenditure(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
militaryexpenditure DECIMAL(4, 2));

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/militaryexpenditure.csv'
INTO TABLE militaryexpenditure
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, militaryexpenditure)
SET date = STR_TO_DATE(@var1, '%Y');


CREATE TABLE IF NOT EXISTS educationexpenditure(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
educationexpenditure DECIMAL(4, 2));

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/educationexpenditure.csv'
INTO TABLE educationexpenditure
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, educationexpenditure)
SET date = STR_TO_DATE(@var1, '%Y');


CREATE TABLE IF NOT EXISTS researchexpenditure(
country_name VARCHAR(30) NOT NULL,
country_code VARCHAR(4) NOT NULL,
date DATE NOT NULL,
researchexpenditure DECIMAL(4, 2));

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/researchexpenditure.csv'
INTO TABLE researchexpenditure
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, @var1, researchexpenditure)
SET date = STR_TO_DATE(@var1, '%Y');

SELECT le.*, gdp.gdp, he.healthexpenditure#, ee.educationexpenditure, me.militaryexpenditure, re.researchexpenditure, na.netaid
FROM lifeexpectancy AS le
INNER JOIN gdp
ON (le.country_code = gdp.country_code AND le.date = gdp.date)
INNER JOIN healthexpenditure AS he
ON (le.country_code = he.country_code AND le.date = he.date)
#INNER JOIN educationexpenditure AS ee
#ON (le.country_code = ee.country_code AND le.date = ee.date)
#INNER JOIN militaryexpenditure AS me
#ON (le.country_code = me.country_code AND le.date = me.date)
#INNER JOIN researchexpenditure AS re
#ON (le.country_code = re.country_code AND le.date = re.date)
#INNER JOIN netaid AS na
#ON (le.country_code = na.country_code AND le.date = na.date)
WHERE le.date >= '1995';

SELECT * from  lifeexpectancy;