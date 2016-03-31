# Getting-and-Cleaning-Data-Assignment

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Good luck!


The script reads first the relevant tables from test and train folders. It reads the X (values), the Y (labels) and the subject tables. 

Step 2 is to join the Train and test datasets, so the result is 3 different tables.

After that the lookup tables are also loaded. 
Feature table gets column names featureID and featureLabel.
Activity table gets column names activityID and activityLabel. 
- Activity label field should be cleaned up via removing the "_".
- Feature label also has to be cleaned up to get back mean and std.  

The original 3 tables (values, labels and subject) also nees new, cleaned up columns, similary as in the lookup tables. Note that this step is repeated, it could have been done together.

Now merge the datasets into one big table including the activities from the lookup table.

Writte the table into a txt.
