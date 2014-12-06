## Coursera Exploratory Data Analysis - Dec 2014 session
## Course Project 1
## Script to create plot 1
plot1 <- function() {
  
  all_data <- read.table("./data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactor=FALSE)
  subset_data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007",]
  rm(all_data)
  
  ## Display histogram
  hist(as.numeric(subset_data$Global_active_power), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="Red")
  
  ## Copy plot to png file
  dev.copy(png, file="./plot1.png")
  dev.off()
  
}