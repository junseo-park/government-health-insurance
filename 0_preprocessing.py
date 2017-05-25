import pandas as pd
import numpy as np

# Manually compiled list of entries to remove from dataset that are not
# actual countries
to_remove = ['Arab World', 'Central Europe and the Baltics',
             'Caribbean small states', 'East Asia & Pacific (excluding high income)',
             'Early-demographic dividend', 'East Asia & Pacific',
             'Europe & Central Asia (excluding high income)', 'Europe & Central Asia',
             'Euro area', 'European Union', 'Fragile and conflict affected situations',
             'High income', 'Heavily indebted poor countries (HIPC)', 'IBRD only',
             'IDA & IBRD total', 'IDA total', 'IDA blend', 'IDA only',
             'Not classified', 'Latin America & Caribbean (excluding high income)',
             'Latin America & Caribbean', 'Least developed countries: UN classification',
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


# Helper function to delete observations in a dataframe if the country
# name is in the list of countries to remove
def delete_rows(df):
    # df: dataframe to be cleaned
    for i in range(len(df)):
        if df.loc[i, 'Country Name'] in to_remove:
            df.drop(i, inplace=True)

    return df


# Main function to clean data.
# Drops indicator name, indicator code, and 2016 (first two to declutter, latter due to empty data).
# Then melts the data by year, and replaces an unorthodox apostrophe in DPRK's entry with the common apostrophe.
# Lastly, exports as tsv into a new folder (saved in csv format).
def clean(file_name, value_name):
    # file_name: Name of file to be read in, as well as exported
    # value_name: Name of new column containing data points after pd.melt

    df = pd.read_csv('data/' + file_name + '/' + file_name + '.csv', header=2)

    df = df.drop(['Indicator Name', 'Indicator Code', '2016'], axis=1)
    df = delete_rows(df)
    df2 = pd.melt(df, id_vars=['Country Name', 'Country Code'],
                  var_name='Year', value_name=value_name)
    df2.replace(to_replace='Korea, Dem. People’s Rep.',
                value='Korea, Dem. People\'s Rep.', inplace=True)

    df2.to_csv('0_preprocessing/' + file_name + '.csv', sep='\t')


# Cleaning all datasets
clean('lifeexpectancy', 'Life Expectancy')
clean('infantmortality', 'Infant Mortality')
clean('gdp', 'GDP')
clean('netaid', 'Net Aid')
clean('healthexpenditure', 'Health Expenditure')
clean('militaryexpenditure', 'Military Expenditure')
clean('educationexpenditure', 'Education Expenditure')
clean('researchexpenditure', 'Research Expenditure')
