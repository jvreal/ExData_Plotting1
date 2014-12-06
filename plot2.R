## Coursera Exploratory Data Analysis - Dec 2014 session
## Course Project 1
## Script to create plot 2
plot2 <- function() {
  all_data <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactor=FALSE)
  subset_data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007",]
  rm(all_data)
  
  ## Convert separate string date and time to Datetime object
  subset_data$Date <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%d/%m/%Y %H:%M:%S")
  subset_data$Time <- NULL
  
  ## Display plot
  plot(subset_data$Date, subset_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  ## Copy plot to png file
  dev.copy(png, file="./plot2.png")
  dev.off()
  
}