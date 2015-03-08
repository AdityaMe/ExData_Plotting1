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

plot(datseries, hdbydt$Sub_metering_1, xlab = " ",
     ylab = "Energy sub metering", type = "l")
## line for sub meter 1 plotted
lines(datseries, hdbydt$Sub_metering_2, col = "red")
## line for sub meter 2 added on top
lines(datseries, hdbydt$Sub_metering_3, col = "blue")
## line for sub meter 3 added on top

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"), col = c("black", 
                                                         "red",
                                                         "blue"), 
       lty = 1, lwd = 1)
## added the legend specifying the lines

dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()
## Plot saved as png file as per specifications