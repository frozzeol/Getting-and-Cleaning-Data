##Getting and Cleaning Data Project

###Overview
Aadditional information about the variables, data and transformations used in the R script called run_analysis.R.

###Source Data
A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Source data can be obtained from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

For each record, it is provided: 
  1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  2. Triaxial Angular velocity from the gyroscope. 
  3. A 561-feature vector with time and frequency domain variables. 
  4. Its activity label. 
  5. An identifier of the subject who carried out the experiment.

The datasets used in the script are:
  1. 'features.txt': List of all features.
  2. 'activity_labels.txt': Links the class labels with their activity name.
  3. 'train/X_train.txt': Training set.
  4. 'train/y_train.txt': Training labels.
  5. 'test/X_test.txt': Test set.
  6. 'test/y_test.txt': Test labels.  
  7. 'train/subject_train.txt' and 'test/subject_test.txt' Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

###Processing Steps
  1. Merges the training and test sets to create one data set to create 'alldata'
  2. Reads features.txt. These are the labels of the data. Appropriate the labels with descriptive names and remove the brackets (). Together with 'subject_id' and 'activity', these are the column names of the 'alldata' data set.
  3. Extracts only the measurements on the mean and standard deviation for each measurement, to create the 'cleandata' data set.
  4. Reads activity_labels.txt and applies descriptive activity names to name the activities in the 'cleandata' data set:
    walking
    walkingupstairs
    walkingdownstairs
    sitting
    standing
    laying
  5. Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The result is saved as tidy.txt data set.