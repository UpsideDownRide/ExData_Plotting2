## Code common for all plots is in ex_data.R file

source('ex_data.R')

## Generate data for fourth plot

plot4_data<-merged_data%>%filter(grepl('Coal',Short.Name))%>%
      select(Emissions,type,year)%>%
      group_by(year)%>%
      summarise(Emissions=sum(Emissions)/1000)

## Open file device and do the plot

png('plot4.png',width=640,height=480,type='cairo')

ggplot(plot4_data,aes(x=year,y=Emissions))+geom_line(size=1.2)+
      xlab('Year')+ylab('Emissions in kilotons')+
      ggtitle('Total emissions of PM25 from coal sources')+
      theme(plot.title = element_text(lineheight=.8, face="bold"))


dev.off()

