## 1. Make sure libraries are loaded
library(data.table)
library(plyr)

## 2. Read data from .txt files

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## 3. Append the y files with the activity number and the subject files
## to the x files with the features data

x_test$Activity <- y_test$V1
x_train$Activity <- y_train$V1
x_test$Subject <- subject_test$V1
x_train$Subject <- subject_train$V1

## 4. Bind the test and train x files together

dataset1 <- rbind(x_test, x_train)

## 5. Re-name the columns by their features

colnames(dataset1) <- features$V2
colnames(dataset1)[562] <- "Activity"
colnames(dataset1)[563] <- "Subject"

## 6. Subset the data to only include variables on the mean, standard 
## deviation, Activity, and Subject

dataset1 <- dataset1[, grepl("mean()|std()|Activity|Subject", names(dataset1), fixed = FALSE)]

## 7. Replace the Activity numbers with the activity names

dataset1 <- within(dataset1, Activity <- factor(Activity, labels = activity_labels$V2))

## 8. Create a second dataset with the mean of each variable by Activity and Subject

dataset2 <- ddply(dataset1, .(Activity, Subject), colwise(mean))
