import pandas as pd
import numpy as np

import os
os.getcwd()

to_remove = ['Arab World', 'Central Europe and the Baltics', 
'Caribbean small states', 'East Asia & Pacific (excluding high income)', 
'Early-demographic dividend', 'East Asia & Pacific', 
'Europe & Central Asia (excluding high income)','Europe & Central Asia',
'Euro area', 'European Union', 'Fragile and conflict affected situations',
'High income', 'Heavily indebted poor countries (HIPC)', 'IBRD only',
'IDA & IBRD total', 'IDA total', 'IDA blend', 'IDA only',
'Not classified', 'Latin America & Caribbean (excluding high income)',
'Latin America & Caribbean','Least developed countries: UN classification',
'Low income', 'Lower middle income', 'Low & middle income',
'Late-demographic dividend', 'Middle East & North Africa',
'Middle income', 'Middle East & North Africa (excluding high income)',
'North America', 'OECD members', 'Other small states',
'Pre-demographic dividend', 'Pacific island small states',
'Post-demographic dividend', 'South Asia',
'Sub-Saharan Africa (excluding high income)', 'Sub-Saharan Africa',
'Small states', 'East Asia & Pacific (IDA & IBRD countries)',
'Europe & Central Asia (IDA & IBRD countries)',
'Latin America & the Caribbean (IDA & IBRD countries)',
'Middle East & North Africa (IDA & IBRD countries)',
'South Asia (IDA & IBRD)', 'Sub-Saharan Africa (IDA & IBRD countries)',
'Upper middle income', 'World']

def delete_rows(df):
    for i in range(len(df)):
        if df.loc[i, 'Country Name'] in to_remove:
            df.drop(i, inplace=True)
    return df


df = pd.read_csv('~lifeexpectancy\lifeexpectancy.csv', header=2)
df.head()
df = df.drop(['Indicator Name', 'Indicator Code', '2016'], axis=1)
df = delete_rows(df)
df2 = pd.melt(df, id_vars=['Country Name', 'Country Code'], var_name='Year', value_name='Life Expectancy')
df2.replace(to_replace='Korea, Dem. People’s Rep.', value='Korea, Dem. People\'s Rep.', inplace=True)
df2.to_csv('lifeexpectancy/lifeexpectancy2.csv', sep=';')
df2.head()

df = pd.read_csv('~\Dropbox\Data Science\government-health-insurance\gdp\gdp.csv', header=2)
df.head()
df = df.drop(['Indicator Name', 'Indicator Code', '2016'], axis=1)
df = delete_rows(df)
df2 = pd.melt(df, id_vars=['Country Name', 'Country Code'], var_name='Year', value_name='GDP')
df2.replace(to_replace='Korea, Dem. People’s Rep.', value='Korea, Dem. People\'s Rep.', inplace=True)
df2.to_csv('gdp/gdp2.csv', sep=';')

df = pd.read_csv('~\Dropbox\Data Science\government-health-insurance\publicexpenditure\publicexpenditure.csv', header=2)
df.head()
df = df.drop(['Indicator Name', 'Indicator Code', '2016'], axis=1)
df = delete_rows(df)
df2 = pd.melt(df, id_vars=['Country Name', 'Country Code'], var_name='Year', value_name='Public Expenditure')
df2.replace(to_replace='Korea, Dem. People’s Rep.', value='Korea, Dem. People\'s Rep.', inplace=True)
df2.to_csv('publicexpenditure/publicexpenditure2.csv', sep=';')

