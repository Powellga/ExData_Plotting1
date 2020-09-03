#JH Module 4, Week 1
#Peer Assignment 1
#Gregg Powell
#3SEP2020

setwd("C:/_TEMP/_R_WORK_TEMP/Johns_Hopkins_Data_Science/Module 4-Exploratory_Data_Analysis/week1/JH_Mod4_Week1_Peer1")
getwd()

library(dplyr)

# Dont do this - puts everything in 1 row..........Household_Power_Consumption <- read.table("household_power_consumption.txt")

Household_Power_Consumption <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")   #had to look this up
head(Household_Power_Consumption)
class(Household_Power_Consumption)

#pull only those rows with dates = 1/2/2007
HPC_Date_Range1 <- subset(Household_Power_Consumption, Date == "1/2/2007")
head(HPC_Date_Range1)

#pull only those rows with dates = 2/2/2007
HPC_Date_Range2 <- subset(Household_Power_Consumption, Date == "2/2/2007")
head(HPC_Date_Range2)

#row bind the two date ranges together into one data.table
Date_Range <- rbind(HPC_Date_Range1, HPC_Date_Range2)

#What class are the columns
sapply(Date_Range, class)

#Now do the work........
#Plot1
#Check plot.............
hist(Date_Range$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
#it's OK - so make it a png file......

png("plot1.png", width=480, height=480)
hist(Date_Range$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()


#Plot2
#Change dateTime column from numeric to Time Format
Date_Range[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#Check Plot
with(Date_Range, plot(Global_active_power ~ dateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")) 
#it's OK, so make it a png file
png("plot2.png", width=480, height=480)
with(Date_Range, plot(Global_active_power ~ dateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")) 
dev.off()

#Plot3
#Check Plot
plot(Date_Range$dateTime, Date_Range$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Date_Range$dateTime, Date_Range$Sub_metering_2,col="red")
lines(Date_Range$dateTime, Date_Range$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

#OK - that was a pain
#it's OK, so make it a png file
png("plot3.png", width=480, height=480)
plot(Date_Range$dateTime, Date_Range$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Date_Range$dateTime, Date_Range$Sub_metering_2,col="red")
lines(Date_Range$dateTime, Date_Range$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()

#and the last one..... this is supposed to be fun



png("plot4.png", width=480, height=480)
#set 2 rows of 2 plots
par(mfrow=c(2,2))

#1st Plot- #2 from above
with(Date_Range, plot(Global_active_power ~ dateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")) 

#2nd plot - Voltage
with(Date_Range, plot(Voltage ~ dateTime, type="l", xlab="Datetime", ylab="Voltage")) 

#3 plot - #3 above
plot(Date_Range$dateTime, Date_Range$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Date_Range$dateTime, Date_Range$Sub_metering_2,col="red")
lines(Date_Range$dateTime, Date_Range$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

#4 - Global Reactive Power
with(Date_Range, plot(Global_reactive_power ~ dateTime, type="l", xlab="Datetime")) 

dev.off()



















