source('common.R')

data <- loadData('household_power_consumption.txt')

dev <- PNGDevice('plot3.png')
makePlot3(data)
dev.off()