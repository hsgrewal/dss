library(ggplot2)
library(stringi)

# Load Data
# Since data loading is slow, only load data if not loaded already
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Get subset of SCC for coal related emissions
scc_coal <- subset(SCC, stri_detect_regex(Short.Name, 'Coal', case_insensitive=TRUE), select = c(SCC))

# Get subset of NEI for coal related emissions sources
nei_coal <- subset(NEI, SCC %in% scc_coal$SCC, select = c(Emissions,year))

# sum total coal-related emissions per year
data <- aggregate(Emissions ~ year, nei_coal, sum)

# Plot
png(filename="plot4.png")
g <- ggplot(data, aes(factor(year), Emissions)) +
  geom_bar(stat = 'identity',fill = 'red') +
  labs(x='Year', y=expression('Total Coal Combustion-realted PM2.5 Emissions')) +
  labs(title='Total Coal Combustion-related PM2.5 Emissions in US by Year') +
  theme(plot.title = element_text(hjust = 0.5))
print(g)
dev.off()