library(dplyr)

features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt", col.names = c("id", "activity"))

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt", col.names = "activity")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")


x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt", col.names = "activity")
subject_test <- read.table("test/subject_test.txt", col.names = "subject")


x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)


colnames(x_data) <- features[,2]
merged_data <- cbind(subject_data, y_data, x_data)


mean_std <- grep("mean\\(\\)|std\\(\\)", features[,2])
data_mean_std <- merged_data[, c(1,2, mean_std+2)]


data_mean_std$activity <- factor(data_mean_std$activity,
                                 levels = activity_labels$id,
                                 labels = activity_labels$activity)


names(data_mean_std) <- gsub("\\()", "", names(data_mean_std))
names(data_mean_std) <- gsub("-", "_", names(data_mean_std))
names(data_mean_std) <- gsub("^t", "Time_", names(data_mean_std))
names(data_mean_std) <- gsub("^f", "Freq_", names(data_mean_std))
names(data_mean_std) <- gsub("Acc", "Accelerometer", names(data_mean_std))
names(data_mean_std) <- gsub("Gyro", "Gyroscope", names(data_mean_std))
names(data_mean_std) <- gsub("Mag", "Magnitude", names(data_mean_std))
names(data_mean_std) <- gsub("BodyBody", "Body", names(data_mean_std))

tidy_data <- data_mean_std %>%
  group_by(subject, activity) %>%
  summarise_all(mean)


write.table(tidy_data, "tidy_data.txt", row.name=FALSE)

cat("Tidy dataset created and saved as tidy_data.txt\n")
