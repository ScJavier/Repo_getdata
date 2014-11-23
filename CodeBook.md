## Codebook for tidy data set

### Data source

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[Website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

### Description: Data sets

The following description comes from the original source of the data:

** The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. **

### Description: Analysis

For this analysis we use the statistical package R version 3.1.2 (2014-10-31) in a platform i386-w64-mingw32/i386 (32-bit).

Data sets *X_train.txt, y_train.train, subject_train.txt, X_test.txt, y_test.txt, subject_test.txt* were read with **read.table** instruction and merged with **cbind** and **rbind**.
Labels for variables comes from **features.txt**.

First we subseted the data selecting only the variables with "-mean ()" or "-std ()", as the instructions said. To do this we use **grep** function.

Finally we summarise the data set taking the average of each variable for each subject and for each activity.

### Additional information

There aare no missing values.
Observations were standardized over[-1,1].
