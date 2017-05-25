import pandas as pd
import numpy as np
import pymysql


# Establishing connection to localhost using pymysql package. Connecting
# to publichealth database and creating a cursor for the database.
db = pymysql.connect(host="localhost", user="root",
                     password="abc123lemon", db="publichealth")
cursor = db.cursor()


# Opening file to read in SQL query
file = open('query.sql', 'r')
query = file.read()
# print(fileContents)
file.close()


# Command to execute SQL query using the database cursor, then saving all
# results to a variable. Closing database.
cursor.execute(query)
data = cursor.fetchall()
# print(type(data))
# print(data)
db.close()


# Creating a database using queried data. Since data is formatted as tuple
# of tuples, use list(data) to create dataframe. Format year as datetime,
# and replace None values with numpy NaN values.
headers = ['country', 'country_code', 'year', 'life_expectancy',
           'gdp', 'health', 'education', 'military', 'research', 'net_aid']
df = pd.DataFrame(list(data), columns=headers)
df.year = pd.to_datetime(df.year, format='%Y')
df.fillna(value=np.nan, inplace=True)
#df.head()

#df.to_csv('output.csv')
