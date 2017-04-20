plot4 <- function(){
  
  # Read data from local working directory, subset for relevant dates and convert global relevant columns from factor to numeric
  power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
  power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
  
  # Transform factor columns into numeric
  power_sub$Global_active_power <- as.numeric(as.character(power_sub$Global_active_power))
  power_sub$Sub_metering_1 <- as.numeric(as.character(power_sub$Sub_metering_1))
  power_sub$Sub_metering_2 <- as.numeric(as.character(power_sub$Sub_metering_2))
  power_sub$Sub_metering_3 <- as.numeric(as.character(power_sub$Sub_metering_3))
  power_sub$Global_reactive_power <- as.numeric(as.character(power_sub$Global_reactive_power))
  power_sub$Voltage <- as.numeric(as.character(power_sub$Voltage))
  
  # Count of rows having date = 1.2.2007
  rows <- nrow(subset(power_sub, Date == "1/2/2007"))
  # Create sequence for data labeling
  seq <- c(1, rows, nrow(power_sub))
  
  # Create pgn file and allow 4 plots to be displayed
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2,2))
  
  # 1. plot -> top left
  plot(power_sub$Global_active_power, xlab = "Date", ylab = "Global Active Power (kilowatts)", type = "l", xaxt='n')
  axis(1, at = seq ,labels = c("Thu","Fri","Sat"))
  
  # 2. plot -> top right
  plot(power_sub$Voltage, xlab = "datetime", ylab = "Voltage", type = "l", xaxt='n')
  axis(1, at = seq ,labels = c("Thu","Fri","Sat"))
  
  # 3. plot -> bottom left
  plot(power_sub$Sub_metering_1, xlab = "Date", ylab = "Energy sub metering", type = "l", xaxt='n')
  lines(power_sub$Sub_metering_2, col="red")
  lines(power_sub$Sub_metering_3, col="blue")
  axis(1, at = seq ,labels = c("Thu","Fri","Sat"))
  legend("topright", lty = 1, lwd = 3, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")
  
  # 4. plot -> bottom right
  plot(power_sub$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l", xaxt='n')
  axis(1, at = seq ,labels = c("Thu","Fri","Sat"))
  
  dev.off()
  
}