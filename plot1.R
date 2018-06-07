
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



agg.data <- with(dsNEI, aggregate(Emissions, by = list(year), sum))


plot(agg.data, type = "o", ylab = expression("Total Emissions, PM 2.5"), 
     xlab = "Year", main = "Total Emissions in  USA")
polygon(agg.data)

## end section