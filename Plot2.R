## Exploratory Sta Analysis (EDA) project 2: Air Pollution in USA (the PM 2.5 )


# QUESTIONS 2
    ## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (flips == "24510") 
    ## from 1999 to 2008? Use the base plotting system
    ## to make a plot answering this question.



# reading file Source_Classification_Code.rds
    dat1<-readRDS("Source_Classification_Code.rds");
# Cheking dimensiona
    dim(dat1)
# reading file summarySCC_PM25.rds
    dat2<-readRDS("summarySCC_PM25.rds");
# Chekking dimension
    dim(dat2)
    names(dat2)
    attach(Baltimore)
    Baltimore<-dat2[dat2$fips == 24510,]
    EBaltimore<-aggregate(Emissions ~year, FUN = sum)
    detach(Baltimore)

# creating a PNG figure with a width of 480 pixels and a height of 480 pixels
  png("PLOT2.png", width = 480, height = 480)
        barplot(EBaltimore$Emissions, col = 2:5,, names = c("1999","2002","2005","2008"), 
        xlab = 'Years', ylab = 'Total PM2.5 Emission in Baltimore',
        main = 'Emission of PM2.5 in Baltimore between 1999 to 2008')
  dev.off(); 
