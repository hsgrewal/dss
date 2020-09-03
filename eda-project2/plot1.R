# Load Data
# Since data loading is slow, only load data if not loaded already
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# sum total emissions per year
data <- aggregate(Emissions ~ year, NEI, sum)

# Plot
png('plot1.png')
barplot(
  data$Emissions,
  names.arg = data$year,
  col = 'red',
  xlab = "Year",
  ylab = 'Total PM2.5 Emissions',
  main = 'Total PM2.5 Emissions from all US Sources by Year'
)
dev.off()