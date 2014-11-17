# Step1: Merges the training and the test sets to create one data set.

## create folder to save project data
if(!file.exists("./project")){
        dir.create("./project")
}

## download file into local depository, and unzip the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./project/projectfile.zip")
unzip("projectfile.zip")


# Step2：Extracts only the measurements on the mean and standard deviation for each measurement. 


# Step3:Uses descriptive activity names to name the activities in the data set


# Step4: Appropriately labels the data set with descriptive variable names. 


# Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.