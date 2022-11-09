import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
import statsmodels.formula.api as smf

file = r'/Users/yehui/Documents/Code/Num_Analysis_Ex/课程项目2/by.csv'

data = pd.read_csv(file)

print(data.head(5))

X = data[['season','yr','mnth','holiday','weekday','workingday','weathersit','temp','atemp','hum','windspeed']]
Y = data['cnt']

model = LinearRegression()
model.fit(X,Y)

print(model.coef_)
print(model.intercept_)
# data.columns = [,,,,,,,,,]