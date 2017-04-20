plot1 <- function(){

  # Read data from local working directory, subset for relevant dates and convert global active power from factor to numeric
  power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
  power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
  power_sub$Global_active_power <- as.numeric(as.character(power_sub$Global_active_power))
  
  # Create and save diagram to a png file
  png("plot1.png", width=480, height=480)
  hist(power_sub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",ylab = "Frequency",col="red")
  dev.off()

}