# Project Code Book

## Files

* features.txt: *contains the names of each variable observed (column on dataset)*
* activity_labels.txt: *contains activity names for each number*

### Observations

**train**: Train data set
* train/X_train.txt: *contains one row per observation of each variables in the analysis separated by fixed-width of 16 characters*
* train/Y_train.txt: *contains one row for each row on X_train.txt containing the id of the activity of the observation (line number on Y is the activity of line number on X)*

**test**: Test data set
* test/X_test.txt: *contains one row per observation of each variables in the analysis separated by fixed-width of 16 characters*
* test/Y_test.txt: *contains one row corresponding to the activity to the row on X_test.txt*

#### Features

Features on X_train and X_test are normalized and bounded within [-1,1].

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

## Steps

The following steps were done to get the tidy dataset:

### function tidyDataSet

**Merges the training and the test sets to create one data set**

First of all, X (original variables) and Y (activity) where merged for both training and test observations, generating two data sets (training_dataset and test_dataset) like this:

<table>
  <thead>
    <tr>
    <th>variable 1</th>
    <th>variable 2</th>
    <th>...</th>
    <th>subject</th>
    <th>activity</th>
    </tr>
  <thead>
  <tbody>
    <tr>
      <td>###</td>
      <td>###</td>
      <td>...</td>
      <td>train</td>
      <td>1</td>
    </tr>
    <tr>
      <td>###</td>
      <td>###</td>
      <td>...</td>
      <td>train</td>
      <td>2</td>
    </tr>
    <tr>
      <td>###</td>
      <td>###</td>
      <td>...</td>
      <td>test</td>
      <td>1</td>
    </tr>
    <tr>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
  </tbody>
</table>

Then both data sets are merged together.

**Extracts only the measurements on the mean and standard deviation for each measurement.**

The following *regular expression* was used to get variables for mean and standard deviation after using make.names on original field names:

    "\\.mean\\.|\\.std\\."

Using the **grep** function, the indexes were returned to extract the desired variables.

**Uses descriptive activity names to name the activities in the data set**

Using names on activity_labels.txt, activity ids were replaced by activity labels using **mutate** dplyr function

**Appropriately labels the data set with descriptive variable names.**

Original variable names were used, and they can be seeing on features.txt

### function averages

**From the tidy data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

This function calls tidyDataSet and returns the mean for each variable grouped by activity and subject. Using *dplyr* group_by and summarise_each function to return the result of the mean function for each variable, except for the grouped variables (activity and subject).
