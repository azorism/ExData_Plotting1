plot3 <- function(){
  
  # Read data from local working directory, subset for relevant dates and convert global relevant columns from factor to numeric
  power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
  power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
  power_sub$Sub_metering_1 <- as.numeric(as.character(power_sub$Sub_metering_1))
  power_sub$Sub_metering_2 <- as.numeric(as.character(power_sub$Sub_metering_2))
  power_sub$Sub_metering_3 <- as.numeric(as.character(power_sub$Sub_metering_3))
  
  # Plot first variable on x-axis, then add other variables to the plot
  png("plot3.png", width=480, height=480)
  plot(power_sub$Sub_metering_1, xlab = "Date", ylab = "Energy sub metering", type = "l", xaxt='n')
  lines(power_sub$Sub_metering_2, col="red")
  lines(power_sub$Sub_metering_3, col="blue")
  
  legend("topright", lty = 1, lwd = 3, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # Count of rows having date = 1.2.2007
  rows <- nrow(subset(power_sub, Date == "1/2/2007"))
  # Create sequence for data labeling
  seq <- c(1, rows, nrow(power_sub))
  # add labels to the axis
  axis(1, at = seq ,labels = c("Thu","Fri","Sat"))
  dev.off()
}