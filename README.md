# Human Activity Recognition Using Smartphones  
## Data Cleaning Workflow  

# 1. Overview
The datasets and corresponding labels are collected(downloaded), read into R, then combined. All feature variables and activities were properly named. Redundant variables were removed. Finally, each variable was average summarized by subject and activity.

# 2. Process in Details  
## 2.1 Dataset collection  
After downloading the raw data files to the R work directory, the datasets, subject numbers, activity labels numbers were read into the current R environment. The feature variable information and activity-number matching table were also read into the environment. The datasets, subjects and label numbers were separated in "train" and "test" txt files with referring filenames, the feature names and activity labels were shared.  
## 2.2 Combination  
Then we row-bound the train and test datasets, as well as the subject numbers and label numbers. We should pay attention to the order, keep all the train set on top or at buttom. Appended the subject index and label numbers to the feature dataset in order to get the combined dataset.  
## 2.3 Extraction  
There were 561 feature variables of this dataset. We should name the dataset columns 1-561 with the feature names at first. The feature variable names was in the feature variable table which was read into our environment in 2.1. Only the the mean and standard deviation for each measurement, which contains "mean()" or "std()", should be kept. It was a little tricky that the variables containing "meanFreq()" were filtered because meanFraq() measured the frequency of the measurements.  
## 2.4 Naming the Activities  
The activity label numbers were matched with the activity label-name table. The descriptive activity names replaced the label numbers.  
## 2.5 Gathering the Data  
Feature varaible names (the column names) were used as the key, and the results of measurements (values in each cell) were concerned as the value, to gather the dataset. The function "gather()" used here is perfomed like unpivot in Excel.
## 2.6 Average the Measurements  
The dataset was grouped by subjects, activities, and variable measurements. Finally, each variable measurements were average estimated by each activity and each subject.  

# 3. Output the Tidy Data
A plain text file was written as the output of the cleaned dataset without rowname. The output file was named "tidyDataHARUS.txt".
