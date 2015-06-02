#
# Function to read the "Individual household electric power consumption Data Set"
#  and plot how household energy usage
#  varies over a 2-day period in February, 2007 for global active power
#

plot1 <- function() {
  
  # Read the data  
  df <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=F)
  
  # Convert the Date value and use it to subset the rows
  df$Date <- as.Date(df$Date,format="%d/%m/%Y")
  df <- subset(df,df$Date >= "2007-02-01" & df$Date <= "2007-02-02")  
  
  # Convert the column to a numeric so we can plot it
  df$Global_active_power <- as.numeric(df$Global_active_power)
  
  # open a png file and create the requested plot, then close the file
  png(file="plot1.png",width=480,height=480)
  hist(df$Global_active_power, col = "red",main="Global Active Power",
       xlab="Global Active Power (kilowatts)")
  dev.off() 
}