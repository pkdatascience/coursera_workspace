outofcare <- 'data/outcome-of-care-measures.csv'
original <- read.csv(outofcare, colClasses = "character")

rankall <- function(outcome, num = "best") {
        ## Read outcome data
        if( !(outcome == 'heart attack' || outcome == 'heart failure' || outcome == 'pneumonia')){
                stop(" invalid outcome")
        }
        data<-data.frame(original)
        states<-sort(drop(unique(data$State)))
        result<-NULL
        for(st in states){
                result<-rbind(result,c(rankhospital(st,outcome,num),st))
        }
        colnames(result)<-c("hospital","state")
        rownames(result)<-states
        as.data.frame(result)
}
