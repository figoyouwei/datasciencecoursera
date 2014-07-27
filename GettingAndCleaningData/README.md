14/07/27: description of run_analysis.R 
----------

1. Merges the training and the test sets to create one data set.
> As the TA replied on the forum (see screenshot) that only columns that have mean or std in the feature name need to be extracted later, I didn't see the point of loading all the Inertial Signals data from both test and train directories. Therefore, I constructed the FIRST data frame with the first col being "SubjectID", the second col being "ActivityID" and the rest 561 cols being the 561 feature data. The data.frame is named as variable "dataSET" and written into a uploaded file named "dataset1_extracted.csv".

2. Uses descriptive activity names to name the activities in the data set.
> DONE

3. Appropriately labels the data set with descriptive variable names.
> DONE as described in 1

4. Extracts only the measurements on the mean and standard deviation for each measurement.
> DONE by applying the grep() function to dataSET.  

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
> This is achieved by maintaining the original colnames as same as dataSET, and performing the tapply mean to each feature variable given one SubjectID and activityID. 



