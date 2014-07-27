rm(list=ls())
cat("\014")

# ----- 1. Merges the training and the test sets to create one data set.
# load datasets from root/ directory 
dir_root <- "/Users/youweizheng/Google Drive/githubrepo/datasciencecoursera/GettingAndCleaningData/CourseProject/UCI HAR Dataset/"
features <- read.table(paste(dir_root,"features.txt",sep=""))
activity_labels <- read.table(paste(dir_root,"activity_labels.txt",sep="")) 

# load datasets from test/ directory
dir_test <- "/Users/youweizheng/Google Drive/githubrepo/datasciencecoursera/GettingAndCleaningData/CourseProject/UCI HAR Dataset/test/"
features_test <- read.table(paste(dir_test,"X_test.txt",sep=""))
subject_test <- read.table(paste(dir_test,"subject_test.txt",sep=""))
activity_test <- read.table(paste(dir_test,"y_test.txt",sep=""))

# load datasets from test/Inertial Signals/ directory (shall be a better way)
# dir_test_signal <- "/Users/youweizheng/Google Drive/githubrepo/datasciencecoursera/GettingAndCleaningData/CourseProject/UCI HAR Dataset/test/Inertial Signals/"
# body_acc_x_test <- read.table(paste(dir_test_signal,"body_acc_x_test.txt",sep=""))
# body_acc_y_test <- read.table(paste(dir_test_signal,"body_acc_y_test.txt",sep=""))
# body_acc_z_test <- read.table(paste(dir_test_signal,"body_acc_z_test.txt",sep=""))
# body_gyro_x_test <- read.table(paste(dir_test_signal,"body_gyro_x_test.txt",sep=""))
# body_gyro_y_test <- read.table(paste(dir_test_signal,"body_gyro_y_test.txt",sep=""))
# body_gyro_z_test <- read.table(paste(dir_test_signal,"body_gyro_z_test.txt",sep=""))
# total_acc_x_test <- read.table(paste(dir_test_signal,"total_acc_x_test.txt",sep=""))
# total_acc_y_test <- read.table(paste(dir_test_signal,"total_acc_y_test.txt",sep=""))
# total_acc_z_test <- read.table(paste(dir_test_signal,"total_acc_z_test.txt",sep=""))
# files_signal_test <- list.files(path=dir_test_signal,pattern=".txt")
# for (i in seq(along.with=files_signal_test) ) {
#     files_signal_test[i] = paste(dir_test_signal,files_signal_test[i],sep="")
# }
# signals_test <- as.data.frame(sapply(files_signal_test, read.table))

dataset_test <- cbind(subject_test,activity_test,features_test)

# load datasets from train/ directory
dir_train <- "/Users/youweizheng/Google Drive/githubrepo/datasciencecoursera/GettingAndCleaningData/CourseProject/UCI HAR Dataset/train/"
features_train <- read.table(paste(dir_train,"X_train.txt",sep=""))
subject_train <- read.table(paste(dir_train,"subject_train.txt",sep=""))
activity_train <- read.table(paste(dir_train,"y_train.txt",sep=""))

# load datasets from train/Inertial Signals/ directory (shall be a better way)
# dir_train_signal <- "/Users/youweizheng/Google Drive/githubrepo/datasciencecoursera/GettingAndCleaningData/CourseProject/UCI HAR Dataset/train/Inertial Signals/"
# body_acc_x_train <- read.table(paste(dir_train_signal,"body_acc_x_train.txt",sep=""))
# body_acc_y_train <- read.table(paste(dir_train_signal,"body_acc_y_train.txt",sep=""))
# body_acc_z_train <- read.table(paste(dir_train_signal,"body_acc_z_train.txt",sep=""))
# body_gyro_x_train <- read.table(paste(dir_train_signal,"body_gyro_x_train.txt",sep=""))
# body_gyro_y_train <- read.table(paste(dir_train_signal,"body_gyro_y_train.txt",sep=""))
# body_gyro_z_train <- read.table(paste(dir_train_signal,"body_gyro_z_train.txt",sep=""))
# total_acc_x_train <- read.table(paste(dir_train_signal,"total_acc_x_train.txt",sep=""))
# total_acc_y_train <- read.table(paste(dir_train_signal,"total_acc_y_train.txt",sep=""))
# total_acc_z_train <- read.table(paste(dir_train_signal,"total_acc_z_train.txt",sep=""))

dataset_train <- cbind(subject_train,activity_train,features_train)

# merge test and train dataset with rbind
dataSET <- rbind(dataset_test,dataset_train)

# ----- 2. Uses descriptive activity names to name the activities in the data set.
cols <- c(2)
dataSET[,cols] <- data.frame(apply(dataSET[cols], 2, as.factor))
levels(dataSET[,cols]) <- as.character(activity_labels[,2])

# ----- 3. Appropriately labels the data set with descriptive variable names.
colnames(dataSET) <- c("SubjectID","ActivityID",as.character(features[,2]))

# ----- 4. Extracts only the measurements on the mean and standard deviation for each measurement.
cols <- c(grep('mean', colnames(dataSET), value=TRUE),
          grep('std', colnames(dataSET), value=TRUE))    
extracted <- dataSET[,c("SubjectID","ActivityID",cols)]
write.table(extracted,
            "/Users/youweizheng/Google Drive/githubrepo/datasciencecoursera/GettingAndCleaningData/CourseProject/dataset1_extracted.txt",
            sep=",",row.names=FALSE)

# ----- 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# 1. rep ActivityID by 6
# 2. rep SubjectID by 6
# 3. convert one data.frame to a vector
# 4. loop over all variables
dfNo2 <- data.frame(SubjectID=rep(1:30, each=6),
                    ActivityID=rep(as.character(activity_labels[,2]), 30))
collabels <- colnames(extracted)
for (i in seq(from=3,to=81,by=1)) {
    print(i)
    temp <- tapply(extracted[,collabels[i]],
                   list(extracted$SubjectID,extracted$ActivityID),
                   mean)
    dfNo2 <- cbind(dfNo2,as.vector(t(temp)))
    colnames(dfNo2)[i] <- collabels[i]    
}
write.table(dfNo2,
            "/Users/youweizheng/Google Drive/githubrepo/datasciencecoursera/GettingAndCleaningData/CourseProject/dataset2_meanstd.txt",
            sep=",",row.names=FALSE)