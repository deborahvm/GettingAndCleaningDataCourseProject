Getting and Cleaning Data Course - Project
==========================================

This project presents a tidy data set prepared for later data analysis. This tidy data corresponds to the mean and standard deviation measurements collected from [Samsung Galaxy S II smartphone accelerometers][dataset].

[dataset]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones# 

Repo Files
----------

This repository is composed of other 3 files, as described below:

1. tidyDataSet.txt, a txt file which contais the variables corresponding to the mean and standard deviation measurements from the smartphone accelerometers for each human activity; 
2. CodeBook.md, a code book that describes the variables, the data, and transformations performed to clean up the raw data;
3. run_analysis.R, the R script which contains the steps that I used to go from the raw data to the tidy data set.

How the run_analysis work?
--------------------------

**NO INPUT PARAMETER**

**INPUT:** raw data files (X_train.txt and X_test.txt) which contains the training and test sets

**OUTPUT:** tidy data set as a txt file created with write.table() function

 This script does the following steps:    
 1. Use the rbind function to merge training and the test sets to create the fullDataSet. Also, this function was used to merge the activities labels correspoding to training and test sets to create the activity data.
 2. From the merged data set, use the grepl function to extracts **only** the measurements which presents **exactly** "-mean()" or "-std()" patterns in the **end** of its names were extrated to build the newDataSet. Example: grepl('-mean\\(\\)$', features$V2[i]);  
 3. From the activity data, the paste command is used to replace the number by the corresponding activity name in the new data set;
 4. From the new data set, the colMeans function is used to summarize the variables by mean per activity in order to create a second independent tidy data set (tidyDataSet);
 5. Use the lapply and paste functions to appropriately label the tidy data set with the descriptive variable names. 



