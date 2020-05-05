house_power_consume = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

house_power_consume = transform(house_power_consume, Date = as.Date(Date, "%d/%m/%Y"))
house_power_consume = subset(house_power_consume, Date == "2007-02-02" | Date == "2007-02-01")
house_power_consume = transform(house_power_consume, Global_active_power = as.numeric(Global_active_power))
house_power_consume$Time = paste(house_power_consume$Date, house_power_consume$Time, sep = " ")
house_power_consume = transform(house_power_consume, Time = strptime(Time, "%Y-%m-%d %H:%M:%S"))

house_power_consume = transform(house_power_consume, Sub_metering_1 = as.numeric(Sub_metering_1))
house_power_consume = transform(house_power_consume, Sub_metering_2 = as.numeric(Sub_metering_2))
house_power_consume = transform(house_power_consume, Sub_metering_3 = as.numeric(Sub_metering_3))

house_power_consume = transform(house_power_consume, Global_reactive_power = as.numeric(Global_reactive_power))

par(mfrow = c(2,2))
with(house_power_consume, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(house_power_consume, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

with(house_power_consume, plot(Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(house_power_consume, lines(Time, Sub_metering_2, type = "l", col = "red"))
with(house_power_consume, lines(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=1, adj = c(0,0), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", y.intersp = 0.2, x.intersp = 0.25, text.width = strwidth("Sub_meteri"), xjust = 1, seg.len = 1, title.adj = 0)

with(house_power_consume, plot(Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", lwd = 0.5))

dev.copy(png, file = "plot4.png")
dev.off()