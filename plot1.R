##Having downloaded and unzipped the .txt file to the working directory 
##from the link in the course website

## plot Histogram of Global Active Power
data <- read.table("household_power_consumption.txt",header = TRUE, sep=";",dec=".") 

data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

png(filename = "plot1.png", width = 480, height = 480)

hist(as.numeric(as.character(data$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

#dev.copy(png, file = "plot1.png", width=480,height=480)
dev.off()