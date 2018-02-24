library(readr,quietly = TRUE)
rm(list=ls())
pollutantmean<-function(directory,pollutant,id=1:332){
        files<-paste("./specdata/",sprintf("%03d",id),".csv",sep="")
        polluntant_df<-data.frame()
        for(i in seq_along(files)){
                if(files[i] == "./specdata/288.csv")next

                data<-read_csv(files[i],progress=FALSE,col_types = cols())
                polluntant_df<-rbind(polluntant_df,data[complete.cases(data[,pollutant]),pollutant])
        }
        apply(polluntant_df[,pollutant],MARGIN = 2,mean,na.rm=TRUE)
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)


complete<-function(directory,id=1:332){
        df<-data.frame()
        for(i in id){
           file_input<-paste("./specdata/",sprintf("%03d",i),".csv",sep="")
           data<-read_csv(file_input,progress=FALSE,col_types = cols())
           count_data<-nrow(data[complete.cases(data),])
           df<-rbind(df,cbind(sprintf("%03d",i),count_data))
        }
        colnames(df)<-c("id","nobs")
        df
}
complete("specdata", c(2, 4, 8, 10, 12))

complete("specdata", 30:25)

corr<-function(directory,threshold=0){
        cor_result=c()
        id<-1:332
        index<-0
        for(i in id){
                file_input<-paste("./specdata/",sprintf("%03d",i),".csv",sep="")
                data<-read_csv(file_input,progress=FALSE,col_types = cols())
                data<-data[complete.cases(data[,c("sulfate","nitrate")]),c("sulfate","nitrate")]
                count_data<-nrow(data)
                #print(paste("file:",i,",count:",count_data))
                if( count_data>threshold && count_data!=0){
                        index<-index+1
                        cor_result[index] = tryCatch({
                                cor(data[,"sulfate"],data[,"nitrate"])
                        }, warning = function(w) {
                                print(w)
                                0
                        }, error = function(e) {
                                0
                        }, finally = {

                        })
                }
        }
        if(index==0) return(0)
        else
        return(cor_result)
}

cr <- corr("specdata", 150)
head(cr)

summary(cr)

cr <- corr("specdata", 39)
summary(cr)


cr <- corr("specdata")
summary(cr)


pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate",1:332)
cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)


cc <- complete("specdata", 54)
print(cc$nobs)


set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


cr <- corr("specdata")
cr <- sort(cr)
set.seed(868)
out <- round(cr[sample(length(cr), 5)], 4)
print(out)


cr <- corr("specdata", 129)
cr <- sort(cr)
n <- length(cr)
set.seed(197)
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- corr("specdata", 2000)
n <- length(cr)
cr <- corr("specdata", 1000)
cr <- sort(cr)
print(c(n, round(cr, 4)))
