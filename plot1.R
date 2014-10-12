source('common.R')

data <- loadData('household_power_consumption.txt')

dev <- PNGDevice('plot1.png')
makePlot1(data)
dev.off()