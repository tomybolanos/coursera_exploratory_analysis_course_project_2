
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


agg.data <-  aggregate(Emissions ~ year + type, dsNEI[dsNEI$fips=="24510", ],  sum)

png("plot3.png", width=640, height=480)

graph <- ggplot(agg.data, aes(year, Emissions, color = type))
graph <- graph + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City')

print (graph)

dev.off()
## end section