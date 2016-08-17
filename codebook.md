---
title: "Getting and Cleaning Data Final Project"
author: "Raymond P. McGuire"
date: "August 16, 2016"
output: html_document
---
Getting and Cleaning Data Final Project
=================================


Raymond P. McGuire

Description
-----------

This codebook explains the variables, data, and transformations performed to clean up the data.


Source Data
-----------
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


1. Merge the training and the test sets to create one data set.
---------------------------------------------------------------
The following files have been read into separate tables each:
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt


All of the test and train datasets are merged into a single table using the rbind function in R.

2. Extract only the measurements on the mean and standard deviation for each measurement. 
-----------------------------------------------------------------------------------------

Using grep we extracted all mean and std data for the merged dataset.


3. Use descriptive activity names to name the activities in the data set
------------------------------------------------------------------------
Merge data subset with the activityType table to include the descriptive activity names. 

4. Appropriately labels the data set with descriptive variable names
--------------------------------------------------------------------
The gsub function was used to clean up the variable names. 

5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
----------------------------------------------------------------------------------------
Using the aggregate function for the variables we created a single table containing the averages and means.