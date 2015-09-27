### 1 Merges the training and the test sets to create one data set.

X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test )


### 2 Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")


## features containing mean and standard deviations
## features_ms <- features[grepl("-std()",features$V2) | grepl("-mean()",features$V2), ]
features_ms <- grep("-mean|std)\\(\\)", features[ ,2])

X_data <- X_data[ , features_ms]

names(X_data) <- features[features_ms, 2]

### 3 Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt") 

y_data[ , 1] <- activities[y_data[ , 1], 2]
names(y_data) <- "activity"

### 4. Appropriately labels the data set with descriptive variable names. 

names(subject_data) <- "subject"
mydata <- cbind(X_data, y_data, subject_data)

### 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
averages <- ddply(mydata, .(subject,activity), function(x) colMeans(x[ , 1:46]))
write.table(averages, "averages.txt", row.names = FALSE)
