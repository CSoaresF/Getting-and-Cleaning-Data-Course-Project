# Getting-and-Cleaning-Data-Course-Project
Getting and Cleaning Data Course Project

This repository hosts the R scrip, files and documentation for the Data Science's course "Getting and Cleaning data"

The dataset being used is: Human Activity Recognition Using Smartphones Files

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for the project is available at the site:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The CodeBook.md describes the variables, the data, and transformations that was performed to clean up the data.

The R script called run_analysis.R contains the code to perform the clean up the data.
It does the following:
  * Extracts only the measurements on the mean and standard deviation for each measurement. 
  * Uses descriptive activity names to name the activities in the data set
  * Merges the training and the test sets to create one data set. 
  * Appropriately labels the data set with descriptive variable names. 
  * Creates a independent tidy data set "tidy.txt" with the average of each variable for each activity and each subject.

