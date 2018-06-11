
## loading library section 
library(plyr)
library(ggplot2)

## end section 

 
## load data section
if (!exists("dsNEI")) {
  dsNEI <- readRDS("summarySCC_PM25.rds")
}

if (!exists("dsSCC")) {
  dsSCC <- readRDS("Source_Classification_Code.rds")
}



# merge the two data sets 
if(!exists("dsMerged")){
  dsMerged <- merge(dsNEI, dsSCC, by="SCC")
}



##end section





## plot section



agg.data <-  aggregate(Emissions ~ year,  dsMerged[grepl("coal", dsMerged$Short.Name, ignore.case=TRUE),  ]  , sum)

png("plot4.png", width=640, height=480)

plot(agg.data, type = "o", ylab = expression("Total Emissions (coal), PM 2.5"), 
     xlab = "Year", main = "Total Emissions in  USA (Baltimore, coal)")


dev.off()
## end section