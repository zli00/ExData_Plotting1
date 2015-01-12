dat<-read.table("household_power_consumption.txt", sep=";", header=T)

newDat <- subset(dat, dat[,1] == "1/2/2007" | dat[,1] == "2/2/2007")

#plot2
with(newDat, {
  time <- strptime(paste(newDat$Date,newDat$Time), "%d/%m/%Y %H:%M:%S")

  plot(time, as.numeric(newDat$Global_active_power), type="l", xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
  r <- as.POSIXct(round(range(time), "days"))
  axis.POSIXct(1, at=seq(r[1], r[2], by="day"), format="%a")
})

dev.copy(png, file="plot2.png")

dev.off()




