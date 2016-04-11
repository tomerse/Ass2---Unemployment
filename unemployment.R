setwd("~/R_workshop")
library(ggplot2)
source("tableFunc.R")

unemployment <- read.csv("C:/Users/HP/Desktop/tomer/dataset/country-unemployment_rate.csv",colClasses = c("character","character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

head(unemployment)

boxplot(before2008inEu(unemployment),after2008inEu(unemployment),col="blue",main="UER in EU before and after 2008")

avg <- matrix(lastYearsAvg(unemployment),ncol=6,byrow=TRUE)

colnames(avg) <- c("Europe","Asia","S America","N America","Africa","Australia")
rownames(avg) <- c("2012","2013","2014")
avg <- as.table(avg)

barplot(avg,legend=T,beside=T,main='avarage UER by continent between 2012-2014')
tbl <- createPaths(unemployment)

ggplot(tbl, aes(x = year, y = UER, colour = Continent)) + geom_line(aes(group = Continent)) + 
  geom_point()

par(mfrow=c(1,2),mar=c(5,4,2,1))
hist(oecdMem(unemployment),main="UER in OECD members", col = "green", breaks = 100)
hist( oecdNotMem(unemployment),main="UER in non OECD members", col =" green" , breaks = 100)
דד