## Code common for all plots is in ex_data.R file

source('ex_data.R')

## Generate data for fifth plot

plot5_data<-merged_data%>%
      filter(fips=='24510')%>%
      filter(grepl('motor',Short.Name,ignore.case=TRUE))%>%
      select(Emissions,type,year)%>%
      group_by(year)%>%
      summarise(Emissions=sum(Emissions))

plot5_data$year <- factor(plot5_data$year, levels=c('1999', '2002', '2005', '2008'))

## Open file device and do the plot

png('plot5.png',width=640,height=480,type='cairo')

ggplot(plot5_data,aes(x=year,y=Emissions))+geom_bar(stat='identity')+
      xlab('Year')+ylab('Emissions in tons')+
      ggtitle('Total emissions of PM25 from motor vehicles in Baltimore City, Maryland')+
      theme(plot.title = element_text(lineheight=.8, face="bold"))


dev.off()

