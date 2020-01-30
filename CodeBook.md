# The CodeBook  
##  Source of Data  
The original data of this project is collected from the "Activity Recognition Experiment Using Smartphone Sensors". The scientists mounted a smartphone with sensor on the waist of each subject, and collected, recognized and separated the signals into 6 kinds of daliy activities.  

## The Raw Data
The smartphone sensor collected accelerometer and gyroscope signals, then applied FFT, scaled, statistical calculated, and gained the feature variable matrices. The raw data is complicated and split into a number of text files. The **train data set** is compsed by 3 files, a variable matrix, a subject column, and an activity label numbers. The **test data set** has similar structures of data written in plain text files. The data sets are all numeric matrices, without any identification of activity names and feature variables. There are 2 public files describing the activity label and the feature variables. There are 561 feature variables and 7352 records in the orginal data.

## The Tidy Data
After data manipulation and cleaning, the tidy data set is written in *"tidyDataHARUS.txt"*. The tidy data set includes 21 train subjects and 9 test subjects, which are numbered in 1-30. They performed 6 daily activities, including *WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING*. The feature variables is produced in 17 differen types:
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
(Triaxial siganals were collected in X, Y, and Z directions, separately).
Only the mean and standard deviation of each variable were kept in the tidy data, and both the "mean" and "std" of each variable were average astimated by each subject and each activity.


## Refernce:  
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
