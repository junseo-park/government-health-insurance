# preprocessing to run to make new datasets

import pandas as pd
import numpy as np
import os


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

def delete_rows(df):	# removes the observations that are not countries
    for i in range(len(df)):
        if df.loc[i, 'Country Name'] in to_remove:
            df.drop(i, inplace=True)
    return df

# takes in a folder of ugly data from worldbank and outputs a folder with cleanly formatted data
def create_newdata(uglydata_foldername, cleandata_foldername):	
	current_dir = os.getcwd()
	uglydata_dir = current_dir + "/" + uglydata_foldername
	list_of_uglydata = os.listdir(uglydata_dir)[1:]	# list of csv files that need to be formatted
	os.mkdir(cleandata_foldername)		# new folder with formatted data

	for csv in list_of_uglydata:
		df = pd.read_csv(uglydata_dir + "/" + csv, header=2)
		df = df.drop(['Indicator Name', 'Indicator Code', '2016'], axis=1)
		df = delete_rows(df)
		df = pd.melt(df, id_vars=['Country Name', 'Country Code'], var_name='Year', value_name=csv[:-4])
		df.replace(to_replace='Korea, Dem. People’s Rep.', value='Korea, Dem. People\'s Rep.', inplace=True)
		df.to_csv(current_dir + "/" + cleandata_foldername + "/" + csv, sep=";")


create_newdata("ugly_datasets", "clean_datasets")



