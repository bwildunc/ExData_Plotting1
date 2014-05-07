setwd("/Users/...") ## set your working directory
pc<-read.table("household_power_consumption.txt",header=T, sep=";") ## make sure datafile is in your working directory
pc$Date<-as.Date(pc$Date,format="%d/%m/%Y") ## format date
pcfeb<-subset(pc,Date>"2007-01-31" & Date<"2007-02-03") ## subset the first 2 days of Feb 2007
histdata<-as.numeric(as.character(pcfeb$Global_active_power)) ## format global active power data
hist(histdata, xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power",
        ylim=c(0,1200),col="red") ## create histogram
dev.copy(png, file = "plot1.png") ## save as PNG file
dev.off() ## turn device off
