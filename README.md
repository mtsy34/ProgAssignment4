# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

This repository hosts the R script and other documentation for the project. The dataset used can be found here: [Human Activity Recognition Using Smartphones](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset).

## Files

```CodeBook.md``` describes the variables, the data, and any transformations or work that have been performed.
```run_analysis.R``` is the script that performs the analyses described in the 5 required steps for transformation. 
```tidy_data.txt``` contains the tidy dataset that is the output from the analysis performed.


## Creating the dataset

The following steps were taken to transform the raw data into the tidy dataset as required for the course project:
* Downloading and unzipping the raw data, if the data does not exist
* Reading the data
* Merging the training and test data to create one data set
* Extracting only the means and standard deviations for each measurement
* Using descriptive activity names to name the activities in the dataset
* Appropriately labelling the dataset with descriptive variable names 
* Creating a tidy dataset containing the average of each variable for each activity and each subject (grouped)
* Writing the dataset to the ```tidy_data.txt``` file
