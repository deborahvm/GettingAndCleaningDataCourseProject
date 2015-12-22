run_analysis <- function() {
 ## input: raw data files (X_train.txt and X_test.txt) which contains the 
 ## Training and Test sets 

 ## output: tidy data set as a txt file created with write.table() function

 ## This script does the following steps:    
 ## 1. Merges the training and the test sets to create one data set.
 ## 2. Extracts only the measurements on the mean and standard deviation for 
 ##    each measurement. 
 ## 3. Uses descriptive activity names to name the activities in the data set
 ## 4. Appropriately labels the data set with descriptive variable names. 
 ## 5. From the data set in step 4, creates a second, independent tidy data set 
 ## with the average of each variable for each activity and each subject.
    
    trainFilePath <- "./rawDataset/train/X_train.txt"
    inputTrain <- read.table(trainFilePath, header=FALSE, dec=".")
    activityTrainFilePath <- "./rawDataset/train/y_train.txt"
    activityTrain <- read.table(activityTrainFilePath, header=FALSE)
    testFilePath <- "./rawDataset/test/X_test.txt"
    inputTest <- read.table(testFilePath, header=FALSE, dec=".")
    activityTestFilePath <- "./rawDataset/test/y_test.txt"
    activityTest <- read.table(activityTestFilePath, header=FALSE)
    featuresFilePath <- "./rawDataset/features.txt"
    features <- read.table(featuresFilePath)
    activityLabelsFilePath <- "./rawDataset/activity_labels.txt"
    activityLabels <- read.table(activityLabelsFilePath)
    newDataSet <- NULL
    labels <- NULL
    count <- 0
    tidyDataSet <- NULL


    fullDataSet <- rbind(inputTrain, inputTest)
    activity <- rbind(activityTrain, activityTest)
    for(i in 1:nrow(activity)){
        checkLabel <- grepl(as.character(activity[i,1]), activityLabels$V1, fixed = TRUE)
        labels[i] <- lapply(activityLabels[checkLabel,]$V2, as.character)
    }
    
    for(i in 1:length(features$V2)){
        checkMean <- grepl('-mean\\(\\)$', features$V2[i]) 
        checkStd <- grepl('-std\\(\\)$', features$V2[i])
        if(checkMean  || checkStd){
            count <- count + 1
            newDataSet <- cbind(newDataSet, fullDataSet[, i])
            colnames(newDataSet)[count] <- paste(features$V2[i])
        }
    }
    
    newDataSet <- cbind(newDataSet, labels)
    colnames(newDataSet)[count+1] <- paste("activity")
    newDataSet <- as.data.frame(newDataSet)
    
    for(i in 1:nrow(activityLabels)){
        subsetByActivity <- subset(newDataSet, as.character(newDataSet$activity) == as.character(activityLabels$V2[i]))
        summarizedByMeanPerActivity <- colMeans(data.matrix(subsetByActivity[1:count]))
        tidyDataSet <- rbind(tidyDataSet, summarizedByMeanPerActivity)
    }
    
    tidyDataSet <- cbind(tidyDataSet, lapply(activityLabels$V2, as.character))
    colnames(tidyDataSet)[count+1] <- paste("activity")
    
    write.table(tidyDataSet, "tidyDataSet.txt", row.name=FALSE)
}