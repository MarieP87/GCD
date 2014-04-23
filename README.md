Getting and Creating Data - Peer Assignement
===
The current directory countains the R script to perform the peer assignement for the course Getting and Creating Data course.

## Data
The data set used for this project was obtained from an experiment carried out on a group of 30 subjects. Each person performed six activities and different features were collected from the accelerometers from their Samsung Galaxy S smartphones. The data was partitionned into two groups, a train and a test data sets countaining respectively 70% and 30% of the initial data.

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The initial `getdata-projectfiles-UCI HAR Dataset.zip` file was used in the `run_analysis.R` script.

## Proccessing Data
Project instructions : 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Blablablablabla

1. Merges the training and the test sets to create one data set.
* The data was extracted from the zip file.
* The files used for the analysis were loaded :
** `features.txt`
** `activity_labels.txt`
** `subject_train.txt`
** `subject_test.txt`
** `X_train.txt`
** `X_test.txt`
** `y_train.txt`
** `y_test.txt`
  
