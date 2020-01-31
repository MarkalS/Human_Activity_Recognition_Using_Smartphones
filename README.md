# Human Activity Recognition Using Smartphones  
## Data Cleaning Workflow  

# 1. Overview
The datasets and corresponding labels are collected(downloaded), read into R, then combined. All feature variables and activities were properly named. Redundant variables were removed. Finally, each variable was average summarized by subject and activity.

# 2. Process in Details  
## 2.1 Dataset collection  
After downloading the raw data files to the R work directory, the datasets, subject numbers, activity labels numbers were read into the current R environment. The feature variable information and activity-number matching table were also read into the environment. The datasets, subjects and label numbers were separated in "train" and "test" txt files with referring filenames, the feature names and activity labels were shared.  
## 2.2 Combination
Then we row-bound the train and test datasets, as well as the subject numbers and label numbers. We should pay attention to the order, keep all the train set on top or at buttom. Appended


