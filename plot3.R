#
# Function to read the "Individual household electric power consumption Data Set"
#  and plot how household energy usage
#  varies over a 2-day period in February, 2007
#

plot3 <- function() {
  
  # Read the data  
  df <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=F)
  
  # Convert the Date value and use it to subset the rows
  df$Date <- as.Date(df$Date,format="%d/%m/%Y")
  df <- subset(df,df$Date >= "2007-02-01" & df$Date <= "2007-02-02")  
  
  # Combine date and time into a single date/time field
  df$Time <- as.POSIXlt(as.POSIXlt(paste(df$Date, df$Time)),format="%c")
  
  # open a png file and create the requested plot, then close the file
  png(file="plot3.png",width=480,height=480)
  plot(df$Time,df$Sub_metering_1 , 
       type="l",
       xlab="",
       ylab="Energy sub metering")
  points(df$Time,df$Sub_metering_2 , col = "red",type="l")
  points(df$Time,df$Sub_metering_3 , col = "blue", type="l")
  legend("topright", lty=1, col = c("black","red","blue"), 
         legend = c("Sub_metering_1","Sub-metering_2", "Sub_metering_3"))
  dev.off() 
}