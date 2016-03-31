
## 1. Set working directory
setwd("~/Eszter C/Spotfire Edu/Data science/UCI HAR Dataset")
#2.Read the relevant tables from test and train, assuming all files are available in the working directory and load them in R. View the tables.
Datatrain <- read.table("./train/X_train.txt", header=FALSE)
dim(Datatrain)

Trainlabel <- read.table("./train/y_train.txt")
dim(Trainlabel)
Trainsubject <- read.table("./train/subject_train.txt")
dim(Trainsubject)


Datatest <- read.table("./test/X_test.txt", header=FALSE)
dim(Datatest)
Testlabel <- read.table("./test/y_test.txt")
dim(Testlabel)
Testsubject <- read.table("./test/subject_test.txt")
dim(Testsubject)

##3.Join the test-train table subject and activity files
Temp_train <- cbind(Trainlabel,Trainsubject)
Temp_test<- cbind(Testlabel,Testsubject)

#4. Add names
names(Temp_test)<-c("subjectID","activity")
names(Temp_train)<-c("subjectID","activity")

#5. Extracts only the measurements on the mean and standard deviation, Create the name column: read the feature names as character and add the manes to the train and test tables. 
features<-as.character(read.table("./features.txt")[,2])
head(features)
features_2 <- grep("-mean\\(\\)|-std\\(\\)", features)

features<-make.names(features,unique=FALSE)
names(Datatest)<-features
names(Datatrain)<-features

names(Datatest)
names(Datatrain)
dim(Datatest)
dim(Datatrain)

#6. merge the tables. First the subject and activity tables than merge the x_test and x_train tables. Filter only for the selected columns from features_2.
#7. Create tidy data set.
merge_Temp<-rbind(Temp_train, Temp_test)
merge_Data<-rbind(Datatrain, Datatest)
merge_Data_clean<-merge_Data[,features_2==1]

datatidy <- cbind(merge_Temp, merge_Data_clean)

dim(datatidy)

#8. Clean up names. 
names(datatidy)<-gsub("\\.","",names(datatidy))
names(datatidy)<-gsub("mean","Mean",names(datatidy))
names(datatidy)<-gsub("std","Std",names(datatidy))


write.table(datatidy, "merged_tidy_data.txt")

#9. Create a new dataset and calculate  average of each variable for each activity and each subject.
library(data.table)
data2 <- data.table(datatidy)
mean_data<-data2[, sapply(.SD, function(x) list(mean=mean(x))), by=list(subjectID,activity)]

write.table(mean_data, "mean_data.txt")
