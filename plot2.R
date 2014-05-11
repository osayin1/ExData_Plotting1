##Having downloaded and unzipped the .txt file to the working directory 
##from the link in the course website

data <- read.table("household_power_consumption.txt",header = TRUE, sep=";",dec=".") 

data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

day <- strptime(paste(as.character(data$Date),as.character(data$Time), sep=" "), format="%d/%m/%Y %H:%M:%S")
##day_name <- weekdays(day)
data <- cbind(data,day)

png(filename = "plot2.png", width = 480, height = 480)

with(data,plot(day,as.numeric(as.character(Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)"))

#dev.copy(png, file = "plot2.png", width=480,height=480)
dev.off()