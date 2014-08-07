epdata <- read.csv ("household_power_consumption.txt", 
                    header=FALSE,sep = ";",na.strings = "NA",skip=66637,
                    nrows=2880)

colnames (epdata) <-  c("date","time","global_active_power",
                        "global_reactive_power","voltage","global_intensity",
                        "sub_metering_1","sub_metering_2","sub_metering_3")

png ("plot1.png",height=480, width=480)

hist (epdata$global_active_power, main = paste("Global Active Power"),
      xlab = "Global Active Power (kilowatts)",ylab="Frequency", col = "red",
      ylim = c(0,1300))

dev.off ()
