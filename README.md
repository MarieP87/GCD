Getting and Creating Data - Peer Assignement
===
The current directory countains the R script to perform the peer assignement for the course Getting and Creating Data course.

## Data
The data set used for this project was obtained from an experiment carried out on a group of 30 subjects. Each person performed six activities and different features were collected from the accelerometers from their Samsung Galaxy S smartphones. The data was partitionned into two groups, a train and a test data sets countaining respectively 70% and 30% of the initial data.

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The initial getdata-projectfiles-UCI HAR Dataset.zip file was used in the run_analysis.R script.

## Proccessing Data
Project instructions : 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive features names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Blablablablabla

1) Merges the training and the test sets to create one data set.

* The data was extracted from the zip file.
* The files were loaded :
     * features.txt
     * subject_train.txt
     * subject_test.txt
     * X_train.txt
     * X_test.txt
     * y_train.txt
     * y_test.txt
* First, the data were merged by row:
     * `subject_all` = `subject_train` + `subject_test`
     * `X_all` = `X_train` + `X_test`
     * `y_all` = `y_train` + `y_test`
* Then, the data were merged by column : 
     * `merged_data` = `subject_all` + `y_all` + `X_all`
* The result is a data frame with the subjects, the activity codes and the features (in columns) for all the subjects (train + test) (in rows).

2) Extracts only the measurements on the mean and standard deviation for each measurement. 

* The sorted indexes of the columns with a names countaining "mean()" or "std()" were selected : 66 colums.
* A new data frame `mean_std_data` was created with 68 columns : the subjects one, the activity codes one and the 66 previously selected ones.

3) Uses descriptive activity names to name the activities in the data set

* The activity labels file was loaded
* For each of the activity, the activity code was replaced by the activity label, for each row of the `mean_std_data` data frame.

4) Appropriately labels the data set with descriptive features names.

* The characters : `(`, '`)`, and `-` were removed from the column names. Upper case was tolerated in a concerned to be clearer. (The different feature names are detailed below).

5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* Thanks to the function `ddply` from the package `plyr`, the average of each variable for each activity and each subject was computed.


## Tidy data set
The final data set is composed of 180 rows and 68 columns. Each row correspond to a subject-activity combination and each column to a feature. 

Here is a guide to understand the feature names : 
* subject : subject index (1 to 30)
* activity : subject activity name, including : LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
* X, Y, Z : X, Y or Z axis (of the smartphone accelerometer or gyroscope)
* t : time domain signals
* f : frequency domain signals (Fast Fourier Transform (FFT) was applied to the signals)
* Body : body (of the subject related) signals 
* Gravity : gravity related signals
* Acc : acceleration signals from the smartphone accelerometer
* Gyro : angular velocity from the smartphone gyroscope
* Jerk : linear acceleration and angular velocity were derived in time to obtain Jerk signals
* Mag : magnitude of the three-dimensional signals were calculated using the Euclidean norm
* Mean : mean value
* Std : standard deviation value

Here are the diffents feature names : 

    subject
    activity
    tBodyAccMeanX
    tBodyAccMeanY
    tBodyAccMeanZ
    tBodyAccStdX
    tBodyAccStdY
    tBodyAccStdZ
    tGravityAccMeanX
    tGravityAccMeanY
    tGravityAccMeanZ
    tGravityAccStdX
    tGravityAccStdY
    tGravityAccStdZ
    tBodyAccJerkMeanX
    tBodyAccJerkMeanY
    tBodyAccJerkMeanZ
    tBodyAccJerkStdX
    tBodyAccJerkStdY
    tBodyAccJerkStdZ
    tBodyGyroMeanX
    tBodyGyroMeanY
    tBodyGyroMeanZ
    tBodyGyroStdX
    tBodyGyroStdY
    tBodyGyroStdZ
    tBodyGyroJerkMeanX
    tBodyGyroJerkMeanY
    tBodyGyroJerkMeanZ
    tBodyGyroJerkStdX
    tBodyGyroJerkStdY
    tBodyGyroJerkStdZ
    tBodyAccMagMean
    tBodyAccMagStd
    tGravityAccMagMean
    tGravityAccMagStd
    tBodyAccJerkMagMean
    tBodyAccJerkMagStd
    tBodyGyroMagMean
    tBodyGyroMagStd
    tBodyGyroJerkMagMean
    tBodyGyroJerkMagStd
    fBodyAccMeanX
    fBodyAccMeanY
    fBodyAccMeanZ
    fBodyAccStdX
    fBodyAccStdY
    fBodyAccStdZ
    fBodyAccJerkMeanX
    fBodyAccJerkMeanY
    fBodyAccJerkMeanZ
    fBodyAccJerkStdX
    fBodyAccJerkStdY
    fBodyAccJerkStdZ
    fBodyGyroMeanX
    fBodyGyroMeanY
    fBodyGyroMeanZ
    fBodyGyroStdX
    fBodyGyroStdY
    fBodyGyroStdZ
    fBodyAccMagMean
    fBodyAccMagStd
    fBodyBodyAccJerkMagMean
    fBodyBodyAccJerkMagStd
    fBodyBodyGyroMagMean
    fBodyBodyGyroMagStd
    fBodyBodyGyroJerkMagMean
    fBodyBodyGyroJerkMagStd
