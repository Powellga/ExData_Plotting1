#JH Module 4, Week 1
#Peer Assignment 1
#Gregg Powell
#3SEP2020

setwd("C:/_TEMP/_R_WORK_TEMP/Johns_Hopkins_Data_Science/Module 4-Exploratory_Data_Analysis/week1/JH_Mod4_Week1_Peer1")
getwd()


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

