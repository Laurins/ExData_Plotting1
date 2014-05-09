# Exploratory Data Analysis
# Project 1

setwd("C:/Laurins/Safari_Downloads/00. AI-BI-DataManing-MachineLearning/__4.Exploratory.Data.Analysis/3.Project/wk1")

# read the file, add a column with DateTime, 
full_electric <- read.table(file="household_power_consumption.txt", header=TRUE
                            , sep=";", na.strings="?")
temp_date_Time <- strptime(paste(full_electric$Date, full_electric$Time), format="%d/%m/%Y %H:%M:%S")
full_electric = data.frame(temp_date_Time, full_electric)
remove(temp_date_Time)                                     # not useful any longer
full_electric$Date<-as.Date(full_electric$Date, format="%d/%m/%Y")

# keep a lighter (less rows) version of the data, only what you need, for saving resources
electric_light <- full_electric[full_electric$Date <= as.Date("2007-02-02") 
                                & full_electric$Date >= as.Date("2007-02-01"), ] 
remove(full_electric)                                      # not useful any longer

# -----------------
# Plot 4
png(filename="plot4.png", width=480, height=480)           ## Open PNG device

par(mfcol=c(2,2))

plot(electric_light$temp_date_Time, electric_light$Global_active_power
     , type="l" , main="", xlab="", ylab="Global Active Power (kilowatts)", )

plot(electric_light$temp_date_Time, electric_light$Sub_metering_1
     , type="l" , main="", xlab="", ylab="Energy sub metering", col="black")
lines(electric_light$temp_date_Time, electric_light$Sub_metering_2, col="red")
lines(electric_light$temp_date_Time, electric_light$Sub_metering_3, col="blue")
legend( "topright", bty="n", lwd=0 , col = c("black","blue","red")
        , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(electric_light$temp_date_Time, electric_light$Voltage
     , type="l" , main="", xlab="datetime", ylab="Voltage", col="black")

plot(electric_light$temp_date_Time, electric_light$Global_reactive_power
     , type="l" , main="", xlab="datetime", ylab="Global_reactive_power", col="black")

par(mfcol=c(1,1))

dev.off()                                                  ## Close ile device
