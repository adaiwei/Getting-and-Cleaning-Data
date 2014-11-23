##########################################################################################################

## <Getting and Cleaning Data> Course Project
## Wei Wei
## 2014-11-21

# runAnalysis.R File Description:

# This script will do the following steps against the UCI HAR Dataset 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##########################################################################################################

library("plyr")

# Step0: Download data

## create folder to save project data
if(!file.exists("./project")){
        dir.create("./project")
}

## download file into local depository, and unzip the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./project/projectfile.zip")
unzip("projectfile.zip")

## load the datafile into several variables
xTrain <- read.table('./UCI HAR Dataset/train/X_train.txt',header=FALSE)
yTrain <- read.table('./UCI HAR Dataset/train/y_train.txt',header=FALSE)
xTest <- read.table('./UCI HAR Dataset/test/X_test.txt',header=FALSE)
yTest <- read.table('./UCI HAR Dataset/test/y_test.txt',header=FALSE)
features <- read.table('./UCI HAR Dataset/features.txt',header=FALSE)
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt',header=FALSE)
subjectTrain <- read.table('./UCI HAR Dataset/train/subject_train.txt',header=FALSE)
subjectTest <- read.table('./UCI HAR Dataset/test/subject_test.txt', header=FALSE)


# Step1: Merges the training and the test sets to create one data set (bind proper column name to result data from features V2 attribute).
resultData <- rbind(xTrain,xTest)
colnames(resultData) <- features$V2


# Step2：Extracts only the measurements on the mean and standard deviation for each measurement. 
test <- cbind(yTest, subjectTest)
colnames(test) <- c("activity", "subjectID")
training <- cbind(yTrain,subjectTrain)
colnames(training) <- c("activity", "subjectID")
testAndTraining <- rbind(test,training)
resultDataMeanStd <- resultData[,grepl('mean\\(\\)|std\\(\\)',colnames(resultData))]
resultDataMeanStd <- cbind(testAndTraining,resultDataMeanStd)


# Step3:Uses descriptive activity names to name the activities in the data set
resultDataMeanStd$activity <- factor(resultDataMeanStd$activity,labels=activityLabels$V2)


# Step4: Appropriately labels the data set with descriptive variable names. 
colNameResultData <- names(resultDataMeanStd)
names(resultDataMeanStd) <- gsub("JerkMag","JerkMagnitude",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("BodyGyro","BodyAngularSpeed",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("GravityAccMag","GravityAccMagnitude",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("GyroMag","GyroMagnitude",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("Mag","Magnitude",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("^t","time",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("^f","freq",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("\\()","",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("((BodyBody)|Body)","Body",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("-std","-StandardDeviation",names(resultDataMeanStd))
names(resultDataMeanStd) <- gsub("-mean","-Mean",names(resultDataMeanStd))



# Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
finalTidyData <- ddply(resultDataMeanStd, c("activity","subjectID"), numcolwise(mean))
write.table(finalTidyData, file="tidy_data.txt", row.names = FALSE)
tidyTable <- read.table("tidy_data.txt", header = TRUE)
View(tidyTable)
