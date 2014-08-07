epdata <- read.csv ("household_power_consumption.txt", 
                    header=FALSE,sep = ";",na.strings = "NA",skip=66637,
                    nrows=2881)

colnames (epdata) <-  c ("date","time","global_active_power",
                         "global_reactive_power","voltage","global_intensity",
                         "sub_metering_1","sub_metering_2","sub_metering_3")

epdata$datetime <- strptime(paste (epdata$date,epdata$time), "%d/%m/%Y %H:%M")

png ("plot2.png",height=480, width=480)

plot (epdata$datetime,epdata$global_active_power, type="l", xlab="", 
      ylab="Global Active Power (kilowatts)")

dev.off ()
