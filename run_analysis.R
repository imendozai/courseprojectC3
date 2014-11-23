
install.packages("dplyr")
library("dplyr")
library("base")
library("stringr")

# # # # # # # # # # # # # # # # # # # # # # 
# Reading all datasets in R
# # # # # # # # # # # # # # # # # # # # # # 

features <- read.table("./features.txt", header=FALSE)
dim(features)
head(features)

# # # # # 
activities <- read.table("./activity_labels.txt", header=FALSE)
dim(activities)
head(activities)

# # # # # 
x.train <- read.table("./train/X_train.txt", header=FALSE)
dim(x.train)

# # # # # 
x.test <- read.table("./test/X_test.txt", header=FALSE)
dim(x.test)

# # # # # 
subject.train <- read.table("./train/subject_train.txt", header=FALSE)
dim(subject.train)

# # # # # 
subject.test <- read.table("./test/subject_test.txt", header=FALSE)
dim(subject.test)

# # # # # 
y.train <- read.table("./train/y_train.txt", header=FALSE)
dim(y.train)

# # # # # 
y.test <- read.table("./test/Y_test.txt", header=FALSE)
dim(y.test)

# # # # # # # # # # # # # # # # # # # # # # 
# Q1. Merges the training and the test 
#     sets to create one data set.
# # # # # # # # # # # # # # # # # # # # # # 

# Assigning labels to Train Data
colnames(x.train) <- features[,2]
head(x.train)

colnames(subject.train) <- c("subject")
head(subject.train)

colnames(y.train) <- c("activity")
head(y.train)

# Assigning labels to Test Data
colnames(x.test) <- features[,2]
head(x.test)

colnames(subject.test) <- c("subject")
head(subject.test)

colnames(y.test) <- c("activity")
head(y.test)

# # # # # # # # # # # # # # # # # # # # # # 

# Merging Train Data (X.Train + Subject + Y.Train)
train.x.subj <- cbind(x.train, subject.train)
dim(train.x.subj)

train.data <- cbind(train.x.subj, y.train)
dim(train.data)
head(train.data)

# Merging Test Data (X.Test + Subject + Y.Test)
test.x.subj <- cbind(x.test, subject.test)
dim(test.x.subj)

test.data <- cbind(test.x.subj, y.test)
dim(test.data)
head(test.data)

# # # # # # # # # # # # # # # # # # # # # # 

# Adding Train + Test Data
data <- rbind(train.data, test.data)
tbl.data <- tbl_df(data)
dim(data)
head(data)


# # # # # # # # # # # # # # # # # # # # # # 
# Q2. Extracts only the measurements on the 
#     mean and standard deviation for each 
#     measurement.
# # # # # # # # # # # # # # # # # # # # # # 

# Selecting only column names which contains "Mean", "std" 
data.select <- data[grep("mean|std|subject|activity",names(data))]
str(data.select)

# # # # # # # # # # # # # # # # # # # # # # 
# Q3. Uses descriptive activity names to 
#     name the activities in the data set
# # # # # # # # # # # # # # # # # # # # # # 

colnames(activities) <- c("id_activity", "label_activity")
activities

data.complete <- merge(data.select,activities, by.x="activity", by.y="id_activity", all=TRUE)
head(data.complete)

# Validating activity labels with counts
table(data.complete["label_activity"])
table(data.complete["activity"])

# # # # # # # # # # # # # # # # # # # # # # 
# Q4. Appropriately labels the data set 
#     with descriptive variable names. 
# # # # # # # # # # # # # # # # # # # # # # 

labels.data <- c(names(data.complete))
newlabels.data <- str_replace_all(labels.data,"[()]", "")

colnames(data.complete) <- newlabels.data
head(data.complete)

# # # # # # # # # # # # # # # # # # # # # # 
# Q5. From the data set in step 4, creates 
#     a second, independent tidy data set 
#     with the average of each variable for 
#     each activity and each subject.
# # # # # # # # # # # # # # # # # # # # # # 

tbl.data <- tbl_df(data.complete)
by_activ_sub <- group_by(tbl.data,activity, label_activity, subject)
new.data <- summarise_each(by_activ_sub, funs(mean))
head(new.data)

write.table(new.data, "./final/tidydata_step5.txt", sep="\t", row.name=FALSE)


