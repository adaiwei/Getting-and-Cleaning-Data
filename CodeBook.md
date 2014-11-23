CodeBook
========================================================

This document listed the details of the source data, our transformation step, and result tidy dataset variables.

### Source Data Collection and Description

The source data was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The name of this dataset is "Human Activity Recognition Using Smartphones Dataset". It contains data of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. Each subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) with a sensor-equipped smartphone attached to their waist. The smartphone's accelerometer and gyroscope used to capture 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

### Data Transformation Steps 
* Load source data
 * Read in corresponding variables/dataframes from X_train.txt, y_train.txt, X_test.txt, y_test.txt, features.txt, activity_labels.txt, subject_train.txt, subject_test.txt
* Merge training and test dataset
 * Combine training and test dataset through rbind function
 * Use the 2nd column content from features.txt to rename combined dataset
* Extracts only the measurements on the mean and standard deviation for each measurement
 * Generate an intermediate dataset from the merged data, only keep variables with labels that contain "mean" and "std"
* Uses descriptive activity names to name the activities in the data set
 * Add a new column upon the intermediate data set with the activity description. Activity id column is used to look up descriptions in activity_labels.txt file
* Appropriately labels the data set with descriptive variable names
 * Used gsub function to normalize some variable names which do not follow the variable naming rule in R, or naming is too short to be understood
* Summarize the data by calculating averaging all mean and std measurement columns by grouping on activity and then subject
* Export the summarized data to a text file in the working directory

### Complete Tidy Dataset Variables
* activity: descriptive labels based on the information inside of "activity_labels.txt"
* subjectID: 1-30 based on which subject performed the activity
* timeBodyAcc-Mean-X
* timeBodyAcc-Mean-Y
* timeBodyAcc-Mean-Z
* timeBodyAcc-StandardDeviation-X
* timeBodyAcc-StandardDeviation-Y
* timeBodyAcc-StandardDeviation-Z
* timeGravityAcc-Mean-X
* timeGravityAcc-Mean-Y
* timeGravityAcc-Mean-Z
* timeGravityAcc-StandardDeviation-X
* timeGravityAcc-StandardDeviation-Y
* timeGravityAcc-StandardDeviation-Z
* timeBodyAccJerk-Mean-X
* timeBodyAccJerk-Mean-Y
* timeBodyAccJerk-Mean-Z
* timeBodyAccJerk-StandardDeviation-X
* timeBodyAccJerk-StandardDeviation-Y
* timeBodyAccJerk-StandardDeviation-Z
* timeBodyAngularSpeed-Mean-X
* timeBodyAngularSpeed-Mean-Y
* timeBodyAngularSpeed-Mean-Z
* timeBodyAngularSpeed-StandardDeviation-X
* timeBodyAngularSpeed-StandardDeviation-Y
* timeBodyAngularSpeed-StandardDeviation-Z
* timeBodyAngularSpeedJerk-Mean-X
* timeBodyAngularSpeedJerk-Mean-Y
* timeBodyAngularSpeedJerk-Mean-Z
* timeBodyAngularSpeedJerk-StandardDeviation-X
* timeBodyAngularSpeedJerk-StandardDeviation-Y
* timeBodyAngularSpeedJerk-StandardDeviation-Z
* timeBodyAccMagnitude-Mean
* timeBodyAccMagnitude-StandardDeviation
* timeGravityAccMagnitudenitude-Mean
* timeGravityAccMagnitudenitude-StandardDeviation
* timeBodyAccJerkMagnitudenitude-Mean
* timeBodyAccJerkMagnitudenitude-StandardDeviation
* timeBodyAngularSpeedMagnitude-Mean
* timeBodyAngularSpeedMagnitude-StandardDeviation
* timeBodyAngularSpeedJerkMagnitudenitude-Mean
* timeBodyAngularSpeedJerkMagnitudenitude-StandardDeviation
* freqBodyAcc-Mean-X
* freqBodyAcc-Mean-Y
* freqBodyAcc-Mean-Z
* freqBodyAcc-StandardDeviation-X
* freqBodyAcc-StandardDeviation-Y
* freqBodyAcc-StandardDeviation-Z
* freqBodyAccJerk-Mean-X
* freqBodyAccJerk-Mean-Y
* freqBodyAccJerk-Mean-Z
* freqBodyAccJerk-StandardDeviation-X
* freqBodyAccJerk-StandardDeviation-Y
* freqBodyAccJerk-StandardDeviation-Z
* freqBodyAngularSpeed-Mean-X
* freqBodyAngularSpeed-Mean-Y
* freqBodyAngularSpeed-Mean-Z
* freqBodyAngularSpeed-StandardDeviation-X
* freqBodyAngularSpeed-StandardDeviation-Y
* freqBodyAngularSpeed-StandardDeviation-Z
* freqBodyAccMagnitude-Mean
* freqBodyAccMagnitude-StandardDeviation
* freqBodyAccJerkMagnitudenitude-Mean
* freqBodyAccJerkMagnitudenitude-StandardDeviation
* freqBodyAngularSpeedMagnitude-Mean
* freqBodyAngularSpeedMagnitude-StandardDeviation
* freqBodyAngularSpeedJerkMagnitudenitude-Mean
* freqBodyAngularSpeedJerkMagnitudenitude-StandardDeviation


### References
* Human Activity Recognition Using Smartphones Data Set. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 
* Feature_info.txt (A file embedded in UCI HAR Dataset which give detail illustration of the source data variables)