"""
####################################################################################################
This script helps you to work with dates using python.
####################################################################################################
"""
from datetime import datetime as dt
from workdays import workday
from pandas import DataFrame, date_range
today = dt.now() #retrieve your machine local date and time
year = dt.now().strftime("%y")
YEAR = dt.now().strftime("%Y")
formatted_today = dt.now().strftime("%m/%d/%y") ####formatted date
############### example 1
#### this example will show you how to use workday with python
days = [
    {   
        "starts":today,
        "days":50
    },
    {   
        "starts":today,
        "days":30
    },
    {   
        "starts":today,
        "days":20
    }
] #Dictionary/JSON format
df_days = DataFrame(days)
df_days['future_date'] = df_days.apply(lambda x: workday(x['starts'], x['days']), axis=1)
df_days['days pass'] =  df_days['future_date'] - df_days['starts']
df_days['future_date'] = df_days['future_date'].dt.strftime("%m/%d/%y")
print(df_days)

############### example 2
#### this example will show you how to get a list of days
week_freq = ['W-MON', 'W-TUE', 'W-WED', 'W-THU', 'W-FRI']
days_of_the_week = []
for week in week_freq:
    weeks = date_range(start=f'{YEAR}-01-01', end=f'{YEAR}-12-31', freq=f'{week}') #freq is optional, if you want to retrieve all dates just remove it
    weeks.strftime('%m-%d-%y')
    days_of_the_week.extend(weeks)
calendar = DataFrame(days_of_the_week)
calendar.rename(columns = {0:'Date'}, inplace = True)
calendar.sort_values(by='Date', axis=0, inplace=True, ignore_index=True)
print(calendar)