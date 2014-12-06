## Coursera Exploratory Data Analysis - Dec 2014 session
## Course Project 1
## Script to create plot 2
plot3 <- function() {
  all_data <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactor=FALSE, na.strings="?")
  subset_data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007",]
  rm(all_data)
  subset_data <- subset_data[complete.cases(subset_data),]
  
  ## Convert separate string date and time to Datetime object
  subset_data$Date <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%d/%m/%Y %H:%M:%S")
  subset_data$Time <- NULL
  
  ## Display plot and add additional plot lines
  plot(subset_data$Date, subset_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
  lines(subset_data$Date, subset_data$Sub_metering_2, col="red")
  lines(subset_data$Date, subset_data$Sub_metering_3, col="blue")
  
  ## Add legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col=c("black", "red", "blue"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5))
  
  ## Copy plot to png file
  dev.copy(png, file="./plot3.png")
  dev.off()
  
}