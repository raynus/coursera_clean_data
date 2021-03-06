#Train data
feature_x_name<-read.table("features.txt")
train_sub<-read.table("./train/subject_train.txt")
names(train_sub)<-"subject"
train_x<-read.table("./train/x_train.txt")
train_y<-read.table("./train/y_train.txt")
names(train_y)<-"activity"

names(train_x)<-feature_x_name$V2
train_data<-cbind(train_sub,train_x,train_y)


#Test Data
test_sub<-read.table("./test/subject_test.txt")
names(test_sub)<-"subject"
test_x<-read.table("./test/x_test.txt")
test_y<-read.table("./test/y_test.txt")
names(test_y)<-"activity"
names(test_x)<-feature_x_name$V2


#Merge data together
test_data<-cbind(test_sub,test_x,test_y)

##Finish preparing data
total_data<-rbind(train_data,test_data)
total_data$activity<-as.factor(total_data$activity)
levels(total_data$activity)<-c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
col_sd_mean<-c(grep("std()",names(total_data)),grep("mean()",names(total_data)))

#This is a subset for sd and meanAt this 
sub_col_sd_mean<-total_data[,col_sd_mean]


#Last step is to create a mean for each subject and activity
library(reshape2)
library(reshape)
tidy_data<-melt(total_data,id.vars = c("subject","activity"))
tidy_data<-cast(tidy_data,subject+activity~variable,mean)
write.table(tidy_data,"tidy_data.txt",row.name=FALSE)


