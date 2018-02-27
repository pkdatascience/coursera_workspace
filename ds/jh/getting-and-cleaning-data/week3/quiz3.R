rm(list=ls())
library(tidyr)
library(dplyr)
library(jpeg)
download_file<-function(url,dest){
  if( !file.exists(dest)){
    download.file(url = url,destfile = dest)
    return(TRUE)
  }else{
    return(TRUE)
  }
}
destfile<-"data/hid.csv"
url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
hid<-read.csv(destfile,header = TRUE)

which(hid$ACR==3 & hid$AGS==6)

#Q2
jpegdestfile<-'data/jeff.jpg'
url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
if( download_file(url ,jpegdestfile) ){
  jpeg_data<-readJPEG(jpegdestfile, native = TRUE)
  print(paste("30th quantile",quantile(jpeg_data,.30),sep=" : "))
  print(paste("80th quantile",quantile(jpeg_data,.80),sep=" : "))
}else{
  print("failed to download and process the image")
}
#Q3
gdp_file<-'data/GDP.csv'
educational<-'data/edu.csv'
url1<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
url2<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
if( download_file(url1 ,gdp_file) & download_file(url2 ,educational)){
  print("downloaded")
}

gdp.df<-read.csv(gdp_file,skip = 5,header = FALSE,nrows = 232,sep=",",encoding = "UTF-8",
         colClasses = c("character","numeric","character","character","character",rep("character",5)))
colnames(gdp.df)<-c('CountryCode','Ranking','','Country','GDP',rep('',5))

gdp.df<-gdp.df[,c('CountryCode','Ranking','Country','GDP')]
gdp.df <- suppressWarnings(gdp.df %>%
      mutate(GDP=gsub('\\,','',as.character(GDP))) %>%
      mutate(GDP=as.numeric(GDP)) %>%
      filter(!is.na(GDP)))

country<-read.csv(educational,colClasses = rep("character",31))
gdp_order<-gdp.df %>%
  filter(length(Ranking)>0 & !is.na(Ranking)) %>%
  arrange(desc(Ranking))

nrow(gdp_order %>% filter(CountryCode %in% country$CountryCode))

gdp_order[13,]
          
#Q4
highNonOECD<-country %>% filter(Income.Group=='High income: nonOECD') %>%select(CountryCode)
highOECD<-country %>% filter(Income.Group=='High income: OECD') %>%select(CountryCode)
as.character(highOECD[,1])

apply(gdp.df %>% filter(CountryCode %in% highOECD[,1]) %>%select(Ranking),2,mean,na.rm=TRUE)
apply(gdp.df %>% filter(CountryCode %in% highNonOECD[,1]) %>%select(Ranking),2,mean,na.rm=TRUE)



gdp_asc<-gdp.df %>%
  filter(length(Ranking)>0 & !is.na(Ranking) & Ranking<=38) %>%
  arrange(Ranking)

#Q5
quantile(gdp.df%>%select(Ranking),na.rm=TRUE)

(tbl_country_income<-table(country %>% select(CountryCode,Income.Group)%>%filter(Income.Group!='')))
tbl_country_income<-as.data.frame.matrix(x=tbl_country_income,row.names = NULL)
colnames(tbl_country_income)<-gsub(" ", "", colnames(tbl_country_income))

tbl_country_income%>%select(Lowermiddleincome)%>%filter(Lowermiddleincome!=0)
#need to look for better approach
countries<-rownames(tbl_country_income[which(tbl_country_income$Lowermiddleincome==1),]%>%select(Lowermiddleincome))

gdp_asc%>%filter(CountryCode %in% countries)