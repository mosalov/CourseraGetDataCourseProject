#Step 1
#Setting a path to files
data_directory <- "UCI HAR Dataset"
#Changing the working directory
setwd(data_directory)
#Extracting data from files, the only column from "y" files is names as "Y" to distinguish it from columns form "X" files
test_X <- read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")
names(test_y) <- c("Y")
test_subj <- read.table("test/subject_test.txt")
names(test_subj) <- c("S")
train_X <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")
names(train_y) <- c("Y")
train_subj <- read.table("train/subject_train.txt")
names(train_subj) <- c("S")
#Merging test data
test <- cbind(test_X, test_y)
test <- cbind(test, test_subj)
#Merging train data
train <- cbind(train_X, train_y)
train <- cbind(train, train_subj)
#Merging all data
data <- rbind(test, train)

#Step 2
#Extract features
features <- read.table("features.txt")
#Construct a logical vector of positions containing "mean()" or "std()"
vpos <- grepl(pattern = "mean()", x = as.character(features[,2]), fixed=TRUE) | grepl(pattern = "std()", x = as.character(features[,2]), fixed=TRUE)
#Extracting means and stds
ext_data <- data[, vpos]

#Step 3
#Extract activity labels
activity_labels <- read.table("activity_labels.txt")
#Adding a new variable that is a factor of Y column values
ext_data$YF <- as.factor(ext_data$Y)
levels(ext_data$YF) <- activity_labels[levels(ext_data$YF)==activity_labels$V1,]$V2

#Step 4
#Extract names from features, add names for other columns
feature_names <- c(as.character(features[vpos, 2]), "activity_label_number", "subject", "activity_label")
#Assign names to columns
colnames(ext_data) <- feature_names

#Step 5
#Clearing and transforming ext_data: the column with activity label numbers is deleted, values of avtivity names are transformed from factor to character
ext_data$activity_label_number <- NULL
ext_data$activity_label <- as.character(ext_data$activity_label)
#Constructing the tidy data: calculating mean on all columns except two last ones, grouped by values in two last columns
tidy_data <- aggregate(ext_data[, 1:(ncol(ext_data)-2)], by = list(ext_data$subject, ext_data$activity_label), mean)
#Writing the tidy data to a file
write.table(tidy_data, file = "../tidy_data.txt", row.names = FALSE)
