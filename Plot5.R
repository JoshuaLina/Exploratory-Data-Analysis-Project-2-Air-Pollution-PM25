## Exploratory Sta Analysis (EDA) project 2: Air Pollution in USA (the PM 2.5 )

# QUESTIONS 5
   #How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# reading file summarySCC_PM25.rds
   Table1<-readRDS("Source_Classification_Code.rds")
   Table2<-readRDS("summarySCC_PM25.rds")
# Chekking dimension&names& first rows
    dim(Table2);  names(Table2); 
    head(Table2)
    head(Table1)
# Merging both tables on SCC
   Table3<- merge(Table2,Table1, by = "SCC")
   head(Table3)
   dim(Table3)
   names(Table3)

   
   
   ## Assuptions: 
     # 1. Motor vehicule is the variable on-roan in table 2 (summarySCC_PM25.rds)
     # Baltimore fips is 24510
   attach(Table2)
   Baltimore_On_Road<-Table2[fips == "24510" & type == "ON-ROAD",]
   names(Baltimore_On_Road)
   detach(Table2)
   Emisssion_On_Road_Baltimore<- aggregate(Emissions~year,Baltimore_On_Road, FUN = sum )
   
   
png("plot5.png", width=640, height=480)
   par(mfrow=c(1,2))
barplot(Emisssion_On_Road_Baltimore$Emissions,col = 2:5, names = c("1999","2002","2005","2008"), 
        xlab="Years tested", 
        ylab='total PM2.5 Emissions per year in Baltimore', 
        main = 'Total E.in Baltimore from ON-ROAD sources')
## To observe the mediam values        
       x1999<-(Baltimore_On_Road[Baltimore_On_Road$year == 1999,])$Emissions
       x2002<-(Baltimore_On_Road[Baltimore_On_Road$year == 2002,])$Emissions
       x2005<-(Baltimore_On_Road[Baltimore_On_Road$year == 2005,])$Emissions
       x2008<-(Baltimore_On_Road[Baltimore_On_Road$year == 2008,])$Emissions
       boxplot(log(x1999), log(x2002),log(x2005), log(x2008),col = 2:5,
               xlab = "Year tested", ylab = "Emmissions in Baltimore from ON-Road Sourses (log)",
               names = c("1999","2002","2005","2008"))
# close the PNG device   
       dev.off()

