plot2 <- function(){
  
  # Read data from local working directory, subset for relevant dates and convert global active power from factor to numeric
  power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
  power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
  
  # Count of rows having date = 1.2.2007
  rows <- nrow(subset(power_sub, Date == "1/2/2007"))
  
  # Conversion of column classes
  power_sub$Global_active_power <- as.numeric(as.character(power_sub$Global_active_power))
  #power_sub$Time <- strptime(power_sub$Time, format = "%H:%M:%S")
  #power_sub$Date <- as.Date(power_sub$Date, format = "%d/%m/%Y")
  
  # Create sequence for data labeling
  seq <- c(1, rows, nrow(power_sub))
  
  # Create plot write it pgn file and add day labels to the axis
  png("plot2.png", width=480, height=480)
  plot(power_sub$Global_active_power, xlab = "Date", ylab = "Global Active Power (kilowatts)", type = "l", xaxt='n')
  axis(1, at = seq ,labels = c("Thu","Fri","Sat"))
  dev.off()
  
}