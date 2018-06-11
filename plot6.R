
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


dsSubset <- dsNEI[(dsNEI$fips=="24510"|dsNEI$fips=="06037") & dsNEI$type=="ON-ROAD",  ]

dsSubset$fips[dsSubset$fips=="24510"] <- "Baltimore, MD"
dsSubset$fips[dsSubset$fips=="06037"] <- "Los Angeles, CA"

agg.data <-  aggregate(Emissions ~ year + fips,  dsSubset  , sum)

png("plot6.png", width=640, height=480)

graph <- ggplot(agg.data, aes(factor(year), Emissions))
graph <- graph + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  facet_grid(scales="free", space="free", .~fips) +
  ggtitle('Total Emissions (BA vs CA   ON-ROAD)')

print (graph)


dev.off()
## end section