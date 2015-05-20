
## This script merges data from a several .txt files (Human Activity Recognition data from Smartphones)
## and produces a useable tidy data set for deeper annaylis.
##
## The data is broken into 2 categories (Training and Testing). 70% of the data comes from Training text files
## while the remaining 30% comes from the Test text files

## Open 2 required libraries for downstream functions

library(reshape2)
library(dplyr)

## Read 30% of data (2,947 rows) from Test subjects: 2,4,9,10,12,13,18,20,24

subject_test <- read.table("./Session3/test/subject_test.txt")
x_test <- read.table("./Session3/test/X_test.txt")
y_test <- read.table("./Session3/test/y_test.txt")

## Read 70% of data (7,352 rows) from Train subjects: 1,3,5:8,11,14:17,19,21:23,25:30

subject_train <- read.table("./Session3/train/subject_train.txt")
x_train <- read.table("./Session3/train/X_train.txt")
y_train <- read.table("./Session3/train/y_train.txt")

## Read activity labels

act_labels <- read.table("./Session3/activity_labels.txt")
names(act_labels)[2]<-"activity"

## Read Features and make minor change to activty column to take care of duplicate row values, which causes a problem
## downstream in several functions that can not handle duplicate row values.

features <- read.table("./Session3/features.txt")
names(act_labels)[2]<-"activity"
features$V2 <- paste(features[,1], features[,2], sep=" ")

## merge Train and Test data into one large data.frame(merged_data).. should have 10,299 rows
temp_test <- cbind(subject_test,y_test)
all_test <- cbind(temp_test,x_test)

temp_train <- cbind(subject_train,y_train)
all_train <- cbind(temp_train,x_train)

merged_data <- rbind(all_test,all_train)

## Let's change a few columns names to better reflect their content

names(merged_data)[1]<-"subject"
names(merged_data)[2]<-"activity_code"
colnames(merged_data)[3:563] = as.character(features[,2])
merged_data <- merge(merged_data, act_labels, by.x = "activity_code", by.y = "V1")

## Select only the rows containg standard deviation (std) and Average (mean) 10,299 rows and 89 columns

merged_data <- select(merged_data, contains("subject"),  contains("activity"), contains("std"), contains("mean"))

## The melt function takes data in wide format and stacks a set of columns into a single column of data.
merged_data <- melt(merged_data,id=c("activity_code","activity","subject"))

## Now use dcast function to reshape data into its final layout calculating the mean of each variable 
## for each subject and each activity

merged_data <- dcast(merged_data, subject + activity + activity_code ~ variable,mean)

## Create final file for annalysis usage
write.table(merged_data,"./tidy_data.txt",row.names=FALSE)

## Create final file for annalysis usage in CSV format so you can look at it in Excel too
write.csv(merged_data,"./tidy_data.csv")
