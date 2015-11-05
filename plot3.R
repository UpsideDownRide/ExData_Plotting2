## Code common for all plots is in ex_data.R file

source('ex_data.R')

## Generate data for third plot

plot3_data<-NEI%>%filter(fips=="24510")%>%select(Emissions,type,year)%>%
      group_by(type,year)%>%summarise(Emissions=sum(Emissions))

## Open file device and do the plot

png('plot3.png',width=640,height=480,type='cairo')

ggplot(plot3_data,aes(x=year,y=Emissions))+geom_line(size=1.2)+
      facet_grid(~type)+xlab('Year')+ylab('Emissions in tons')+
      ggtitle('Total emissions of PM25 in Baltimore City,Maryland by emission type')+
      theme(plot.title = element_text(lineheight=.8, face="bold"))


dev.off()

