#
# Function to read the "Individual household electric power consumption Data Set"
#  and plot how household energy usage
#  varies over a 2-day period in February, 2007
#

plot4 <- function() {
  
  # Read the data  
  df <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=F)
  
  # Convert the Date value and use it to subset the rows
  df$Date <- as.Date(df$Date,format="%d/%m/%Y")
  df <- subset(df,df$Date >= "2007-02-01" & df$Date <= "2007-02-02")  
  
  # Combine date and time into a single date/time field
  df$Time <- as.POSIXlt(as.POSIXlt(paste(df$Date, df$Time)),format="%c")
  
  # open a png file and create the requested plot, then close the file
  png(file="plot4.png",width=480,height=480)
  par(mfrow = c(2, 2))
  
  plot(df$Time,df$Global_active_power, 
       type="l",
       xlab="",
       ylab="Global Active Power")
  
  plot(df$Time,df$Voltage, 
       type="l",
       xlab="datetime",
       ylab="Voltage")
  
  plot(df$Time,df$Sub_metering_1 , 
       type="l",
       xlab="",
       ylab="Energy sub metering")
  points(df$Time,df$Sub_metering_2 , col = "red",type="l")
  points(df$Time,df$Sub_metering_3 , col = "blue", type="l")
  legend("topright", lty=1, bty="n",col = c("black","red","blue"), 
         legend = c("Sub_metering_1","Sub-metering_2", "Sub_metering_3"))
  
  plot(df$Time,df$Global_reactive_power, 
       type="l",
       xlab="datetime",
       ylab="Global_reactive_power")
  dev.off() 
}