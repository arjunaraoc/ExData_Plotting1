##plot3.R
##Project for Coursera Exploring data
library(dplyr)
library(lubridate)
library(grDevices)
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("exdata%2Fdata%2Fhousehold_power_consumption.zip"))
    download.file(fileurl,"exdata%2Fdata%2Fhousehold_power_consumption.zip",method="curl")
skip<-66637L
end<-69517L
epc<-read.table(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip",filename="household_power_consumption.txt"),sep=";",skip=skip,nrows=end-skip,stringsAsFactors=FALSE)
epcnames<-read.csv(unz("exdata%2Fdata%2Fhousehold_power_consumption.zip",filename="household_power_consumption.txt"),sep=";",nrows=1)
names(epc)<-names(epcnames)
epc[epc=="?"]<-"NA"
epc<-mutate(epc, epcdt=paste0(Date," ",Time))
epc$epcdt<-parse_date_time(epc$epcdt,"%d/%m/%y %H:%M:%S")
epc<-epc[,c(10,3:9)]
png(filename="plot3.png",type="cairo-png")
leg.txt<-names(epc)[6:8]
plot(epc$epcdt,y=epc$Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(epc$epcdt,y=epc$Sub_metering_2,type="l",col="red")
lines(epc$epcdt,y=epc$Sub_metering_3,type="l",col="blue")
legend("topright",35,leg.txt,pch=" ",col=c("black","red","blue"),lty="solid")
dev.off()




