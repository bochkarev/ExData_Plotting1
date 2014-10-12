loadData <- function(filename) {
  data <- read.csv(file = filename, sep = ';', na.strings = '?',
                   colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric',
                                  'numeric', 'numeric', 'numeric', 'numeric'))
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data$Time <- strptime(data$Time, tz = 'GMT', format = '%H:%M:%S')
  data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]
  data$DT <- as.POSIXlt(data$Date) + (data$Time - trunc(data$Time, units = 'days'))
  data
}

PNGDevice <- function(filename) {
  Sys.setlocale(category = "LC_ALL", locale = 'en_US.UTF-8')
  dev <- png(filename, width = 480, height = 480)
  dev
}

makePlot1 <- function(data) {
  hist(data$Global_active_power, col = 'red', main = 'Global active power',
       xlab = 'Global Active Power (kilowatts)')
}

makePlot2 <- function(data, ylab = 'Global Active Power (kilowatts)') {
  plot(data$DT, data$Global_active_power, type = 'l', xlab = '',
       ylab = ylab)
}

makePlot3 <- function(data, bty = 'o') {
  plot(data$DT, data$Sub_metering_1, type='n', xlab = '', ylab = 'Energy sub metering')
  lines(data$DT, data$Sub_metering_1, col='black')
  lines(data$DT, data$Sub_metering_2, col='red')
  lines(data$DT, data$Sub_metering_3, col='blue')
  legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         col=c('black', 'red', 'blue'), lty = 'solid', bty = bty)
}

makePlot4 <- function(data) {
  par(mfrow = c(2, 2))
  makePlot2(data, 'Global Active Power')
  plot(data$DT, data$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
  makePlot3(data, 'n')
  plot(data$DT, data$Global_reactive_power, type = 'l', xlab = 'datetime',
       ylab = 'Global_reactive_power')
}