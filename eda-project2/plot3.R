library(ggplot2)

# Load Data
# Since data loading is slow, only load data if not loaded already
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# get data (Emissions and year) only for Baltimore City, Maryland
baltMD <- subset(NEI, fips == "24510", select=c(Emissions,year,type))
# sum total emissions per year
data <- aggregate(Emissions ~ year + type, baltMD, sum)

# Plot with ggplot2
png('plot3.png', width = 960)
g <- ggplot(data, aes(factor(year), Emissions, fill = type)) +
  geom_bar(stat = 'identity') + facet_grid(rows = .~type) +
  labs(x='Year', y=expression('Total PM2.5 Emissions')) +
  labs(title='Total PM2.5 Emissions from Baltimore City, Maryland by Year and Type') +
  scale_fill_discrete(name='Type') +
  theme(plot.title = element_text(hjust = 0.5))
print(g)
dev.off()