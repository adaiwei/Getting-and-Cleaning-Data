##Overview

This project requires to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
The data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. And the data used for this project can be downloaded from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

##Files inside of the project depository

There are 4 result files inside of the course project depository:
1. run_analysis.R - the R script to produce the tidy data set
2. CodeBook.md - describes the variables, the data, and transformations I did to clean up the data
3. README.md - this open file which give you basic understanding about how to run the R code, in order to generate the tidy data set
4. tidy_data.txt - the result tidy data set 


## Guidance to execute run_analysis.R code

Below are the general steps inside of the run_analysis.R, which transformed the original data into the tidy data set (There are also comments inside of the R code). Basically you don't need to change anything, just put the R code inside of your RStudio working directory, run it, and it will automatically execute the tasks step by step, and present the result tidy data for you review.
1. load the library of plyr, because we will need to use ddply function in the final step;
2. create a local folder in your working directory, used to save project data;
3. download the data from the link as above, and unzip the compressed file into a project folder (e.g."UCI HAR Dataset");
4. load the data files into several variables/dataframes;
5. merge the training and the test sets to create one data set (bind proper column name to result data from features V2 attribute);
6. extracts only the measurements on the mean and standard deviation for each measurement;
7. uses descriptive activity names to name the activities in the data set;
8. appropriately labels the data set with descriptive variable names. Here we used gsub function to normalize some variable names which do not follow the variable naming rule in R, or naming is too short to be understood;
9. from the data set in above steps, creates a second, independent tidy data set with the average of each variable for each activity and each subject






