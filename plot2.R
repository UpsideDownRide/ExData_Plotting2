## Code common for all plots is in ex_data.R file

source('ex_data.R')

## Generate data for second plot

plot2_data<-NEI%>%filter(fips=="24510")%>%select(Emissions,year)%>%
      group_by(year)%>%summarise(Emissions=sum(Emissions))

## Open file device and do the plot

png('plot2.png',width=480,height=480,type='cairo')

barplot(plot2_data$Emissions/1000,names.arg=plot1_data$year,
        main='Total Emissions of PM25 for Baltimore City, Maryland',xlab='Year',
        ylab='Emissions in kilotons')

dev.off()

