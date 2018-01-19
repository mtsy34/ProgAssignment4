# Code Book for Getting and Cleaning Data Course Project
This code book provides a list of descriptions of the variables and summaries used, as well as created during the transformation.

## Identifiers 
* ```activity```: The type of activity performed when the corresponding measurements were taken
* ```subject```: Subject identifier 

## Data
For each row, the following data is provided.
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.

# Transformations

## Merging of training and test datasets to create one dataset

* ```features.txt```
* ```activity_labels.txt```
* ```subject_train.txt```
* ```x_train.txt```
* ```y_train.txt```
* ```subject_test.txt```
* ```x_test.txt```
* ```y_test.txt```

## Extracting only the means and SDs for each measurement
Subset out only the columns that contain "mean" or "std" using grepl, on top of the Activity and Subject columns.

## Using descriptive activity names to name the activities in the dataset
Replacing the numerical activity indicators with the respective descriptive activity names, by creating a factor out of the "activity" dataset

## Appropriately label the dataset columns with descriptive activity names
Using gsub function for pattern replacement to clean up column names

## Create a separate tidy data set with the mean of each variable for each subject and each activity
Using dplyr functions such as group_by and summarize_each, a separate tidy data set is created with the averages of each variable, grouped by subject and activity, and written into an independent txt file
