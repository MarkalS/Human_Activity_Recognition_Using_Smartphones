# Course Project
# Human_Activity_Recognition_Using_Smartphones
setwd("./UCI HAR Dataset/")  # All data is in this folder
library(dplyr)
library(tidyr)

# 1.Reading Datasets
## The Activity Labels and Features
activeLabel <- read.table("activity_labels.txt", stringsAsFactors = F)
featuresTB <- read.table("features.txt", stringsAsFactors = F)

## The Train Data
trainSet <- read.table("./train/X_train.txt", stringsAsFactors = F)
trainLabel <- read.table("./train/y_train.txt", stringsAsFactors = F)
trainSubject <- read.table("./train/subject_train.txt", stringsAsFactors = F)

## The Test Data
testSet <- read.table("./test/X_test.txt", stringsAsFactors = F)
testLabel <- read.table("./test/y_test.txt", stringsAsFactors = F)
testSubject <- read.table("./test/subject_test.txt", stringsAsFactors = F)


# 2.Merges the training and the test sets
testSet$Group <- "test"
trainSet$Group <- "train"
dbCombine <- bind_rows(trainSet, testSet)
subCombine <- bind_rows(trainSubject, testSubject)
lbCombine <- bind_rows(trainLabel, testLabel)
dbCombine$Subjects <- subCombine$V1
dbCombine$Label_Num <- lbCombine$V1


# 3.Extracts only the measurements on the mean and standard deviation 
#   for each measurement
colnames(dbCombine)[1:561] <- featuresTB$V2
selectedNm <- grep("mean\\(\\)|std\\(\\)", featuresTB$V2)
dbMeaStd <- dbCombine[, c(selectedNm, 562:564)]
colnames(dbMeaStd) <- gsub("\\(\\)\\-|\\(\\)$", "", colnames(dbMeaStd))


# 4.Uses descriptive activity names to name the activities in the data set
# 5.Appropriately labels the data set with descriptive variable names
# 6.From the data set in step 4, 
#   creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject
dbRecords <- dbMeaStd %>% 
    mutate(ActivityLabel = activeLabel$V2[match(Label_Num, activeLabel$V1)]) %>% 
    select(-Label_Num) %>% 
    gather("Var_StatsType", "StatsResults", -Group, -Subjects, -ActivityLabel) %>% 
    separate(Var_StatsType, c("Var", "StatsType")) %>% 
    group_by(Subjects, Var, StatsType, ActivityLabel)

dbSummarize <- dbRecords %>% summarize(StatsResults = mean(StatsResults))
dbTidy <- dbRecords %>% 
    distinct(Subjects, Group, ActivityLabel, Var, StatsType) %>% 
    left_join(dbSummarize, by = c("Subjects", "Var", "StatsType", "ActivityLabel"))


# 7.Write the tidy data set
write.table(dbTidy, "tidyDataHARUS.txt", row.names = F)
