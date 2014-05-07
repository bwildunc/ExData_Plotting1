setwd("/Users/...") ## set your working directory
pc<-read.table("household_power_consumption.txt",header=T, sep=";") ## make sure datafile is in your working directory
pc$Date<-as.Date(pc$Date,format="%d/%m/%Y") ## format date
pcfeb<-subset(pc,Date>"2007-01-31" & Date<"2007-02-03") ## subset the first 2 days of Feb 2007
gap<-as.numeric(as.character(pcfeb$Global_active_power)) ## format global active power data
plot(gap,type="l", ylab="Global Active Power (kilowatts)",xlab="", xaxt='n') ## create line graph
axis(1, at=c(0,1500,2800),lab=c("Thu","Fri","Sat")) ## add Thu, Fri, Sat to x axis
dev.copy(png, file = "plot2.png") ## save as PNG file
dev.off() ## turn device off
