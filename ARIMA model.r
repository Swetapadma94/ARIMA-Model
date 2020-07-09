# ARIMA Models  ###########
install.packages(c("forecast","fpp","smooth","tseries"))
library(forecast)
library(fpp)
library(smooth)
library(tseries)
# Converting data into time series object
# Loading Aviation Data

aviation<-read.csv("E://srinivas excelr//Forecasting//Aviation.csv") # Aviation.csv
View(aviation)
amts<-ts(aviation$Sales,frequency = 4,start=c(86))
View(amts)
plot(amts)


train<-amts[1:38]
test<-amts[39:42] # Considering only 4 Quarters of data for testing because data itself is Quarterly
# seasonal data# dividing entire data into training and testing data 

# converting time series object
train<-ts(train,frequency = 4)
test<-ts(test,frequency = 4)
plot(train)
acf(train)
pacf(train)

# Auto.Arima model on the price agg data 
library(forecast)
model_AA <- auto.arima(train) 
m<-arima(train,order = c(0,1,0))
model_AA


acf(model_AA$residuals)

windows()
plot(forecast(model_AA,h=4
              ),xaxt="n") #xaxt- x axis text
# Forecasted values for the next 4 quarters
forecast_new <- data.frame(forecast(model_AA,h=4))
forecast_new





