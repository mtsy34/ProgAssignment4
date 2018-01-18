library(readr)
library(dplyr)

## Getting data ##

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "UCI HAR Dataset.zip"
filepath <- "UCI HAR Dataset"

if(!file.exists(filename)) {
  download.file(URL, filename, mode = "wb")
}

if(!file.exists(filepath)) {
  unzip(filename)
}

## Reading data ##

# Read training data

trainingSubjects <- read.table(file.path(filepath, "train", "subject_train.txt"))
trainingValues <- read.table(file.path(filepath, "train", "X_train.txt"))
trainingActivity <- read.table(file.path(filepath, "train", "y_train.txt"))

# Read test data 

testSubjects <- read.table(file.path(filepath, "test", "subject_test.txt"))
testValues <- read.table(file.path(filepath, "test", "X_test.txt"))
testActivity <- read.table(file.path(filepath, "test", "y_test.txt"))

# Read features

features <- read.table(file.path(filepath, "features.txt"), as.is = TRUE)

# Read activity labels

activity <- read.table(file.path(filepath, "activity_labels.txt"))
colnames(activity) <- c("activityId", "activityLabels")

## Merging the training and test datasets to create one data set ##

humanActivity <- rbind(
  cbind(trainingSubjects, trainingValues, trainingActivity),
  cbind(testSubjects, testValues, testActivity)
)

rm(trainingSubjects, trainingValues, trainingActivity, testSubjects, testValues, testActivity)

colnames(humanActivity) <- c("Subject", features[,2], "Activity")

## Extracting only the measurements on the mean and SD for each measurement ##

columnsToKeep <- grepl("Subject|Activity|mean|std", colnames(humanActivity))
humanActivity <- humanActivity[,columnsToKeep]

## Use descriptive activity names to name the activities in the dataset ##

humanActivity$Activity <- factor(humanActivity$Activity, levels = activity[,1], labels = activity[,2])

## Appropriately label the dataset with descriptive variable names

humanActivityCols <- colnames(humanActivity)
humanActivityCols <- gsub("[\\()-]", "", humanActivityCols)

humanActivityCols <- gsub("ˆf", "frequencyDomain", humanActivityCols)
humanActivityCols <- gsub("ˆt", "timeDomain", humanActivityCols)
humanActivityCols <- gsub("Acc", "Accelerometer", humanActivityCols)
humanActivityCols <- gsub("Gyro", "Gyroscope", humanActivityCols)
humanActivityCols <- gsub("Mag", "Magnitude", humanActivityCols)
humanActivityCols <- gsub("Freq", "Frequency", humanActivityCols)
humanActivityCols <- gsub("mean", "Mean", humanActivityCols)
humanActivityCols <- gsub("SD", "StandardDeviation", humanActivityCols)

humanActivityCols <- gsub("Bodybody", to "Body", humanActivity role)

colnames(humanActivity) <- humanActivityCols
