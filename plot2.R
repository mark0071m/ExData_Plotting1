#ExData Plotting Assignment 1, plot 2

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
png("plot2.png", width=480, height=480)

#add labels to plot
my_title <- ""
x_label <- ""
y_label <- "Global Active Power (kilowatts)"

plot(my_data$DateTime, my_data$Global_active_power, type="l", xlab=x_label, ylab=y_label)
dev.off()
