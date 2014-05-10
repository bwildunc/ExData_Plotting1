setwd("/Users/...") ## set your working directory
pc<-read.table("household_power_consumption.txt",header=T, sep=";") ## make sure datafile is in your working directory
pc$Date<-as.Date(pc$Date,format="%d/%m/%Y") ## format date
pcfeb<-subset(pc,Date>"2007-01-31" & Date<"2007-02-03") ## subset the first 2 days of Feb 2007

par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(2,2,2,1)) ## set up the paramaters for creating multiple plots

##1st plot
gap<-as.numeric(as.character(pcfeb$Global_active_power)) ## format global active power data
plot(gap,type="l", ylab="Global Active Power",xlab="", xaxt='n') ## create line graph
axis(1, at=c(0,1500,2800),lab=c("Thu","Fri","Sat")) ## add Thu, Fri, Sat to x axis

##2nd plot
voltage<-as.numeric(as.character(pcfeb$Voltage)) ## format voltage
plot(voltage,type="l", ylab="Voltage",xlab="datetime", xaxt='n',yaxt="n",ylim=c(234,246)) ## create line graph
axis(1, at=c(0,1500,2800),lab=c("Thu","Fri","Sat")) ## add Thu, Fri, Sat to x axis
axis(2, at=c(234,236,238,240,242,244,246),labels=NA) ## format y axis
axis(2,at=c(234,238,242,246))

##3rd plot
sm1<-as.numeric(as.character(pcfeb$Sub_metering_1)) ## create vectors for the 3 sub metering variables
sm2<-as.numeric(as.character(pcfeb$Sub_metering_2)) ## format them also
sm3<-as.numeric(as.character(pcfeb$Sub_metering_3))
plot(sm1,type="l", ylab="Energy sub metering",xlab="", xaxt='n') ## create line graph of 1st sub metering var
lines(sm2, col="red")  ## add 2nd sm var
lines(sm3, col="blue") ## and 3rd
axis(1, at=c(0,1500,2800),lab=c("Thu","Fri","Sat")) ## add Thu, Fri, Sat to x axis
legend ("topright",lty=1,col=c("black","red","blue"),   ## create and format the legend
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.6,bty="n")

##4th plot
grp<-as.numeric(as.character(pcfeb$Global_reactive_power)) ## format global reactive power data
plot(grp,type="l", ylab="Global_reactive_power", xaxt='n',xlab="datetime",ylim=c(0.1,0.5)) ## create line graph
axis(1, at=c(0,1500,2800),lab=c("Thu","Fri","Sat")) ## add Thu, Fri, Sat to x axis

dev.copy(png, file = "plot4.png") ## save as PNG file
dev.off() ## turn device off
