######################################################
# run_analysis.R - Getting and Cleaning Data Project #
######################################################
#
#  R version 3.2.1; RStudio Version 0.98.507; Windows XP
#
# Folder of project: "C:/GCD_PRJ"  (GCD_PRJ = "Getting and Cleaning Data PRoJect")
#       subfolders: /rawdata: raws data (UCI HAR Dataset)
#                   /results: product of project (tidy data)

library(reshape2)

# Download UCI HAR Dataset
setwd("C:/GCD_PRJ/rawdata")
if(!file.exists("UCI HAR Dataset"))
   {  
    file <- "getdata-projectfiles-UCI HAR Dataset.zip"
    web <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(web, file)
    unzip(file)  # creates the folder "UCI HAR Dataset" and the files
   } 

# Load activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Identifies the data on mean and standard deviation
features_selected <- grep(".*mean.*|.*std.*", features[,2])
features_selected.names <- features[features_selected,2]

# Corrects labels
features_selected.names = gsub('-mean', 'Mean', features_selected.names)
features_selected.names <- gsub('-std', 'Std', features_selected.names)
features_selected.names <- gsub('[-()]', '', features_selected.names)
features_selected.names <- gsub('BodyBody', 'Body', features_selected.names)

# Load the datasets Train e Test (only variables with "mean" or "std")
train <- read.table("UCI HAR Dataset/train/X_train.txt")[features_selected]
train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_subjects, train_activities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[features_selected]
test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_subjects, test_activities, test)

# Merge datasets and add labels
train_and_test <- rbind(train, test)
colnames(train_and_test) <- c("subject", "activity", features_selected.names)

# Turn activities & subjects into factors
train_and_test$activity <- factor(train_and_test$activity, levels = activity_labels[,1], labels = activity_labels[,2])
train_and_test$subject <- as.factor(train_and_test$subject)

# Calculate average the observations for subject(30) and activity(6). 180 records. 
train_and_test_melted <- melt(train_and_test, id = c("subject", "activity"))
train_and_test_mean <- dcast(train_and_test_melted, subject + activity ~ variable, mean)

# Write file "tidy.txt" in folder "results"
setwd("C:/GCD_PRJ/")
if(!file.exists("C:/GCD_PRJ/results")) {dir.create("C:/GCD_PRJ/result")}
setwd("C:/GCD_PRJ/results")
write.table(train_and_test_mean, "tidy.txt", row.names = FALSE, quote = FALSE)
# 
