## run_Analysis.R
# This is the R script for loading and tidying data for course project 1 of the Getting and Cleaning Data MOOC
# The script contains comments for the statements used. A more general explanation of the approach is available in the Readme markdown
# file available in the github repo. 
# There you can also find the code book for the variables selected. 

library(dplyr)
# Load train measurements
# Specifications state that the script should work as long as the Samsung data is in the working directory. I have assumed this means
# the data should be in the working directory in the original folder structure, i.e. the directory UCI HAR Dataset should be in the 
# working directory. 
train_set <- read.table("UCI HAR Dataset/train/X_train.txt", fill=TRUE, header=FALSE)
# Load train activities
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
# Loiad train subjects
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
# Combine train measurements, activities and subjects in 1 data frame
train_res <- cbind(train_activity, train_subject, train_set)
# Load test meausurements
test_set <- read.table("UCI HAR Dataset/test/X_test.txt", fill=TRUE, header=FALSE)
# Load test activities
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", fill=TRUE, header=FALSE)
# Load test subjects
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
# Combine test measurements, activities and subjects in 1 data frame
test_res <- cbind(test_activity, test_subject, test_set)
# Combine train and test set in one new data.frame
res <- rbind(train_res, test_res)
# Load measurement labels
label <- read.table("UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors = FALSE)
# Set column names, with "activity_number" and "person" as first two columns, then the read labels
colnames(res) <- c("activity_number", "person", label$V2)
# Read descriptive activity names
activity_label=read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE, header=FALSE)
# Set column names for descriptive activity names. 
colnames(activity_label) <-  c("activity_number", "activity_description")
# Retrieve column names
cols <- colnames(res)
# Determine which variable names end in std() or mean()
matches <- grep("mean\\(\\)|std\\(\\)", cols)
# Store solumn names for matches in varsToRetain
varsToRetain <- cols[matches]###
# Select varsToRetain (in addition to mean and std measurements, this includes the activity_number and subject)
selection <- res[,c("activity_number", "person", varsToRetain)]

# Improve on variable naming. First get current column names
cols <- colnames(selection)
# Replace "Gyro" with full text "Gyroscope"
cols <- gsub("Gyro", "Gyroscope", cols)
# Replace "Acc" with full text "Acceleration"
cols <- gsub("Acc", "Acceleration", cols)
# Replace "-mean()" with noun "Mean" 
cols <- gsub("-mean\\(\\)", "Mean", cols)
# Replace "-std()" with noun "Standard Deviation"
cols <- gsub("-std\\(\\)", "StandardDeviation", cols)
# Replace "Mag" with "Magnitude"
cols <- gsub("Mag", "Magnitude", cols)
# Replace letter t at beginning of string with "Time"
cols <- sub("^t", "Time", cols)
# Replace letter f at beginning of string with "Frequency"
cols <- sub("^f", "Frequency", cols)
# Replace "-X", "-Y", "-Z" at end of string with "X-Axis", etc. 
cols <- sub("-X", "X-Axis", cols)
cols <- sub("-Y", "Y-Axis", cols)
cols <- sub("-Z", "Z-Axis", cols)
# Replace colnames of selection with revised variable names
colnames(selection) <- cols

# merge activity_label and selection. This will be done on the basis of their common variable activity_number, 
# adding an activity_description column

selection <- merge(activity_label, selection)

## Averaging and tidying the data

# Remove activity_number as this is redundant information
selection <- selection[,-1]

# Create table with average values per activity/subject combination. 
# I chose a wide format, with each row describing an activity/person combination, followed by the average for all measurements
tidyset <- aggregate(selection[,3:68], list(selection$activity_description, selection$person) , mean)
# Set column names for acitvity_description and person
tidyset <- rename(tidyset, activity_description=Group.1,person=Group.2)
write.table(tidyset, file="assignment1.txt",row.names=FALSE)
