rm(list=ls)
library(dplyr)
library(ggplot2)

activity_df<-read.csv('data/activity.csv',colClasses = c("numeric","character","numeric"),stringsAsFactors = FALSE)
activity_df<-activity_df %>% mutate(date=as.Date(date,"%Y-%M-%d"))
activity_df[which(is.na(activity_df$steps)),c('steps')]<-0

activity_steps<-activity_df %>% select(date,steps) %>%group_by(date) %>%summarise( steps = sum(steps))

activity_steps

geom_histogram(activity_steps$steps,xlab="steps") 

hist(activity_steps$steps,xlab="steps",col="blue")

ggplot(data=activity_steps, aes(x=steps,colour=date) )+ 
  geom_histogram(color="black", fill = "white",bins=30, alpha=0.5, position="dodge") +
  labs(title="Histogram of Total Steps Per Day",x="Steps", y = "Frequency") + 
  scale_color_brewer(palette="Dark2") + 
  theme_minimal()
  

?hist


