# HumanActivityRecognition
Human Activity Recognition Using Smartphones Data Set - Assignment 1 Getting and Cleaning Data

## Introduction
The aim of this analysis is to provide a tidy set of data containing average files for mean and std variables from a set of experiments conducted on 6 activities for 30 subjects wearing a Samsung Galaxy S II phone. 

This repository contains:
1. run_analysis.R - an R script loading the original dataset, selecting relevant information from that data set and tidying it. 
2. Codebook - A description of the variables in the tidy data set produced by the run_analysis.R script
3. README.md - A markdown file describing what steps have been taken to produce the tidy data set

## run_analysis.R
This script can be used to produce the tidy data set. 
### steps
The following steps were taken. Each step will be described in more detail
1. Loading the provided data
2. Merging training and test data
3. Labelling the variables
4. Loading activity descriptions
5. Selecting all variables that represent mean and std measures
6. Make variable names more descriptive
7. Merge activity descriptions with data set
8. Remove acitivty number due to redundancy
9. Create tidy data set, aggregating on subject,activity and averaging the numbers
10. Write tidy data set

#### Loading the data
The data is assumed to be available in the working directory. The data contains a folder structure, where the folder 'UCT HAR Dataset' is the folder in the working directory containing some description files and 2 subfolders: 'train' and 'test'. These contain 3 files each with measurement (X_train.txt and C_test.txt), activity (y_train.txt and y_test.txt) and subject (subject_train.txt and subject_test.txt) data. 

The measurment, activity and subject files contain the same number of lines and are combined in one data.frame with cbind

#### Merging the data
The two combined datasets are then combined in one data.frame with rbind.

#### Labelling the variables
Feature names are retrieved from the file  'UCI HAR Dataset/features.txt'. These are used to name all columns in the combined dataset but the first two, which are 'activity_number' and 'person'. 

#### Selecting variables
The request is only to retain variables that represent mean() or std() measures. These are retrieved from the column names through searching for the substring mean() and std(). Together with 'activity_number' and 'person' these columns are selected and stored in the data.frame 'selection'

#### Make variable names more descriptive
The following steps were taken to make the variable names more descriptive:
1. retrieve the column names in a list cols
2. replace 'Gyro' with full text 'Gyroscope'
3. replace 'Acc' with full text 'Acceleration'
4. Replace '-mean()' with 'Mean'
5. Replace '-std()' with 'StandardDeviation'
6. Replace 'Mag' with 'Magnitude'
7. Replace start of string 't' with 'Time'
8. Replace start of string 'f' with 'Frequency'
9. replace '-X', '-Y', '-Z' with 'X-axis', 'Y-axis', 'Z-axis'
10. reset column names of data.frame selection with updated cols list

#### Merge activity descriptions with data set
The activity descriptions have been loaded in a data.frame activity_label. This data.frame is merged with the selection

#### Remove activity number
Selection now contains both activity_number and activity_description. The first one is removed to prevent redundancy

#### Create tidy data set
Tidy data should contain one variable per column and contain one observation per row. In this set one observation has been interpreted as a person/activity combination. 
Data per measure is averaged per person/activity combination and stored in a wide data set with 66 variable columns (in addition to person and activity_description)
Data is averaged with the aggregate command, with a mean parameter. The 66 variables are therefore averaged per person/activity combination
This leads to a set with 180 rows and 68 columns. The names of the first two columns have been lost with the aggregate command and are reset with the rename command. 

#### write tidy data set
The tidy data set is then stored in the working directory with the write.table command to the file 'assignment1.txt'. 
row.names 