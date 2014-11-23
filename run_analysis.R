rm(list=ls())

# Seting working directory

wd_url<-"D:/ScJavier/Coursera/Data Sciencie Specialization/03_Getting_and_Cleaning_Data/Course_Project/Repo_getdata"
setwd(wd_url)

# Read the data
data_train<-data.frame(read.table("./UCI HAR Dataset/train/X_train.txt",header=F))
data_train<-cbind(read.table("./UCI HAR Dataset/train/y_train.txt",header=F),data_train)
data_train<-cbind(read.table("./UCI HAR Dataset/train/subject_train.txt",header=F),data_train)

data_test<-data.frame(read.table("./UCI HAR Dataset/test/X_test.txt",header=F))
data_test<-cbind(read.table("./UCI HAR Dataset/test/y_test.txt",header=F),data_test)
data_test<-cbind(read.table("./UCI HAR Dataset/test/subject_test.txt",header=F),data_test)

# Merge train and test data sets
data<-rbind(data_train,data_test)

# Subsetting only the mean ans std measurements
features<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=F,header=F)[,2]
names(data)<-c("Subject","Activity",features)
data_sub<-data[,c(1,2,2+grep("-(mean|std)\\(\\)",features))]

# Rename activities
alabels<-read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=F,header=F)[,2]
for (i in 1:6)
{
  data_sub$Activity[data_sub$Activity==i]<-alabels[i]
}

# Rename varibles on data set
colnames(data_sub)<-sub("-mean\\(\\)","-Mean",colnames(data_sub))
colnames(data_sub)<-sub("-std\\(\\)","-StD",colnames(data_sub))

# Get the average of each variable for each subject and each activity
require(dplyr)
data_sub<-tbl_df(data_sub)
tidy_data<-group_by(data_sub,Subject,Activity) %>%
                      summarise_each(funs(mean))

# Write the tidy data set for submission
write.table(tidy_data,"tidy_data.txt",sep=",")
