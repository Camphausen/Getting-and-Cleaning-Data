Code Book
========

Raw Data
-------------------

UCI Machine Learning repository: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

#### Data Set Information

30 volunteers (age range 19-48 years) performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The phone captured 3-axial linear acceleration and 3-axial angular velocity at 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

##### Attribute Information:

For each record in the dataset it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment. 

See Readme file into 'UCI HAR Dataset' for more information.


Raw Data Transformation
-------------------

The script run_analysis.R performs the 5 tasks.

1) Merge the training and the test dataset into one dataset
2) Extract only the measurements on the mean and standard deviation for each measurement
3) Uses descriptive activity names to name the activities in the dataset
4) Appropriately label the dataset with descriptive variable names
5) From the dataset in step 4, create a second, independent tidy dataset 

Tidy data set
-------------------
### Variables
The tidy dataset contains 68 columns
* Column 1 : __Subject__, range 1-30
* Column 2 : __Activity__: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* Columns 3-68: average of the variables 
timeBodyAccelerometer.mean.X, timeBodyAccelerometer.mean.Y, timeBodyAccelerometer.mean.Z, timeBodyAccelerometer.std.X, timeBodyAccelerometer.std.Y, timeBodyAccelerometer.std.Z, timeGravityAccelerometer.mean.X, timeGravityAccelerometer.mean.Y, timeGravityAccelerometer.mean.Z, timeGravityAccelerometer.std.X, timeGravityAccelerometer.std.Y, timeGravityAccelerometer.std.Z, timeBodyAccelerometerJerk.mean.X, timeBodyAccelerometerJerk.mean.Y, timeBodyAccelerometerJerk.mean.Z, timeBodyAccelerometerJerk.std.X, timeBodyAccelerometerJerk.std.Y, timeBodyAccelerometerJerk.std.Z, timeBodyGyroscope.mean.X, timeBodyGyroscope.mean.Y, timeBodyGyroscope.mean.Z, timeBodyGyroscope.std.X, timeBodyGyroscope.std.Y, timeBodyGyroscope.std.Z, timeBodyGyroscopeJerk.mean.X, timeBodyGyroscopeJerk.mean.Y, timeBodyGyroscopeJerk.mean.Z, timeBodyGyroscopeJerk.std.X, timeBodyGyroscopeJerk.std.Y, timeBodyGyroscopeJerk.std.Z, timeBodyAccelerometerMagnitude.mean, timeBodyAccelerometerMagnitude.std, timeGravityAccelerometerMagnitude.mean, timeGravityAccelerometerMagnitude.std, timeBodyAccelerometerJerkMagnitude.mean, timeBodyAccelerometerJerkMagnitude.std, timeBodyGyroscopeMagnitude.mean, timeBodyGyroscopeMagnitude.std, timeBodyGyroscopeJerkMagnitude.mean, timeBodyGyroscopeJerkMagnitude.std, frequencyBodyAccelerometer.mean.X, frequencyBodyAccelerometer.mean.Y, frequencyBodyAccelerometer.mean.Z, frequencyBodyAccelerometer.std.X, frequencyBodyAccelerometer.std.Y, frequencyBodyAccelerometer.std.Z, frequencyBodyAccelerometerJerk.mean.X, frequencyBodyAccelerometerJerk.mean.Y, frequencyBodyAccelerometerJerk.mean.Z, frequencyBodyAccelerometerJerk.std.X, frequencyBodyAccelerometerJerk.std.Y, frequencyBodyAccelerometerJerk.std.Z, frequencyBodyGyroscope.mean.X, frequencyBodyGyroscope.mean.Y, frequencyBodyGyroscope.mean.Z, frequencyBodyGyroscope.std.X, frequencyBodyGyroscope.std.Y, frequencyBodyGyroscope.std.Z, frequencyBodyAccelerometerMagnitude.mean, frequencyBodyAccelerometerMagnitude.std, frequencyBodyAccelerometerJerkMagnitude.mean, frequencyBodyAccelerometerJerkMagnitude.std, frequencyBodyGyroscopeMagnitude.mean, frequencyBodyGyroscopeMagnitude.std, frequencyBodyGyroscopeJerkMagnitude.mean, frequencyBodyGyroscopeJerkMagnitude.std

* __.mean/std__: mean or standard deviation of the measurement
* __.X/Y/Z__: one direction of a 3-axial signal
* __.mean__: global mean value  

The final dataset is written to the file 'sensordata_avg_by_subject.txt'.
