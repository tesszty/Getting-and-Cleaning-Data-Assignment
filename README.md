# Getting-and-Cleaning-Data-Assignment

The following steps were made to create a tidy data set. For more infromation please revied the Codebook. 

1. Read the relevant tables from test and train, assuming all files are available in the working directory and load them. View the tables.
2. Join the test-train table subject and activity files
3. Add names "subjectID" and "activity"
4. Extracts only the measurements on the mean and standard deviation, Create the name column: read the feature names as character and add the manes to the train and test tables. 
5. Merge the tables. First the subject and activity tables than merge the x_test and x_train tables. Filter only for the selected columns from step 4.
6. Create tidy data set. Clean up the names. Write the table to txt.
7. Create a new dataset and calculate  average of each variable for each activity and each subject.
