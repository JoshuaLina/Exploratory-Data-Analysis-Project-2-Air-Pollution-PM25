## Exploratory Sta Analysis (EDA) project 2: Air Pollution in USA (the PM 2.5 )


# QUESTIONS 3
 ## Of the four types of sources indicated by the (point, nonpoint, onroad, nonroad) variable, 
 ## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
 ## Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a
 ## plot answer this question.

library(ggplot2)

# reading file summarySCC_PM25.rds
    dat2<-readRDS("summarySCC_PM25.rds");
# Chekking dimension
    dim(dat2)
    names(dat2)
    Baltimore<-dat2[dat2$fips == 24510,]
    #attach(Baltimore)
    EBaltimore<-aggregate(Emissions ~year+type,Baltimore, FUN = sum)
    names(EBaltimore)
 #   detach(Baltimore)

# creating a PNG figure with a width of 480 pixels and a height of 480 pixels
  png("PLOT3.png", width = 480, height = 480)
       g <- ggplot(EBaltimore, aes(year, EBaltimore$Emissions, color = type, size = 2))
       g <- g + geom_line() + xlab("year") +  ylab(" Four type of PM2.5 Emissions in Baltimore") +
            ggtitle('Four types of Emissions in Baltimore from 1999 to 2008')
       g <- g+theme(axis.title=element_text(size=16,face="bold"), 
                    plot.title = element_text(size=16,face="bold"))
 
   print(g)
   dev.off()





