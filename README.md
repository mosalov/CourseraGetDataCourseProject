Coursera GetData Course Project

To reproduce the file "tidy_data.txt" you should use an attached R-script "run_analysis.R" in the following way:
1. Download the raw data from the link "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. Extract the contents of this zip-file into your working directory. At this moment you should have a folder named "UCI HAR Dataset" in your workin directory.
3. Run the R-script. After the script ends you will get a newly created file "tidy_data.txt" in your working directory.

The logic that is fullfilled by the R-script is described below:
1. Change the working directory to the "UCI HAR Dataset" subdirectory.
2. Extract data from files "X_test.txt", "y_test.txt" and "subject_test.txt" from the subdirectory "test".
3. Create a data frame called "test" that combines data from all these files.
3. Extract data from files "X_train.txt", "y_train.txt" and "subject_train.txt" from the subdirectory "train".
4. Create a data frame called "train" that combines data from all these files.
5. Rename the column for y-data as "Y" and the column for subject-data as "S".
6. Combine "test" and "train" data frames to the one called "data".
7. Extract features names form the file "features.txt".
8. Construct a logical vector of positions containing "mean()" or "std()".
9. Extract rows from "data" that contain means and stds and put them into a new data frame "ext_data".
10. Extract activity labels from the file "activity_labels.txt".
11. Add a new variable that is a factor of Y column values.
12. Changing numeric factor levels for character ones.
13. Assign names to columns.
14. Clear and transfor "ext_data": the column with activity label numbers is deleted, values of avtivity names are transformed from factor to characters.
15. Construct the tidy data: calculating mean on all columns except two last ones, grouped by values in two last columns.
16. Write the tidy data to a file "tidy_data.txt" in the working directory.
