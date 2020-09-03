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




#Plot2
#Change dateTime column from numeric to Time Format
Date_Range[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
#Check Plot
with(Date_Range, plot(Global_active_power ~ dateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")) 
#it's OK, so make it a png file
png("plot2.png", width=480, height=480)
with(Date_Range, plot(Global_active_power ~ dateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")) 
dev.off()

