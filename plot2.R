##plot2.R
##Project for Coursera Exploring data
library(dplyr)
library(lubridate)
library(grDevices)
fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if !file.exists("exdata%2Fdata%2Fhousehold_power_consumption.zip")
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
png(filename="plot2.png",type="cairo-png")
plot(epc$epcdt,epc$Global_active_power,type="l",xlab="",ylab="Global active power (Kilowatt)")
dev.off()




