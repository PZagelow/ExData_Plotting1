#
# Function to read the "Individual household electric power consumption Data Set"
#  and plot how household energy usage
#  varies over a 2-day period in February, 2007 for global active power
#

plot2 <- function() {
  
  # Read the data  
  df <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=F)
  
  # Convert the Date value and use it to subset the rows
  df$Date <- as.Date(df$Date,format="%d/%m/%Y")
  df <- subset(df,df$Date >= "2007-02-01" & df$Date <= "2007-02-02")  
  
  # Combine date and time into a single date/time field
  df$Time <- as.POSIXlt(as.POSIXlt(paste(df$Date, df$Time)),format="%c")
  
  # Convert requested value to numeric
  df$Global_active_power <- as.numeric(df$Global_active_power)
  
 
  # open a png file and create the requested plot, then close the file
  png(file="plot2.png",width=480,height=480)
  plot(df$Time,df$Global_active_power, 
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  dev.off() 
}