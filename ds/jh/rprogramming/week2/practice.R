# control structure
# if , else
# for
# while
#repeat,  break   repeat{
#  break;
#}


add_2 <- function(a,b){
        return(a+b)
}
add_2(2,4)


data<-rnorm(100)
search()

# Date  and Time
# Date, POSIXct, POSIXlt
# weekdays, months , quarters
# strptime
x<-as.Date("2012-01-01")




weekdays(x)

x<-Sys.time()
class(x)
p<-as.POSIXlt(x)
unclass(p)

p<-as.POSIXct(x)
unclass(p)

dateString<-c("January 10, 2012 10:40","December 9, 2011 9:10")
x<-strptime(dateString,"%B %d, %Y %H:%M")
x

x <- 1:10
if(x > 5) {
        x <- 0
}
