library(ggplot2)

continentAvarage <- function(table, cont, year){
  n <- nrow(table)
  sum <- 0
  ncountInCont <- 0
  for(i in 1:n){
    if(table$Continent[i] == cont){
      sum <- sum + year[i]
      ncountInCont <- ncountInCont + 1
    }
  }
  return(sum/ncountInCont)
}

lastYearsAvg <- function(unemployment){
  eu2012 <- continentAvarage(unemployment, "Europe", unemployment$X2012)
  as2012 <- continentAvarage(unemployment, "Asia", unemployment$X2012)
  sa2012 <- continentAvarage(unemployment, "South America", unemployment$X2012)
  na2012 <- continentAvarage(unemployment, "North America", unemployment$X2012)
  af2012 <- continentAvarage(unemployment, "Africa", unemployment$X2012)
  au2012 <- continentAvarage(unemployment, "Australia", unemployment$X2012)
  eu2013 <- continentAvarage(unemployment, "Europe", unemployment$X2013)
  as2013 <- continentAvarage(unemployment, "Asia", unemployment$X2013)
  sa2013 <- continentAvarage(unemployment, "South America", unemployment$X2013)
  na2013 <- continentAvarage(unemployment, "North America", unemployment$X2013)
  af2013 <- continentAvarage(unemployment, "Africa", unemployment$X2013)
  au2013 <- continentAvarage(unemployment, "Australia", unemployment$X2013)
  eu2014 <- continentAvarage(unemployment, "Europe", unemployment$X2014)
  as2014 <- continentAvarage(unemployment, "Asia", unemployment$X2014)
  sa2014 <- continentAvarage(unemployment, "South America", unemployment$X2014)
  na2014 <- continentAvarage(unemployment, "North America", unemployment$X2014)
  af2014 <- continentAvarage(unemployment, "Africa", unemployment$X2014)
  au2014 <- continentAvarage(unemployment, "Australia", unemployment$X2014)
  ans <- c(eu2012, as2012, sa2012, na2012, af2012, au2012, eu2013, as2013, sa2013, na2013, af2013, au2013, eu2014, as2014, sa2014, na2014, af2014, au2014)
  return(ans)
}

createPath <- function(unemployment, continent){
  uer2006 <- continentAvarage(unemployment, continent, unemployment$X2006)
  uer2007 <- continentAvarage(unemployment, continent, unemployment$X2007)
  uer2008 <- continentAvarage(unemployment, continent, unemployment$X2008)
  uer2009 <- continentAvarage(unemployment, continent, unemployment$X2009)
  uer2010 <- continentAvarage(unemployment, continent, unemployment$X2010)
  uer2011 <- continentAvarage(unemployment, continent, unemployment$X2011)
  uer2012 <- continentAvarage(unemployment, continent, unemployment$X2012)
  uer2013 <- continentAvarage(unemployment, continent, unemployment$X2013)
  uer2014 <- continentAvarage(unemployment, continent, unemployment$X2014)
  uer <- c(uer2006,uer2007,uer2008,uer2009,uer2010,uer2011,uer2012,uer2013,uer2014)
  return(uer)
}

createPaths <- function(unemployment){
  continents <- c("Europe","Asia","Africa","South America","North America")
  tbl <- data.frame(year = letters[1:45], 
                    Continent = as.character(1:5), 
                    uer = 1:45, stringsAsFactors = FALSE)
  for(i in 1:5){
    avg <- createPath(unemployment, continents[i])
    for(k in 1:9){
      tbl[(k+(i-1)*9),"year"] <- k + 2005
      tbl[(k+(i-1)*9),"Continent"] <- continents[i]
      tbl[(k+(i-1)*9),"UER"] <- avg[k]
    }
  }
  
  return(tbl)
}

before2008inEu <- function(une){
  ans <- c()
  n <- nrow(une)
  for(i in 1:n){
    if(une$Continent[i] == "Europe"){
      ans <- c(ans, c(une$X2000[i],une$X2001[i],une$X2002[i],une$X2003[i],une$X2004[i],une$X2005[i],une$X2006[i],une$X2007[i]))
    }
  }
  return(ans)
}

after2008inEu <- function(une){
  ans <- c()
  n <- nrow(une)
  for(i in 1:n){
    if(une$Continent[i] == "Europe"){
      ans <- c(ans, c(une$X2008[i],une$X2009[i],une$X2010[i],une$X2011[i],une$X2012[i],une$X2013[i],une$X2014[i]))
    }
  }
  return(ans)
}

oecdMem <- function(une){
  ans <- c()
  n <- nrow(une)
  for(i in 1:n){
    if(une$OECD[i] == "T"){
      ans <- c(ans, c(une$X2008[i],une$X2009[i],une$X2010[i],une$X2011[i],une$X2012[i],une$X2013[i],une$X2014[i]))
      ans <- c(ans, c(une$X2000[i],une$X2001[i],une$X2002[i],une$X2003[i],une$X2004[i],une$X2005[i],une$X2006[i],une$X2007[i]))
    }
  }
  return(ans)
}

oecdNotMem <- function(une){
  ans <- c()
  n <- nrow(une)
  for(i in 1:n){
    if(une$OECD[i] == "F"){
      ans <- c(ans, c(une$X2008[i],une$X2009[i],une$X2010[i],une$X2011[i],une$X2012[i],une$X2013[i],une$X2014[i]))
      ans <- c(ans, c(une$X2000[i],une$X2001[i],une$X2002[i],une$X2003[i],une$X2004[i],une$X2005[i],une$X2006[i],une$X2007[i]))
    }
  }
  return(ans)
}