# Load Data
# Since data loading is slow, only load data if not loaded already
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# get data (Emissions and year) only for Baltimore City, Maryland
baltMD <- subset(NEI, fips == "24510", select=c(Emissions,year))
# sum total emissions per year
data <- aggregate(Emissions ~ year, baltMD, sum)

# Plot
png('plot2.png')
barplot(
  data$Emissions,
  names.arg = data$year,
  col = 'red',
  xlab = "Year",
  ylab = 'Total PM2.5 Emissions',
  main = 'Total PM2.5 Emissions from Baltimore City, Maryland by Year'
)
dev.off()