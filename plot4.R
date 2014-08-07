epdata <- read.csv ("household_power_consumption.txt", 
                    header=FALSE,sep = ";",na.strings = "NA",skip=66637,
                    nrows=2881)

colnames (epdata) <-  c ("date","time","global_active_power",
                         "global_reactive_power","voltage","global_intensity",
                         "sub_metering_1","sub_metering_2","sub_metering_3")

epdata$datetime <- strptime(paste (epdata$date,epdata$time), "%d/%m/%Y %H:%M")

png ("plot4.png",height=480, width=480)

par(mfrow=c(2,2))

plot (epdata$datetime,epdata$global_active_power, type="l", xlab="", 
      ylab="Global Active Power (kilowatts)")

plot (epdata$datetime,epdata$voltage, type="l",  ylab="Voltage", 
      xlab="datetime")

plot (epdata$datetime,epdata$sub_metering_1, type="l", xlab="", 
      ylab="Energy sub metering")
lines (epdata$datetime,epdata$sub_metering_2, type="l", xlab="", col="red")
lines (epdata$datetime,epdata$sub_metering_3, type="l", xlab="", col="blue")
legend ("topright",c ("sub_metering_1","sub_metering_2","sub_metering_3"),
        col=c('black', 'red', 'blue'), cex=1, lty = c(1,1),y.intersp = 0.8,
        adj = c(0, 0.6),  bty = "n")

plot (epdata$datetime,epdata$global_reactive_power, type="l", xlab="datetime", 
      ylab="Global_reactive_power")

dev.off ()
