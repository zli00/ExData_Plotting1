dat<-read.table("household_power_consumption.txt", sep=";", header=T)

newDat <- subset(dat, dat[,1] == "1/2/2007" | dat[,1] == "2/2/2007")

#plot4
par(mfrow = c(2, 2))

#fig1
with(newDat, {
  time <- strptime(paste(newDat$Date,newDat$Time), "%d/%m/%Y %H:%M:%S")
  
  plot(time, as.numeric(newDat$Global_active_power), type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
  r <- as.POSIXct(round(range(time), "days"))
  axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")
})


#fig2
with(newDat, {
  time <- strptime(paste(newDat$Date,newDat$Time), "%d/%m/%Y %H:%M:%S")

  plot(time, as.numeric(newDat$Voltage), type="l", xaxt="n", xlab="", ylab="Votage")
  r <- as.POSIXct(round(range(time), "days"))
  axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")
})


#fig3
with(newDat, {
  time <- strptime(paste(newDat$Date,newDat$Time), "%d/%m/%Y %H:%M:%S")  

  plot(time, as.numeric(newDat$Sub_metering_1), type="l", xaxt="n", xlab="", ylab="Energy Sub Metering")
  r <- as.POSIXct(round(range(time), "days"))
  axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")
  
  lines(time, as.numeric(newDat$Sub_metering_2), type = "l", col="red")
  lines(time, as.numeric(newDat$Sub_metering_3), type = "l", col="blue")
  legend("topright", lty=c(1,1), lwd=c(2.5, 2.5), col = c("black", "red", "blue"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3")) 
})

#fig4
with(newDat, {
  time <- strptime(paste(newDat$Date,newDat$Time), "%d/%m/%Y %H:%M:%S")

  plot(time, as.numeric(newDat$Global_reactive_power), type="l", xaxt="n", xlab="", ylab="Global Reactive Power (kilowatts)")
  r <- as.POSIXct(round(range(time), "days"))
  axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")
} )







dev.copy(png, file="plot4.png")

dev.off()




