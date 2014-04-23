############################################################################
##### 1. Merges the training and the test sets to create one data set. #####
############################################################################

## Extracting files ##
unzip("getdata-projectfiles-UCI HAR Dataset.zip")

## Reading files ##
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, row.names = 1)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

## Merging by rows and naming the columns ##
subject_all <- rbind(subject_train, subject_test)
X_all <- rbind(X_train, X_test)
y_all <- rbind(y_train, y_test)
names(subject_all) <- "subject"
names(X_all) <- features[,1]
names(y_all) <- "activity"

## Merging by columns ##
merged_data <- cbind(subject_all, y_all, X_all)
# write.table(merged_data, "merged_data.txt", quote = F, sep = "\t", row.names = FALSE, col.names = TRUE) #

#####################################################################################################
##### 2. Extracts only the measurements on the mean and standard deviation for each measurement #####
#####################################################################################################

## Selecting the column index with mean() or std() ##
mean_std_index <- sort(c(grep("mean()", colnames(merged_data), fixed = TRUE), grep("std()", colnames(merged_data), fixed = TRUE)))

## Extracting the column with mean() or std() + the columns subject and activity ##
mean_std_data <- merged_data[,c(1,2,mean_std_index)]
# write.table(mean_std_data, "mean_std_data.txt", quote = F, sep = "\t", row.names = FALSE, col.names = TRUE) #


#####################################################################################
##### 3. Uses descriptive activity names to name the activities in the data set #####
#####################################################################################

## Reading activities file ##
activities <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

## Replacing the activities code by the activities labels ##
for (i in 1:nrow(activities)){
	mean_std_data[,2] = gsub(activities[i,1], activities[i,2], mean_std_data[,2])
}

##################################################################################
##### 4. Appropriately labels the data set with descriptive features names.  #####
##################################################################################

## Removing "(", ")", "-" character ##
colnames(mean_std_data) <- gsub("-std()", "Std", gsub("-mean()", "Mean", gsub("-std()-", "Std", gsub("-mean()-", "Mean", colnames(mean_std_data), fixed = TRUE), fixed = TRUE), fixed = TRUE), fixed = TRUE)

#################################################################################################################################
##### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  #####
#################################################################################################################################

## library plyr ##
if (!(is.element("plyr", installed.packages()[,1]))) {install.packages("plyr") }
library(plyr)

## Computing the average of each variable for each activity and each subject ##
average_mean_std_data <- ddply(mean_std_data, .(subject, activity), .fun=function(x){colMeans(x[,-c(1,2)])})

## write the final tidy data set ##
write.table(average_mean_std_data, "average_mean_std_data.txt", quote = F, sep = "\t", row.names = FALSE, col.names = TRUE)

