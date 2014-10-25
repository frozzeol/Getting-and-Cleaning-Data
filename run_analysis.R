setwd("~/Documents/Coursera Data Scientist Toolbox/3. Getting and Cleaning data/Course Project")

#Merges the training and the test sets to create one data set.
trainingset <- read.table("./UCI HAR Dataset/train/X_train.txt")
traininglabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainingsubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
training <- cbind(trainingsubjects, traininglabels, trainingset)

testset <- read.table("./UCI HAR Dataset/test/X_test.txt")
testlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testsubjects, testlabels, testset)

alldata <- rbind(training, test)

#Appropriately labels the data set with descriptive variable names. 
features <- read.table("./UCI HAR Dataset/features.txt")

features[,2] = gsub('[()]', '', features[,2])
features[,2] = gsub("^(t)","time", features[,2])
features[,2] = gsub("^(f)","freq", features[,2])
features[,2] = gsub("mean","Mean", features[,2])
features[,2] = gsub("std","Std", features[,2])

#Extracts only the measurements on the mean and standard deviation for each measurement. 
colnames(alldata) <- c("subject_id", "activity", features$V2)
cleandata <- alldata[,c(1,2,grep("Std", colnames(alldata)), grep("Mean", colnames(alldata)))]

#Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity = 1
for (activitylabel in activity_labels$V2) {
  cleandata$activity <- gsub(activity, activitylabel, cleandata$activity)
  activity <- activity + 1
}

#From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.
library(plyr)
tidy <- ddply(cleandata, .(subject_id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })

write.table(tidy, file="tidy.txt", row.name=FALSE, sep="\t")
