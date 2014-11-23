courseprojectC3
===============

This repository generates tidy data as request in course project of course "Getting and Cleaning Data" from Coursera

Steps to obtain the Tidy Data as output:
- Download the Samsung data (link included in the repository) and save it in your computer
- Open the script "run_analysis.R"
- Copy and Paste your working directory in the corresponding section of the script
- The script works as follow:
    - Reads each of the datasets needed to create the tidy data (Train, Test, Features, Subject and Activity data)
    - Assigns labels to each data
    - Merges Train, Subject and Activity data
    - Merges Test, Subject and Activity data
    - Adds rows together for Train and Test data
    - Selects only columns that contains the words "Mean", "mean", "Std", "std", and additionally the "sbuject", "activity"
    - Assigns activity labels
    - Removes symbols like "()" from names in the variables
    - Groups by and summarizes data by activity and subject (mean of each variable)

- You can select and run the whole script
- The output will be a tidy data with the mean of 86 variables per activity and subject

The list of variables in the final dataset is the following:

activity
label_activity
subject
tBodyAcc-mean-X
tBodyAcc-mean-Y
tBodyAcc-mean-Z
tBodyAcc-std-X
tBodyAcc-std-Y
tBodyAcc-std-Z
tGravityAcc-mean-X
tGravityAcc-mean-Y
tGravityAcc-mean-Z
tGravityAcc-std-X
tGravityAcc-std-Y
tGravityAcc-std-Z
tBodyAccJerk-mean-X
tBodyAccJerk-mean-Y
tBodyAccJerk-mean-Z
tBodyAccJerk-std-X
tBodyAccJerk-std-Y
tBodyAccJerk-std-Z
tBodyGyro-mean-X
tBodyGyro-mean-Y
tBodyGyro-mean-Z
tBodyGyro-std-X
tBodyGyro-std-Y
tBodyGyro-std-Z
tBodyGyroJerk-mean-X
tBodyGyroJerk-mean-Y
tBodyGyroJerk-mean-Z
tBodyGyroJerk-std-X
tBodyGyroJerk-std-Y
tBodyGyroJerk-std-Z
tBodyAccMag-mean
tBodyAccMag-std
tGravityAccMag-mean
tGravityAccMag-std
tBodyAccJerkMag-mean
tBodyAccJerkMag-std
tBodyGyroMag-mean
tBodyGyroMag-std
tBodyGyroJerkMag-mean
tBodyGyroJerkMag-std
fBodyAcc-mean-X
fBodyAcc-mean-Y
fBodyAcc-mean-Z
fBodyAcc-std-X
fBodyAcc-std-Y
fBodyAcc-std-Z
fBodyAcc-meanFreq-X
fBodyAcc-meanFreq-Y
fBodyAcc-meanFreq-Z
fBodyAccJerk-mean-X
fBodyAccJerk-mean-Y
fBodyAccJerk-mean-Z
fBodyAccJerk-std-X
fBodyAccJerk-std-Y
fBodyAccJerk-std-Z
fBodyAccJerk-meanFreq-X
fBodyAccJerk-meanFreq-Y
fBodyAccJerk-meanFreq-Z
fBodyGyro-mean-X
fBodyGyro-mean-Y
fBodyGyro-mean-Z
fBodyGyro-std-X
fBodyGyro-std-Y
fBodyGyro-std-Z
fBodyGyro-meanFreq-X
fBodyGyro-meanFreq-Y
fBodyGyro-meanFreq-Z
fBodyAccMag-mean
fBodyAccMag-std
fBodyAccMag-meanFreq
fBodyBodyAccJerkMag-mean
fBodyBodyAccJerkMag-std
fBodyBodyAccJerkMag-meanFreq
fBodyBodyGyroMag-mean
fBodyBodyGyroMag-std
fBodyBodyGyroMag-meanFreq
fBodyBodyGyroJerkMag-mean
fBodyBodyGyroJerkMag-std
fBodyBodyGyroJerkMag-meanFreq
angletBodyAccMean,gravity
angletBodyAccJerkMean,gravityMean
angletBodyGyroMean,gravityMean
angletBodyGyroJerkMean,gravityMean
angleX,gravityMean
angleY,gravityMean
angleZ,gravityMean

