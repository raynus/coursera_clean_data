# coursera_clean_data

1. I started by reading all three file, "subject", "x", and "y" for both test and training data set.
2. assign a proper names to it, "subject" to subject file and "activity" to y file. while those "x" file will be named with "features.txt"
3. After we've got a proper name, we will bind i together using cbind.
4. Repeat step 1-3 for test data
5. Lets create the final dataset by using rbind to merge test and training data together, final data set was nanmes "total_data"
6. Next step is to recode activity variable from a number in to something that has its meaning. Therefore, activity was recoded to "walking","walking_upstairs","walking_downstairs","sitting","standing","laying" as stated in activity_labels.txt file.
7. At this stage, we can create a subset data frame that extract standard deviation (std()) and average (mean()) column from total_data using slicing and "grep" command. The output was stored in "sub_col_sd_mean" variable.
8. The two last assignment is to create a "tidy" database, average value for each parameter for each subject and activity.
9. We load "reshape2" library and use aggregate function for this, results were saved to each_subk and each_activity variable.
10. Both variable were saved to "each_subj.csv" and "each_activity.csv"
