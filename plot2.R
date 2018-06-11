
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




##end section


## plot section



agg.data <-  with(dsNEI[dsNEI$fips=="24510", ] , aggregate(Emissions, by = list(year),  sum))

png('plot2.png')
plot(agg.data, type = "o", ylab = expression("Total Emissions, PM 2.5"), 
     xlab = "Year", main = "Total Emissions in  Baltimore(Maryland)")

dev.off()
## end section