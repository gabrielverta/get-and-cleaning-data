library(dplyr)
library(readr)

# Path to file
getPath <- function(axis, type){
    name <- paste(type, ".txt", sep = "")
    dataset <- paste(axis, name, sep = "")
    path <- paste(type, dataset, sep = "/")
}

# Get dataset
getDataset <- function(dataset){
    path <- getPath("X_", dataset)
    read_fwf(path, fwf_widths(rep(16, times=561)), progress=interactive())
}

# Activities for each row
getActivities <- function(dataset){
    path <- getPath("y_", dataset)
    as.numeric(readLines(path))
}

# Organize dataset
organizeDataset <- function(dataset){
    x <- getDataset(dataset)
    y <- getActivities(dataset)
    
    mutate(x, subject=dataset, activity=y)
}

# Merge trainning and test datasets 
mergeDatasets <- function(){
    training_dataset <- organizeDataset("train")
    test_dataset <- organizeDataset("test")
    rbind(training_dataset, test_dataset)
}

# Original col names
getOriginalColNames <- function(){
    number_names <- readLines("features.txt")
    names <- make.names(gsub("^\\d+ ", "", number_names))
    names[562] <- "subject"
    names[563] <- "activity"
    names
}

# Extracts only the measurements on the mean and standard deviatioin
extractMeanAndStandardDeviation <- function(data){
    names <- getOriginalColNames()
    cols <- grep("\\.mean\\.|\\.std\\.", names)
    cols <- c(cols, 562, 563)
    final_names <- names[cols]
    final_data <- data[, cols]
    colnames(final_data) <- final_names
    final_data
}

# Appropriately labels the data set with descriptive variable names
tidyDataSet <- function(){
    data <- mergeDatasets()
    data <- extractMeanAndStandardDeviation(data)
    write.table(data, file = "tidy.txt", row.names = FALSE);
    data
}

# Independent tidy data set with the average of each variable for each activity and each subject
averages <- function(){
    data <- tidyDataSet()
    grouped <- group_by(data, activity, subject)
    summarise_each(grouped, funs(mean, "mean", mean(., na.rm = TRUE)), -c(subject, activity))
}