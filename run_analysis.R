## read the relevant tables from test and train
Datatrain <- read.table("./data/train/X_train.txt")
dim(Datatrain)
head(Datatrain)

Trainlabel <- read.table("./data/train/y_train.txt")
dim(Trainlabel)
Trainsubject <- read.table("./data/train/subject_train.txt")
dim(Trainsubject)

Datatest <- read.table("./data/test/X_test.txt")



Testlabel <- read.table("./data/test/y_test.txt")
dim(Testlabel)
Testsubject <- read.table("./data/test/subject_test.txt")
dim(Testsubject)

##join the test-train table combinations
Datajoin <- rbind(Datatrain, Datatest)
Labeljoin<- rbind(Trainlabel,Testlabel)
Subjectjoin <- rbind(Trainsubject,Testsubject)

# load lookup information
features <- read.table("./data/features.txt", col.names=c("featureId", "featureLabel"))
activities <- read.table("./data/activity_labels.txt", col.names=c("activityId", "activityLabel"))
activityLabel <- gsub("_", "", as.character(activities$activityLabel))
incFeatures <- grep("-mean\\(\\)|-std\\(\\)", features$featureLabel)
## Extracts only the measurements on the mean and standard deviation for each measurement.

##rename loaded table columns
names(Subjectjoin) <- "subjectId"
names(Labeljoin)<- "activityId"
names(Datajoin) <- gsub("\\(|\\)", "", features$featureLabel[incFeatures])
#add activity desc
activity <- merge(Labeljoin, activities, by="activityId")$activityLabel
# merge data frames of different columns to form one data table
datatidy <- cbind(Subjectjoin, Datajoin, activity)

dim(datatidy)

write.table(datatidy, "merged_tidy_data.txt")