#ExData Plotting Assignment 1, plot 3

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
png("plot3.png", width=480, height=480)

#add labels to plot
my_title <- ""
x_label <- ""
y_label <- "Energy sub metering"

plot(my_data$DateTime, my_data$Sub_metering_1, type="l", col="black", xlab=x_label, ylab=y_label)
lines(my_data$DateTime, my_data$Sub_metering_2, col="red")
lines(my_data$DateTime, my_data$Sub_metering_3, col="blue")

#add legend with labels
legend_labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

legend("topright", col=c("black", "red", "blue"), legend_labels, lty=1)

dev.off()
