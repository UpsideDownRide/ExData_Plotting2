## Code common for all plots is in ex_data.R file

source('ex_data.R')

## Generate data for first plot

plot1_data<-NEI%>%select(Emissions,year)%>%
      group_by(year)%>%summarise(Emissions=sum(Emissions))

## Open file device and do the plot

png('plot1.png',width=480,height=480,type='cairo')

barplot(plot1_data$Emissions/1000,names.arg=plot1_data$year,
        main='Total Emissions of PM25',xlab='Year',ylab='Emissions in kilotons')

dev.off()

