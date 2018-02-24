data<-read.csv("hw1_data.csv")

#5 What is the class of the object defined by x <- c(4, TRUE)
x <- c(4, TRUE)
class(x)
#4.If I execute the expression x <- 4 in R, what is the class of the object `x' as determined by the `class()' function?
x<-4
class(x)

#5. What is the class of the object defined by the expression x <- c(4, "a", TRUE)?
x <- c(4, "a", TRUE)
class(x)
#6. If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?

x <- c(1,3, 5) 
y <- c(3, 2, 10)
z<-cbind(x, y)
z

#7.Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me? Select all that apply.
x <- list(2, "a", "b", TRUE)
x[[2]]

#9. Suppose I have a vector x <- 1:4 and y <- 2:3. What is produced by the expression x + y?

x<-1:4
y<-2:3
class(x+y)

#12.Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
head(data,2)

#13.How many observations (i.e. rows) are in this data frame?
dim(data)[1]

#14.  Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
tail(data,2)

#15,What is the value of Ozone in the 47th row?
data[47,"Ozone"]
#17. What is the mean of the Ozone column in this dataset? 
ozone<-length(which(is.na(data["Ozone"])))
# Exclude missing values (coded as NA) from this calculation.
ozone_mean<-mean(data[which(!is.na(data["Ozone"])),"Ozone"],na.rm = TRUE)
#18. Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90.
#What is the mean of Solar.R in this subset?
solar_mean<-mean(data[which(data["Ozone"]>31 & data["Temp"]>90),"Solar.R"],na.rm = TRUE)
#19.What is the mean of "Temp" when "Month" is equal to 6?
temp_mean<-mean(data[which(data["Month"]==6),"Temp"],na.rm = TRUE)
#20.What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
ozone_month_5_max<-max(data[which(data["Month"]==5),"Ozone"],na.rm = TRUE)
