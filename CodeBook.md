---
title: "CodeBook.md"
output: html_document
---
Description of the code

The program run_analysis.R is in the github respository containing this project aling with this Code Book.

The program performs 5 steps outlined in the project instructions  to finally produce a file called averages.txt, which is also in the github respository.

The program performs manipulations on the data as follows:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set.

4.  ppropriately labels the data set with descriptive variable names. 

and finally, 5,

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data and Variables used in processing

# X_train, y_train, X_test, y_test, subject_train, subject_test, features.txt. activity_labels.txt are all contained with the data from the origibal download and are in the working directory for R or the cloded github respository on the local computer.

# X_data, y_data, subject_data are merges of the datasets above.

# features contains the names for the X_data dataset which come from features.txt, ssupplied with the original data download.

# features_ms is an indexing vector use to subset the data for those variables that contain means or standard deviation information.

# mydata is a final one big data set that merges X_data, y_data and subject_data.

# averages is a variable used to gold the data by subject and activity that is produced as activity.txt
