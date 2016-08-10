## Exploratory Sta Analysis (EDA) project 2: Air Pollution in USA (the PM 2.5 )


#QUESTION 1
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing
## the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


# reading file summarySCC_PM25.rds
      dat2<-readRDS("summarySCC_PM25.rds");
# Chekking dimension
      dim(dat2)

EmissionsByYear <- aggregate(Emissions ~ year, dat2, FUN = sum)

# creating a PNG figure with a width of 480 pixels and a height of 480 pixels
  png("PLOT1.png", width = 480, height = 480)
  par(mfrow=c(1,2))
  barplot(EmissionsByYear$Emissions,col = 2:5, names = c("1999","2002","2005","2008"), 
         xlab="Years", 
         ylab='total PM2.5 Emissions per year')

#Emission per year
  E1999<-(dat2[dat2$year == 1999, ])$Emissions
  E2002<-(dat2[dat2$year == 2002, ])$Emissions
  E2005<-(dat2[dat2$year == 2005, ])$Emissions
  E2008<-(dat2[dat2$year == 2008, ])$Emissions

  boxplot(log(E1999), log(E2002),log(E2005), log(E2008),col = 2:5,
  xlab = "Year tested", ylab = "log(Emmissions)",names = c("1999","2002","2005","2008"))


# close the PNG device
dev.off(); 



