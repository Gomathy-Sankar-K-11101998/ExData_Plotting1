house_power_consume = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

house_power_consume = transform(house_power_consume, Date = as.Date(Date, "%d/%m/%Y"))
house_power_consume = subset(house_power_consume, Date == "2007-02-02" | Date == "2007-02-01")
house_power_consume = transform(house_power_consume, Global_active_power = as.numeric(Global_active_power))
par(mfrow = c(1, 1))
hist(house_power_consume$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()