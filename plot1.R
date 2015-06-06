#ExData Plotting Assignment 1, plot 1

#read data, excluding unused dates
library(sqldf)
my_file <- "household_power_consumption.txt"
my_sql <- "select * from file where Date=='1/2/2007' or Date=='2/2/2007'"

my_data <- read.csv.sql(my_file, sql=my_sql, sep=";", header=TRUE)
#change any ? values to proper NA
my_data[my_data == "?"] <- NA

#plot as png file
png("plot1.png",res=55, width=480, height=480)

#add labels to plot
my_title <- "Global Active Power"
x_label <- "Global Active Power(kilowatts)"
y_label <- "Frequency"
hist(my_data$Global_active_power, main=my_title, xlab=x_label, ylab=y_label, col="red")
dev.off()