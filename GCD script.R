# Step 1. Merge training and test data sets: Create X dataset

library(data.table)
x_training <- read.table("train/X_train.txt")
head(x_training)
x_testing <- read.table("test/X_test.txt")
head(x_testing)
x_dataset <- rbind(x_training, x_testing)

# Step 1. Merge training and test data sets: Create Y dataset

y_training <- read.table("train/y_train.txt")
head(y_training)
y_testing <- read.table("test/y_test.txt")
head(y_testing)
y_dataset <- rbind(y_training, y_testing)

# Step 1. Merge training and test data sets: Create Subjects dataset

subject_training <- read.table("train/subject_train.txt")
subject_testing <- read.table("test/subject_test.txt")
subject_dataset <- rbind(subject_training, subject_testing)

# Step 2. Extract only means and std. deviations for each measurement

features_dataset  <- read.table("features.txt")
mean_stddev <- grep("-(mean|std)\\(\\)", features_dataset[, 2])
x_dataset <- x_data[, mean_stddev]
names(x_dataset)  <- features_dataset[mean_stddev, 2]

# Step 3. Assign descriptive activity names

activity_dataset  <- read.table("activity_labels.txt")
y_dataset[,1]  <- activities_dataset[y_dataset[, 1], 2]
names(y_dataset)  <- "activity"

# Step 4. Assign descriptive variable names

names(subject_dataset) <- "subject"
complete_data  <- cbind(x_dataset, y_dataset, subject_dataset)

# Step 5. Create an independent tidy dataset with average of each variable for each activity and each subject

library(plyr)
tidy  <- ddply(complete_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(tidy, "tidy_data.txt", row.name= FALSE)

