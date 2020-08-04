#importing the libraries
library(dplyr)
#dowloading the projects
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip','data.zip')
#unzip the datac()c
unzip('data.zip')
#point 1
#read all of the tables
activities<-read.table('UCI HAR Dataset/activity_labels.txt',sep = ' ',col.names = c("count","activity"))
fectures<-read.table('UCI HAR Dataset/features.txt',sep = ' ',col.names = c("count","feature"))
subject_test<-read.table('UCI HAR Dataset/test/subject_test.txt',col.names = 'subject')
X_test<-read.table('UCI HAR Dataset/test/X_test.txt')
colnames(X_test)<-(fectures$feature)
y_test<-read.table('UCI HAR Dataset/test/y_test.txt',col.names = 'sample')
subject_train<-read.table('UCI HAR Dataset/train/subject_train.txt',col.names = 'subject')
X_train<-read.table('UCI HAR Dataset/train/X_train.txt')
colnames(X_train)<-(fectures$feature)
y_train<-read.table('UCI HAR Dataset/train/y_train.txt',col.names = 'sample')
#bind the data
X <- rbind(X_train, X_test)
Y <- rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
total_data<-cbind(X,Y,subject)
#point 2
#Extracts only mean and SD
tidy<-select(total_data,sample,subject,grep('mean',names(total_data)), grep('std',names(total_data)))
#point 3
#replace with the name of the activity
tidy$sample <- activities[tidy$sample, 2]
#point 4
# Change labels of the dataset
names(tidy)[2] = "Activity"
names(tidy)<-gsub("Acc", "Accelerometer", names(tidy))
names(tidy)<-gsub("Gyro", "Gyroscope", names(tidy))
names(tidy)<-gsub("BodyBody", "Body", names(tidy))
names(tidy)<-gsub("Mag", "Magnitude", names(tidy))
names(tidy)<-gsub("^t", "Time", names(tidy))
names(tidy)<-gsub("^f", "Frequency", names(tidy))
names(tidy)<-gsub("tBody", "TimeBody", names(tidy))
names(tidy)<-gsub("-mean()", "Mean", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-std()", "STD", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-freq()", "Frequency", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("angle", "Angle", names(tidy))
names(tidy)<-gsub("gravity", "Gravity", names(tidy))
#point 5
#make the mean to all of the table un tidy
final<-group_by(tidy,sample,Activity)
final<-summarise_all(final,mean)
write.table(final, "Final.txt", row.name=FALSE)

