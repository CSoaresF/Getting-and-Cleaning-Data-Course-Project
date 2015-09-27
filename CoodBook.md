CoodBook - Getting and Cleaning Data Course Project

Input files:
The data for the project foram extraidos do UCI HAR Dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The final file variables:
The 561 variables of the train and test files were reduced to 56 mean and 33 standard deviation.
For the final file "tidy.txt" they were only selected those who had 'mean' or 'std' in label.
Were added variables 'subject' and 'activity' to each observation.

Cleaning of data:
    Removal of all variables that were not 'mean' or 'std' in label.
    Correction of some labels:
     '-mean' -> 'Mean'; '-std' -> 'Std', 'BodyBody' -> 'Body'; removal of parenthesis '()'.
    Adding variable 'subject' and 'activity'.
    Calculation of average values observed by subject and activity.

The final file is 180 records, 30 subjects x 6 activities.
