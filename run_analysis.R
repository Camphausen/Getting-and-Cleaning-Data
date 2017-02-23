## SCRIPT run_analysis.R 
##
## Steps
## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement.
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names.
## 5) From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

rm(list=ls())
library(plyr)

## set working directory 
wd <- "C:/Users/Max/Dropbox/Health-IT/coursera/Data Science - John Hopkins University/Course 3 - Getting and Cleaning Data/dat_3_4"
setwd(wd)

## set paths
pathfile      <- file.path(getwd(),"UCI HAR Dataset")
pathfiletest  <- file.path(pathfile, "test")
pathfiletrain <- file.path(pathfile, "train")
  
## read data into data.frame (this will take a while)
xtest        <- read.table(file.path(pathfiletest,"X_test.txt"))
ytest        <- read.table(file.path(pathfiletest,"Y_test.txt"))
subjecttest  <- read.table(file.path(pathfiletest,"subject_test.txt"))

xtrain       <- read.table(file.path(pathfiletrain,"X_train.txt"))
ytrain       <- read.table(file.path(pathfiletrain,"Y_train.txt"))
subjecttrain <- read.table(file.path(pathfiletrain,"subject_train.txt"))

## get activity labels 
activitylabels <- read.table(file.path(pathfile,"activity_labels.txt"), col.names = c("Id", "Activity"))

## get features labels
featurelabels  <- read.table(file.path(pathfile, "features.txt"), colClasses = c("character"))

## 1) 
## merge training and test
traindata  <- cbind(cbind(xtrain, subjecttrain), ytrain)
testdata   <- cbind(cbind(xtest, subjecttest), ytest)
measurements <- rbind(traindata, testdata)

measurementslabels <- rbind(rbind(featurelabels, c(562, "Subject")), c(563, "Id"))[,2]
names(measurements) <- measurementslabels

## 2) 
## extract measurements with mean and standard deviation
measurementsmeanstd <- measurements[,grepl("mean\\(\\)|std\\(\\)|Subject|Id", names(measurements))]

## 3)
## use descriptive activity names
measurementsmeanstd <- join(measurementsmeanstd, activitylabels, by = "Id", match = "first")
measurementsmeanstd <- measurementsmeanstd[,-1]

## 4)
## appropriately label the data set with descriptive names
names(measurementsmeanstd) <- gsub("([()])","",names(measurementsmeanstd))
names(measurementsmeanstd) <- make.names(names(measurementsmeanstd))

## 5)
## copy data into a tidy data set averaging activity and subject 
finaldata<-ddply(measurementsmeanstd, c("Subject","Activity"), numcolwise(mean))

## make column names easier to read
finaldataheaders <- names(finaldata)

finaldataheaders <- gsub("^t", "time", finaldataheaders)
finaldataheaders <- gsub("^f", "frequency", finaldataheaders)
finaldataheaders <- gsub("Acc", "Accelerometer", finaldataheaders)
finaldataheaders <- gsub("Gyro", "Gyroscope", finaldataheaders)
finaldataheaders <- gsub("Mag", "Magnitude", finaldataheaders)
finaldataheaders <- gsub("BodyBody", "Body", finaldataheaders)

names(finaldata) <- finaldataheaders
write.table(finaldata, file = "measurements_avg_subject.txt", row.name=FALSE)

