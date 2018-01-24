DROP DATABASE publichealth;
#SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS publichealth;
USE publichealth;

CREATE TABLE IF NOT EXISTS lifeexpectancy (
    country_name VARCHAR(30) NOT NULL,
    country_code VARCHAR(4) NOT NULL,
    year VARCHAR(4) NOT NULL,
    expectancy FLOAT
);

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/lifeexpectancy.csv'
INTO TABLE lifeexpectancy
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, year, @var1)
SET	expectancy = NULLIF(@var1, '');

CREATE TABLE IF NOT EXISTS infantmortality (
    country_name VARCHAR(30) NOT NULL,
    country_code VARCHAR(4) NOT NULL,
    year VARCHAR(4) NOT NULL,
    mortality FLOAT
);

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/infantmortality.csv'
INTO TABLE infantmortality
FIELDS TERMINATED  BY  '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, year, @var1)
SET	mortality = NULLIF(@var1, '');


CREATE TABLE IF NOT EXISTS gdp (
    country_name VARCHAR(30) NOT NULL,
    country_code VARCHAR(4) NOT NULL,
    year VARCHAR(4) NOT NULL,
    gdp FLOAT
);

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/gdp.csv'
INTO TABLE gdp
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, year, @var1)
SET	gdp = NULLIF(@var1, '');


/*CREATE TABLE IF NOT EXISTS healthexpenditure (
    country_name VARCHAR(30) NOT NULL,
    country_code VARCHAR(4) NOT NULL,
    year VARCHAR(4) NOT NULL,
    health_expenditure FLOAT
);

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/healthexpenditure.csv'
INTO TABLE healthexpenditure
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, year, @var1)
SET	health_expenditure = NULLIF(@var1, '');
*/

CREATE TABLE IF NOT EXISTS netaid (
    country_name VARCHAR(30) NOT NULL,
    country_code VARCHAR(4) NOT NULL,
    year VARCHAR(4) NOT NULL,
    net_aid INT
);

LOAD DATA LOCAL  INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/netaid.csv'
INTO TABLE netaid
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, year, @var1)
SET	net_aid = NULLIF(@var1, '');


/*CREATE TABLE IF NOT EXISTS militaryexpenditure (
    country_name VARCHAR(30) NOT NULL,
    country_code VARCHAR(4) NOT NULL,
    year VARCHAR(4) NOT NULL,
    military_expenditure FLOAT
);

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/militaryexpenditure.csv'
INTO TABLE militaryexpenditure
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, year, @var1)
SET	military_expenditure = NULLIF(@var1, '');


CREATE TABLE IF NOT EXISTS educationexpenditure (
    country_name VARCHAR(30) NOT NULL,
    country_code VARCHAR(4) NOT NULL,
    year VARCHAR(4) NOT NULL,
    education_expenditure FLOAT
);

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/educationexpenditure.csv'
INTO TABLE educationexpenditure
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, year, @var1)
SET	education_expenditure = NULLIF(@var1, '');


CREATE TABLE IF NOT EXISTS researchexpenditure (
    country_name VARCHAR(30) NOT NULL,
    country_code VARCHAR(4) NOT NULL,
    year VARCHAR(4) NOT NULL,
    research_expenditure FLOAT
);

LOAD DATA LOCAL INFILE 'C:/Users/Jun Seo/Dropbox/Data Science/public-health/0_preprocessing/researchexpenditure.csv'
INTO TABLE researchexpenditure
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@dummy, country_name, country_code, year, @var1)
SET	research_expenditure = NULLIF(@var1, '');
*/


#SHOW VARIABLES LIKE 'secure_file_priv';