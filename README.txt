List of sets preformed to download, analysis and created the tidy data set.

Downloading the file:
1) Stored the file link in a variable.
2) Downloaded the zipped file from the location stored in the variable.
3) upzipped the folder to the working directory.

Loading the training data set:
1) Loaded the sunject_train.txt into a variable called sunject_train and named the field as subject.
2) Loaded the Y_train.txt into a variable called y_train and named the field as Activityid.
3) Loaded the X_train.txt into a vatiable called x_train.
4) Named the variable x_train with vector c(1:561)
5) Combined all the three variable created above by column to for a new data set called training_data

Loading the test data set:
1) Loaded the sunject_test.txt into a variable called sunject_test and named the field as subject.
2) Loaded the Y_test.txt into a variable called y_test and named the field as Activityid.
3) Loaded the X_test.txt into a vatiable called x_test.
4) Named the variable x_test with vector c(1:561)
5) Combined all the three variable created above by column to for a new data set called testing_data

Merging the training and test data:
1) Combined the training and testing dataset created above by row to form a new data set called entire_data_set

Loading and feature and acticity_lable data:
1) Loaded the feature.txt file into a variable called feature and named the column as Featureid,Feature.
2) Loaded the acticity_lables.txt file into a variable called acticity_lables and named the column as Activityid,Activityname

Installed dplyr and stringr packages:

Creating the new dataset with all column that contains mean and standard deviation in their Feature:
1) Identified the Feature which contained the work "mean" and "std" from the feature variable and stored the result in columnFilter.
2) selected only the first column of columnFilter which is the Featureid and stored it as vector again in columnFilter variable.
3) Named the columnFilter variable from feature variable using Feature field.
4) Added value 2 to the vector columnFilter as starting two column in teh entire_data_set is subject and Activityid
5) Selected subject,Activityid,all the column with mean and stg using columnFilter vector and stored it in a variable new_data_set.

Converting the Activityid into its corresponding acticity_lables:
1) merger the new_data_set with acticity_lables dataset using Activityid and stored it in the same variable new_data_set.
2) Selected the subject,acticity_lables followed by the reaming column and stored it again in the same variable new_data_set.

Converting the new data set to a tidy data set:
1) Renamed the new_data_set variable by making the below changes.
   a) Removed the "-" from the column name.
   b) Removed the "()" from the column name.
   c) Removed all the spaces from the column name.
   d) Converted the column name into lower case.

Grouping and calculating the average:
1) grouped the new_data_set by subject and acticity_lables
2) Calculated the average of each value by using summarize_each function on grouped variable
















