source('common.R')

data <- loadData('household_power_consumption.txt')

dev <- PNGDevice('plot2.png')
makePlot2(data)
dev.off()