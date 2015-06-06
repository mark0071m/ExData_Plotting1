#ExData Plotting Assignment 1, plot 4

#read data, excluding unused dates
library(sqldf)
my_file <- "household_power_consumption.txt"
my_sql <- "select * from file where Date=='1/2/2007' or Date=='2/2/2007'"

my_data <- read.csv.sql(my_file, sql=my_sql, sep=";", header=TRUE)
#change any ? values to proper NA
my_data[my_data == "?"] <- NA

#combine date and time into DateTime
my_data$DateTime <- paste(my_data$Date, my_data$Time)
my_data$DateTime <- strptime(my_data$DateTime, "%d/%m/%Y %H:%M:%S")

#plot as png file
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#add legend with labels
legend_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

with(my_data, {
    plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
    plot(DateTime, Voltage, type="l", ylab="Voltage", xlab="datetime")
    plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
        lines(DateTime, Sub_metering_2,col='Red')
        lines(DateTime, Sub_metering_3,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=legend_labels)
    plot(DateTime, Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")
})

dev.off()