# Human Activity Recognition Using Smartphones Data Set
*Coursera / Johns Hopkins Getting and Cleaning Data Course Project Assignment*

The goal of this assignment is to prepare tidy data that can be used for later analysis based on [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Introduction

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

**Source:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Dependencies

This project depends on the following R packages:

* [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html)
* [readr](https://cran.r-project.org/web/packages/readr/index.html)

## Original Data Set

The original data set used for this project was downloaded from the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In order to get the tidy dataset you should download the files and put it inside current working directory (features.txt, activity_labels.txt, test and train... should be in working directory)

## Usage

The main file of this project is run_analysis.R. There are two main functions on this file:

* **tidyDataSet**: parse test and training data to a tidy dataset containing only mean and standard deviation for each measurement. It also writes a file to the current workspace called tidy.txt with cleaned data
* **averages**: returns a new data set based on tidyDataSet, with the average of each variable for each activity and each subject.

## Code book

You can take a look at which steps were done to get this clean data on [CodeBook.md](https://github.com/gabrielverta/get-and-cleaning-data/blob/master/Codebook.md)
