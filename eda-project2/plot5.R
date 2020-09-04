library(ggplot2)

# Load Data
# Since data loading is slow, only load data if not loaded already
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# get data (Emissions and year) only for Baltimore City, Maryland and "on-road" type
baltMDCar <- subset(NEI, fips == "24510" & type == 'ON-ROAD', select=c(Emissions,year))
# sum total emissions per year
data <- aggregate(Emissions ~ year, baltMDCar, sum)

# Plot with ggplot2
png('plot5.png',width = 550)
g <- ggplot(data, aes(factor(year), Emissions)) +
  geom_bar(stat = 'identity',fill = 'red') +
  labs(x='Year', y='Total PM2.5 Emissions') +
  labs(title='Total PM2.5 Emissions from Motor Vehicles in Baltimore City, Maryland by Year') +
  theme(plot.title = element_text(hjust = 0.5))
print(g)
dev.off()