##Function of R script
#Data Input / Manipulation
Reads all relevant data (stored in ./, ./test, and ./train) into tables 
Reconciles variable names, subject numbers, and activity types
Merges data sets into a single list of observations

#Data Filtering / Reshaping
Removes all variables not containing a mean or standard deviation observable
Uses melt and dcast to generate means of observables stratified by subject and activity type

#Table Writing
Writes tidy data to tidydata.txt with the variables following the convention of the code book below

##Code Book

#The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
#Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
#Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
#These signals were used to estimate variables of the feature vector for each pattern:  
#'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

#The set of variables that were estimated from these signals are mean value and standard deviation
#Upon estimation of variables, the following classifications were appended to each observation:
subject: number of unique subject providing observations
activitycode: type of activity, described in plain language, conducted during observation

#For each subject and activity type, the mean and standard deviation values for each observable were averaged and reported as follows: 
mean(): Mean of mean values
std(): Mean of standard deviations 

#Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
