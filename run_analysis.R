getwd()
setwd("~/R programing/Subsetting and Sorting/")

###### downloading the UCI HAR Dataset zipped file #################

urlFile<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlFile, dest="./data/smartphone.zip", mode="wb") 

######## unzipping the downloaded zipped file #####################################
unzip("./data/smartphone.zip", exdir = "./data")

######## setting a new working Directory ##########################
setwd("~/R programing/Subsetting and Sorting/data/UCI HAR Dataset")

##### Loading the subject train data into a variable ######################
subject_train <- read.table("./train/subject_train.txt",header = FALSE, col.names = c("Subject"))

##### Loading the Activity lable train data into a variable ######################
y_train<- read.table("./train/Y_train.txt", header = FALSE,col.names =c("Activityid"))

##### Loading the Activity lable train data into a variable ######################
x_train<-read.table("./train/X_train.txt", header = FALSE )
###Naming the column
names(x_train)=c(1:561)


#### doing a column bind to create a complete training data set ###########################
training_data<-cbind(subject_train,y_train,x_train)

##### Loading the subject Test data into a variable ######################
subject_test <- read.table("./test/subject_test.txt",header = FALSE, col.names = c("Subject"))

##### Loading the Activity lable train data into a variable ######################
y_test<- read.table("./test/Y_test.txt", header = FALSE,col.names =c("Activityid"))

##### Loading the Activity lable train data into a variable ######################
x_test<-read.table("./test/X_test.txt", header = FALSE)
###Naming the column
names(x_test)=c(1:561)

#### doing a column bind to create a complete testing data set ###########################
testing_data<-cbind(subject_test,y_test,x_test)

##### combing training and test data into single data set ##################################
entire_data_set<-rbind(training_data,testing_data)

###### loading the features data ######
feature<- read.table("features.txt",header = FALSE , col.names = c("Featureid","Feature"))

###### Loading Activity labels ########
activity_lables <-read.table("activity_labels.txt", header = FALSE, col.names = c("Activityid","Activityname"))

##### identifying the mean and std features from the feature list and loading it into a variable ######
library(stringr)
library(dplyr)

columnFilter<-feature%>%filter(str_detect(Feature,"mean()") | str_detect(Feature,"std()"))%>% select(Featureid)
######Converting the data frame to vection to be used in selection of column
columnFilter <-as.vector(columnFilter[,1])
######naming the vector from the features datafram corresponding to the selected feature id
names(columnFilter)<-as.vector(feature[columnFilter,2])

###### Added value 2 to the vector list since the first two column will be Subject and Activity
columnFilter<-columnFilter + 2


####### creating a new dataset only with  mean and std column along with subject and activity

new_data_set <-entire_data_set%>%select(1,2,columnFilter)

######  Joining the new data set to activity lable

new_data_set <- merge(x=new_data_set, y=activity_lables , by =  "Activityid")

###### selecting the column such in order by replacing Activityid with acticity_lable

new_data_set<-new_data_set%>%select(Subject,Activityname,c(3:81))

###### Tidying the new data set
##1) conveting all the variable name to lower case
##2) Removing all the spaces, "-" & "() from the variable name
names(new_data_set)<-gsub("-","",gsub("[()]","",gsub(" ","",names(new_data_set))))%>%tolower



###### calculating the averge of all the features with mean and std based on activity and storing it in a variable### 

Average_all_mean_std<-new_data_set%>%group_by(subject,activityname)%>%summarize_each(funs(mean))

###### Writing the resulting dataset into a file.
write.table(Average_all_mean_std, file ="./tidy_dataset_subject_activity_average.txt",row.names = FALSE )














