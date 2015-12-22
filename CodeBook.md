Code Book: Tidy Data Set
========================

This tidy data corresponds to the mean and standard deviation measurements collected from [Samsung Galaxy S II smartphone accelerometers][dataset]. Each variable is summarized by average for each human activity. 

| Data Set Characteristics: | Value                     |
|---------------------------|---------------------------|
| Size of data set:         | 2,553 bytes               |
| Number of instances:      | 114                       |
| Number of variables:      | 19                        |
| Number of activities:     | 6                         |
| Missing values:           | No                        |

 [dataset]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones# 
 
Source
------
 The raw data was extrated from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
Study design
------------
 
 The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Transformations
---------------
 This section presents all transformations necessary to achieve the tidy data in the folowing sequence:
 
* The raw data set was partitioned into training and test data. Then, both data sets were merged to create one data set.
* From the merged data set, **only** the variables which presents **exactly** "-mean()" or "-std()" patterns in the **end** of its names were extrated. 
* Then, the numbers used to represent the activities were replaced by descriptive activity names in the new data set.
* The corresponding labels for each variable of the new dataset were added. Therefore, the data set now has header. 
* From the new dataset, a independent second data set was created, where the data were grouped by activity. After, the average of each variable was calculated by group. 

Code book
---------
 
| Variables Description     |                           |
|---------------------------|---------------------------|
| Variable name:            | "tBodyAccMag-mean()"      |
| Variable type:            | numeric                   |
| Variable name:            | "tBodyAccMag-std()"       |
| Variable type:            | numeric                   |
| Variable name:            | "tGravityAccMag-mean()"   |
| Variable type:            | numeric                   |
| Variable name:            | "tGravityAccMag-std()"    |
| Variable type:            | numeric                   |
| Variable name:            | "tBodyAccJerkMag-mean()"  |
| Variable type:            | numeric                   |
| Variable name:            | "tBodyAccJerkMag-std()"   |
| Variable type:            | numeric                   |
| Variable name:            | "tBodyGyroMag-mean()"     |
| Variable type:            | numeric                   |
| Variable name:            | "tBodyGyroMag-std()"      |
| Variable type:            | numeric                   |
| Variable name:            | "tBodyGyroJerkMag-mean()" |
| Variable type:            | numeric                   |
| Variable name:            | "tBodyGyroJerkMag-std()"  |
| Variable type:            | numeric                   |
| Variable name:            | "fBodyAccMag-mean()"      |
| Variable type:            | numeric                   |
| Variable name:            | "fBodyAccMag-std()"       |
| Variable type:            | numeric                   |
| Variable name:             |"fBodyBodyAccJerkMag-mean()"|
| Variable type:            | numeric                   |
|Variable name:              |"fBodyBodyAccJerkMag-std()"|
| Variable type:            | numeric                   |
|Variable name:             |"fBodyBodyGyroMag-mean()"  |
| Variable type:            | numeric                   |
|Variable name:             |"fBodyBodyGyroMag-std()"   |
| Variable type:            | numeric                   |
|Variable name:             | "fBodyBodyGyroJerkMag-mean()"|
| Variable type:            | numeric                   |
| Variable name:            |  "fBodyBodyGyroJerkMag-std()"|
| Variable type:            | numeric                   |
| Variable name:            | "activity"                |
| Variable type:            | character                 |
| Comments:                 | description of human activities |
| Allowable values:         | WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |

 

 

 
