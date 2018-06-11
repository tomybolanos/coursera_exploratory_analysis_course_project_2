
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



agg.data <-  aggregate(Emissions ~ year,  dsNEI[dsNEI$fips=="24510" & dsNEI$type=="ON-ROAD",  ]  , sum)

png("plot5.png", width=640, height=480)

plot(agg.data, type = "o", ylab = expression("Total Emissions (On road), PM 2.5"), 
     xlab = "Year", main = "Total Emissions in  USA (Baltimore, on road)")


dev.off()
## end section