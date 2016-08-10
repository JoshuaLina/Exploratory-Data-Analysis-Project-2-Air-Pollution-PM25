## Exploratory Sta Analysis (EDA) project 2: Air Pollution in USA (the PM 2.5 )

# QUESTIONS 4
   # Across the United States, how have emissions from coal combustion-related sources
   # changed from 1999-2008?

# reading file summarySCC_PM25.rds
   Table1<-readRDS("Source_Classification_Code.rds")
   Table2<-readRDS("summarySCC_PM25.rds")
# Chekking dimension&names& first rows
    dim(Table2);  names(Table2); head(Table2)

# Merging both tables on SCC
   Table3<- merge(Table2,Table1, by = "SCC")
   head(Table3)
   dim(Table3)
   names(Table3)

# Searching fo matches to argument pattern (coal)
coalMatches  <- grepl("coal", Table3$Short.Name, ignore.case=TRUE)
SubSet<-Table3[coalMatches,]
names(SubSet)
TotalByYear<-aggregate(Emissions~year,SubSet, FUN = sum)

png("plot4.png", width=640, height=480)
barplot(TotalByYear$Emissions,col = 2:5, names = c("1999","2002","2005","2008"), 
        xlab="Years", 
        ylab='total PM2.5 Emissions per year in USA', 
        main = 'Total Emissions in USA from 1999 to 2008 from coal sources')
dev.off()

