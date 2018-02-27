rm(list=ls())
library(tidyr)
library(dplyr)
library(sqldf)
library(XML)
library(httr)
download_file<-function(url,dest){
  if( !file.exists(dest)){
    download.file(url = url,destfile = dest,quiet = TRUE,method = "curl")
    return(TRUE)
  }else{
    return(TRUE)
  }
}
#Q2,Q3
url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
destfile_2<-'data/ss06pid.csv'

if(download_file(url,destfile_2)){
  acs<-read.csv(destfile_2,header = TRUE) 
  data<-sqldf("select pwgtp1 from acs where AGEP < 50")
  data2<-acs %>% filter(AGEP < 50) %>% select(pwgtp1) 
  print(paste("Query matched :",str(identical(data,data2)),sep=""))
  
  data <- sqldf("select distinct AGEP from acs")
  data2 <- acs %>% select(AGEP) %>% unique
  print(paste("Query matched :",str(identical(data,data2)),sep=""))
  
}
#Q4How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
#http://biostat.jhsph.edu/~jleek/contact.html
#Reference: http://www.columbia.edu/~cjd11/charles_dimaggio/DIRE/styled-4/styled-6/code-13/
#htmlURL<-'http://biostat.jhsph.edu/~jleek/contact.html'
#html<-htmlTreeParse(htmlURL,useInternalNodes = T)
#xpathSApply(html,"//title",xmlValue)
#html<-GET(htmlURL)
#content2 <- content(html,as='text')
#(parsedHtml <- htmlParse(content2))[5]
#class(parsedHtml)
#nchar(content2)

htmlURL_CONN<-url('http://biostat.jhsph.edu/~jleek/contact.html')
nchar(readLines(htmlURL_CONN)[c(10,20,30,100)])

#Q5:
destfile_for<-'data/wksst8110.for'

url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for'
if(download_file(url,destfile_for)){
  data<-read.fwf(destfile_for,header=FALSE,skip = 4,buffersize=500,widths=c(11,8,6,7,6,7,6,7,6),sep = "\t")
}

sum(data[,"V4"])