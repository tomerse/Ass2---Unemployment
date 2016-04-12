---
title: "Ass2- Unemployment Rate"   
author: "Tomer Belzer & Tomer Segal"   
date: "April 12, 2016"   
output: html_document
---

# Ass2- Unemployment Rate
##Dataset Description:
The dataset is Categorized by Countries.
For each country The details are: it's continent,whether it's in the OECD or not, and the unemployment rate for each year beginning at 2000 ending at 2014

The original dataset was taken from:
http://data.worldbank.org/indicator/SL.UEM.TOTL.ZS?page=1

```{r}
head(unemployment)
```

![](https://github.com/tomerse/Ass2---Unemployment/blob/master/images/head.PNG)

##Dataset Analysis:

The chart on the right is The histogram for unemployment rate for all the countries that are not members of the OECD.

The chart on the left is The histogram for unemployment rate for all the countries that are members of the OECD.

```{r}
par(mfrow=c(1,2),mar=c(5,4,2,1))
hist(oecdMem(unemployment),main="UER in OECD members", col = "green", breaks = 100)
hist( oecdNotMem(unemployment),main="UER in non OECD members", col =" green" , breaks = 100)
```

![](https://github.com/tomerse/Ass2---Unemployment/blob/master/images/hist.PNG)

The following chart describes the unemployment rate of all the countries divided by continents for the years 2012 and 2014

In this charts we can see that the continent with the highest unemployment rate is Europe, and the continent with the lowest unemployment rate is Australia.

```{r}
avg <- matrix(lastYearsAvg(unemployment),ncol=6,byrow=TRUE)

colnames(avg) <- c("Europe","Asia","S America","N America","Africa","Australia")
rownames(avg) <- c("2012","2013","2014")
avg <- as.table(avg)

barplot(avg,legend=T,beside=T,main='avarage UER by continent between 2012-2014')
```

![](https://github.com/tomerse/Ass2---Unemployment/blob/master/images/2012-2014.PNG)

The next chart describes the unemployment rate for the years 2006 until 2014 for each continent. each dot represents the average unemployment rate for each year.
It is easy to notice a sharp increase between the years 2008 and 2009 for the continents: Europe, south America and North America.

```{r}
tbl <- createPaths(unemployment)

ggplot(tbl, aes(x = year, y = UER, colour = Continent)) + geom_line(aes(group = Continent)) + 
  geom_point()
  ```

![](https://github.com/tomerse/Ass2---Unemployment/blob/master/images/avg.PNG)

The following chart describes the unemployment rate in Europe before and after 2008. the charts on the right is after 2008 and the chart on the left is before 2008

```{r}
boxplot(before2008inEu(unemployment),after2008inEu(unemployment),col="blue",main="UER in EU before and after 2008")
```

![](https://github.com/tomerse/Ass2---Unemployment/blob/master/images/boxplot.PNG)

##Summary, Conclusions and Recommendations

According to the histogram we can see that the unemployment rate for non-OECD members is higher then OECD members. The reason might be that OECD members are more developed countries that has a stable economy.

The second chart shows that Europe has the highest average of unemployment rate between the years 2012 and 2014, This is quite surprising because Europe is a developed continent And we would expect to see lower unemployment rates, but given the economical crisis of 2008 we can conclude that Europe didn't Recover yet, and that's the reason for the high numbers.

The sharp increase between the years 2008 and 2009 for Europe, North America and South America in the third chart is most likely because of the economical crisis of 2008. We can see that although the unemployment rate grew down after 2010, all of those continent still hasn't recovered fully and hasn't went back to the old numbers of 2006 and 2007.

In conclusion we can say that the financial crisis of 2008 was shown in several charts and affected most on the developed countries and continents.

Our recommendation is to check what else happened during 2008 that might explain the high numbers of unemployment rates in Europe South America and Central America. Although the financial crisis is most likely the reason we would like to find additional reasons that might explain the numbers.
