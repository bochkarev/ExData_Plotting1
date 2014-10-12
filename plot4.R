source('common.R')

data <- loadData('household_power_consumption.txt')

dev <- PNGDevice('plot4.png')
makePlot4(data)
dev.off()