## OS: Windows 8.1 x64. R ver. 3.1.2. RStudio ver. 0.98.110

## Extract the text file in the working directory in Windows

housedata <- read.table("household_power_consumption.txt", 
                        header = TRUE, sep = ";", dec = ".", 
                        na.strings = "?", nrows = 2075259, 
                        stringsAsFactors = FALSE)
## Reading the text file

head(housedata, 3) ## checking file

hdbydt <- subset(housedata, 
                 Date == "1/2/2007" | Date == "2/2/2007")
## subset the data by date range 1/2/2007 to 2/2/2007

x <- paste(hdbydt$Date, hdbydt$Time) ## concatenate Date and Time
datseries <- strptime(x, format = "%d/%m/%Y %H:%M:%S")
## Generated a new series with date and time in format

par(mfrow = c(2, 2), mar=c(4,4,2,1), oma=c(0,0,2,0))
## 2 by 2 array
plot(datseries, hdbydt$Global_active_power, type = "l",
     xlab = " ", ylab = "Global Active Power (kilowatts)")
## Plot 1
plot(datseries, hdbydt$Voltage, xlab = "datetime", ylab = "Voltage",
     type = "l")
## Plot 2
plot(datseries, hdbydt$Sub_metering_1, xlab = " ",
     ylab = "Energy sub metering", main = " ", type = "l")
lines(datseries, hdbydt$Sub_metering_2, col = "red")
lines(datseries, hdbydt$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), col = c("black", 
                                                         "red",
                                                         "blue"), 
       lty = 1, lwd = 2, bty = "n")
## Plot 3
plot(datseries, hdbydt$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")
## plot 4

dev.copy(png, file = "Plot4.png", width = 480, height = 480)
dev.off()
## Plot saved as png file as per specifications