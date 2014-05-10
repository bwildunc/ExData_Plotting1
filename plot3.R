setwd("/Users/...") ## set your working directory
pc<-read.table("household_power_consumption.txt",header=T, sep=";") ## make sure datafile is in your working directory
pc$Date<-as.Date(pc$Date,format="%d/%m/%Y") ## format date
pcfeb<-subset(pc,Date>"2007-01-31" & Date<"2007-02-03") ## subset the first 2 days of Feb 2007
sm1<-as.numeric(as.character(pcfeb$Sub_metering_1)) ## create vectors for the 3 sub metering variables
sm2<-as.numeric(as.character(pcfeb$Sub_metering_2)) ## format them also
sm3<-as.numeric(as.character(pcfeb$Sub_metering_3))
plot(sm1,type="l", ylab="Energy sub metering",xlab="", xaxt='n') ## create line graph of 1st sub metering var
lines(sm2, col="red")  ## add 2nd sm var
lines(sm3, col="blue") ## and 3rd
axis(1, at=c(0,1500,2800),lab=c("Thu","Fri","Sat")) ## add Thu, Fri, Sat to x axis
legend ("topright",lty=1,col=c("black","red","blue"),   ## create and format the legend
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.8)
dev.copy(png, file = "plot3.png") ## save as PNG file
dev.off() ## turn device off
