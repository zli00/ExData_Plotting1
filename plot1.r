dat<-read.table("household_power_consumption.txt", sep=";", header=T)

newDat <- subset(dat, dat[,1] == "1/2/2007" | dat[,1] == "2/2/2007")

#plot1
hist(as.numeric(newDat$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file="plot1.png")

dev.off()




