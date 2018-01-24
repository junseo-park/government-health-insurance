import pandas as pd
import numpy as np
import pymysql
import matplotlib.pyplot as plt
import seaborn as sns
from pandas.tools.plotting import scatter_matrix
import statsmodels.api as sm
from sklearn import linear_model



# Establishing connection to localhost using pymysql package. Connecting
# to publichealth database and creating a cursor for the database.
db = pymysql.connect(host="localhost", user="root",
                     password="abc123lemon", db="publichealth")
cursor = db.cursor()


# Opening file to read in SQL query
file = open('query.sql', 'r')
query = file.read()
#print(query)
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
#headers = ['country', 'country_code', 'year', 'life_expectancy',
#           'gdp', 'health', 'education', 'military', 'research', 'net_aid']
headers2 = ['country', 'country_code', 'year', 'life_expectancy', 'gdp', 'net_aid']
df = pd.DataFrame(list(data), columns=headers2)
df.year = pd.to_datetime(df.year, format='%Y')
df.fillna(value=np.nan, inplace=True)
df

#df.to_csv('output.csv')

#-----------------------------------------------------------------------------------

X = df[['gdp']]
X_train = X[:-20]
X_test = X[-20:]
y_train = df[['life_expectancy']][:-20]
y_test = df[['life_expectancy']][-20:]

regr = linear_model.LinearRegression()
regr.fit(X_train, y_train)





for i in range(len(df)):
    for j in headers[3:9]:
        df.ix[,i j] = float(df.ix[i, j])
    
type(df.ix[i,'gdp'])





sns.pairplot(df, vars=['life_expectancy', 'gdp'], hue='year')
sns.plt.show()
plt.scatter(x=df.gdp, y=df.life_expectancy, alpha=0.2)
plt.show()




#-------------------------------------------------------------------------------
df_adv = pd.read_csv('http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv', index_col=0)
df_adv.head()
