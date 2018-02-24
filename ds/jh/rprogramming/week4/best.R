best <- function(state, outcome) {
        ## Read outcome data
        outofcare <- 'data/outcome-of-care-measures.csv'
        if( !(outcome == 'heart attack' || outcome == 'heart failure' || outcome == 'pneumonia')){
                stop(" invalid outcome")
        }

        data <- read.csv(outofcare, colClasses = "character")
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
        data[, index]<-suppressWarnings(as.numeric(data[, index]))
        data<-data[state_index,]
        drop(data[which(data[, index] == min(data[, index] ,na.rm=TRUE)),2])
}

