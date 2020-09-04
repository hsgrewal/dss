library(ggplot2)

# Load Data
# Since data loading is slow, only load data if not loaded already
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# get data (Emissions and year) only for Baltimore City, Maryland and Los Angeles, CA and "on-road" type
baltLACar <- subset(NEI, (fips == '24510' | fips == '06037') & type == 'ON-ROAD', select=c(Emissions,year,fips))
# sum total emissions per year
data <- aggregate(Emissions ~ year + fips, baltLACar, sum)
# Add location column to data based on fips
data$location[data$fips=='24510'] <- 'Baltimore City, Maryland'
data$location[data$fips=='06037'] <- 'Los Angeles County, California'

# Plot with ggplot2
png('plot6.png', width = 960)
g <- ggplot(data, aes(factor(year), Emissions)) +
  facet_grid(. ~ location) +
  geom_bar(stat = 'identity',fill = 'red') +
  labs(x='Year', y='Total PM2.5 Emissions') +
  labs(title='Total PM2.5 Emissions from Motor Vehicles in Baltimore City, Maryland and Los Angeles County, California by Year') +
  theme(plot.title = element_text(hjust = 0.5))
print(g)
dev.off()