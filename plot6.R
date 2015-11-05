## Code common for all plots is in ex_data.R file

source('ex_data.R')

## Generate data for fifth plot

plot6_data<-merged_data%>%
      filter(fips=='24510' | fips=='06037')%>%
      filter(grepl('motor',Short.Name,ignore.case=TRUE))%>%
      select(Emissions,type,year,fips)%>%
      group_by(year,fips)%>%
      summarise(Emissions=sum(Emissions))

plot6_data$year <- factor(plot6_data$year, levels=c('1999', '2002', '2005', '2008'))
plot6_data$fips <- factor(plot6_data$fips, levels=c('24510','06037'),
                          labels=c('Baltimore City', 'Los Angeles County'))

## Open file device and do the plot

png('plot6.png',width=640,height=480,type='cairo')

ggplot(plot6_data,aes(x=year,y=Emissions))+geom_bar(stat='identity')+
      xlab('Year')+ylab('Emissions in tons')+facet_wrap(~fips)+
      ggtitle('Total emissions of PM25 from motor vehicles in')+
      theme(plot.title = element_text(lineheight=.8, face="bold"))


dev.off()

