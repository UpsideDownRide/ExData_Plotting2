## Exploratory data analysis course project 2 by Radomir Nowacki

## Set up enviroment

library(dplyr)

if(basename(getwd())!='ExData_Plotting2'){
      dir.create('./ExData_Plotting2/')
      setwd('./ExData_Plotting2/')
}

## 1) Download the data if we dont have it

filename_zip<-'ex_data.zip'
filename_code<-'Source_Classification_Code.rds'
filename_summary<-'summarySCC_PM25.rds'
fileurl<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'

## Check if data files exists and if not - download them

if(!(file.exists(filename_code)&file.exists(filename_summary))){
      if(!file.exists(filename_zip)){
            download.file(fileurl,filename_zip)
      }
      unzip(filename)
}

## Check if data was read in. If not - read it in

if(!(exists('NEI') & nrow(NEI)==6497651 & ncol(NEI)==6)){
      NEI <- readRDS("summarySCC_PM25.rds")      
}

if(!(exists('SCC') & nrow(SCC)==11717 & ncol(SCC)==15)){
      SCC <- readRDS("Source_Classification_Code.rds")
}

## Check if we have merged data. If not - create it

if(!(exists('merged_data') & nrow(merged_data)==6497651 & ncol(merged_data)==6)){
      merged_data<-merge(select(SCC,SCC,Short.Name),select(NEI,-Pollutant))
}