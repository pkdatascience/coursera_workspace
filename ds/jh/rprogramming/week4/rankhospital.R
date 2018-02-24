outofcare <- 'data/outcome-of-care-measures.csv'
original <- read.csv(outofcare, colClasses = "character")

rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        if( !(outcome == 'heart attack' || outcome == 'heart failure' || outcome == 'pneumonia')){
                stop(" invalid outcome")
        }
        data<-data.frame(original)
        state_index <- which(data$State==state)
        if(length(state_index) == 0 ){
                stop(' invalid state')
        }
        if( outcome == 'heart attack'){
                index<-11
        }else if(outcome == 'heart failure'){
                index<-17
        }else {
                index<-23
        }
        data<-data[state_index,]
        data[, index] <- suppressWarnings(as.numeric(data[, index]))
        index_column<-colnames(data)[index]
        hospitalname<-"Hospital.Name"
        data<-data[,c(2,index)]
        if(num=="best"){
                hospital<-data[order(data[,2],data[,1],na.last = NA),]
                hospital<-drop(hospital[1,1])
                rm(data)
        }else if( num == "worst"){
                hospital<-data[order(-data[,2],data[,1],na.last = NA),]
                hospital<-drop(hospital[1,1])
                rm(data)
        }
        else{
                hospital<-data[order(data[,2],data[,1],na.last = NA),]
                hospital<-drop(hospital[as.numeric(num),1])
                rm(data)
        }
        return(hospital)
}
