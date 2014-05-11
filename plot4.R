##Having downloaded and unzipped the .txt file to the working directory 
##from the link in the course website

data <- read.table("household_power_consumption.txt",header = TRUE, sep=";",dec=".") 

data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

day <- strptime(paste(as.character(data$Date),as.character(data$Time), sep=" "), format="%d/%m/%Y %H:%M:%S")
##day_name <- weekdays(day)
data <- cbind(data,day)

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
with(data,plot(day,Global_active_power,col="black",type="l",xlab="",ylab="Global Active Power"))
with(data,plot(day,Voltage,col="black",type="l",xlab="datetime",ylab="Voltage"))
with(data,plot(day,Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering"))
with(data,points(day,Sub_metering_2,col="red",type="l"))
with(data,points(day,Sub_metering_3,col="blue",type="l"))
legend("topright",cex=1.0,bty="n",col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1)
with(data,plot(day,Global_reactive_power,col="black",type="l",xlab="datetime"))

dev.off()