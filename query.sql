SELECT le.*, gdp.gdp, he.health_expenditure, ee.education_expenditure, me.military_expenditure, re.research_expenditure, na.net_aid
FROM lifeexpectancy AS le
INNER JOIN gdp
ON (le.country_code = gdp.country_code AND le.year = gdp.year)
INNER JOIN healthexpenditure AS he
ON (le.country_code = he.country_code AND le.year = he.year)
INNER JOIN educationexpenditure AS ee
ON (le.country_code = ee.country_code AND le.year = ee.year)
INNER JOIN militaryexpenditure AS me
ON (le.country_code = me.country_code AND le.year = me.year)
INNER JOIN researchexpenditure AS re
ON (le.country_code = re.country_code AND le.year = re.year)
INNER JOIN netaid AS na
ON (le.country_code = na.country_code AND le.year = na.year)
WHERE le.year BETWEEN '1995' AND '2015'