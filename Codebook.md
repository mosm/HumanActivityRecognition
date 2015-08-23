## Codebook

### Introduction
This Codebook describes:

1. The variable selection from the original data source
2. A description per variable in the delivered data file 'assignment1.txt'

### Variable Selection
Where the original data set used contained 561 attributes, a subset has been selected in the data file delivered by the scipt 'run_Analysis.R'. As requested , these are the attributes relating to Mean and StandardDeviation attributes.
The supplied file 'features_info.txt' indicates:
- variables ending in mean() indicate a mean value
- variables ending in std() indicate a standard deviation
Data for these variables has therefore been selected from the wider set of variables available. 
Multiple mean and standard deviation numbers are available per person/activity combination. These numbers have been averaged. In the supplied file, therefore, a supplied mean has been calculated by averaging a number of means per activity/person combination. 

### Variables

The data set has 68 variables. Two variables describe activity and subject. The remaining 66 variables are averages means and standard deviations of features measured. 

All features represent averages of mean or standard deviation per feature. All measurements have been normalized and bounded in the [-1,1] range.

### Activity / Subject variables

activity_description
- One of six activities that have been measured 
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

person
- Number between 1 and 30, representing one of 30 subjects. 

### Features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAccelelarationXYZ and TimeGyroscopeXYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAccelerationXYZ and TimeGravityAccelerationXYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccelerationJerkXYZ and TimeBodyGyroscopeJerkXYZ). Also the magnitude of these 3-dimensional signals were calculated using the Euclidean norm (TimeBodyAccelerationMagnitude and TimeGravityAccelerationMagnitude, TimeBodyGyroscopeJerkMagnitude, TimeBodyGyroscopeMagnitude and TimeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to these signals producting FrequencyBodyAccelerationXYZ, FrequencyBodyAccelerationJerkXYZ, FrequencyBodyGyrscopeXYZ, FrequencyBodyAccelerationJerkMagnitude, FrequencyBodyGyroscopeMagnitude, FrequencyBodyGyroscopeJerkMagnitude). 

These signals were used to estimate variables of the feature vector for each pattern. For 3-axial signals in the X, Y and Z directions three variables have been included in the data set, ending in respectively 'X-axis', 'Y-axis' and 'Z-axis'. 

For all variables that were estimated the Mean and StandardDeviation have been included in the data set. 


All features represent averages of mean or standard deviation per feature. All measurements have been normalized and bounded in the [-1,1] range.

- Features included in the data set:
TimeBodyAccelerationMeanX-Axis
TimeBodyAccelerationMeanY-Axis
TimeBodyAccelerationMeanZ-Axis
TimeBodyAccelerationStandardDeviationX-Axis
TimeBodyAccelerationStandardDeviationY-Axis
TimeBodyAccelerationStandardDeviationZ-Axis
TimeGravityAccelerationMeanX-Axis
TimeGravityAccelerationMeanY-Axis
TimeGravityAccelerationMeanZ-Axis
TimeGravityAccelerationStandardDeviationX-Axis
TimeGravityAccelerationStandardDeviationY-Axis
TimeGravityAccelerationStandardDeviationZ-Axis
TimeBodyAccelerationJerkMeanX-Axis
TimeBodyAccelerationJerkMeanY-Axis
TimeBodyAccelerationJerkMeanZ-Axis
TimeBodyAccelerationJerkStandardDeviationX-Axis
TimeBodyAccelerationJerkStandardDeviationY-Axis
TimeBodyAccelerationJerkStandardDeviationZ-Axis
TimeBodyGyroscopeMeanX-Axis TimeBodyGyroscopeMeanY-Axis
TimeBodyGyroscopeMeanZ-Axis TimeBodyGyroscopeStandardDeviationX-Axis
TimeBodyGyroscopeStandardDeviationY-Axis
TimeBodyGyroscopeStandardDeviationZ-Axis
TimeBodyGyroscopeJerkMeanX-Axis
TimeBodyGyroscopeJerkMeanY-Axis
TimeBodyGyroscopeJerkMeanZ-Axis
TimeBodyGyroscopeJerkStandardDeviationX-Axis
TimeBodyGyroscopeJerkStandardDeviationY-Axis
TimeBodyGyroscopeJerkStandardDeviationZ-Axis
TimeBodyAccelerationMagnitudeMean
TimeBodyAccelerationMagnitudeStandardDeviation
TimeGravityAccelerationMagnitudeMean
TimeGravityAccelerationMagnitudeStandardDeviation
TimeBodyAccelerationJerkMagnitudeMean
TimeBodyAccelerationJerkMagnitudeStandardDeviation
TimeBodyGyroscopeMagnitudeMean
TimeBodyGyroscopeMagnitudeStandardDeviation
TimeBodyGyroscopeJerkMagnitudeMean
TimeBodyGyroscopeJerkMagnitudeStandardDeviation
FrequencyBodyAccelerationMeanX-Axis
FrequencyBodyAccelerationMeanY-Axis
FrequencyBodyAccelerationMeanZ-Axis
FrequencyBodyAccelerationStandardDeviationX-Axis
FrequencyBodyAccelerationStandardDeviationY-Axis
FrequencyBodyAccelerationStandardDeviationZ-Axis
FrequencyBodyAccelerationJerkMeanX-Axis
FrequencyBodyAccelerationJerkMeanY-Axis
FrequencyBodyAccelerationJerkMeanZ-Axis
FrequencyBodyAccelerationJerkStandardDeviationX-Axis
FrequencyBodyAccelerationJerkStandardDeviationY-Axis
FrequencyBodyAccelerationJerkStandardDeviationZ-Axis
FrequencyBodyGyroscopeMeanX-Axis
FrequencyBodyGyroscopeMeanY-Axis
FrequencyBodyGyroscopeMeanZ-Axis
FrequencyBodyGyroscopeStandardDeviationX-Axis
FrequencyBodyGyroscopeStandardDeviationY-Axis
FrequencyBodyGyroscopeStandardDeviationZ-Axis
FrequencyBodyAccelerationMagnitudeMean
FrequencyBodyAccelerationMagnitudeStandardDeviation
FrequencyBodyBodyAccelerationJerkMagnitudeMean
FrequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation FrequencyBodyBodyGyroscopeMagnitudeMean FrequencyBodyBodyGyroscopeMagnitudeStandardDeviation FrequencyBodyBodyGyroscopeJerkMagnitudeMean
FrequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation
