# Read the training data from the files
train_data_x <- read.table("./data/train/X_train.txt")
train_data_y <- read.table("./data/train/y_train.txt")
train_data_subject <- read.table("./data/train/subject_train.txt")

# Read the test data from the files
test_data_x <- read.table("./data/test/X_test.txt")
test_data_y <- read.table("./data/test/y_test.txt")
test_data_subject <- read.table("./data/test/subject_test.txt")

# Read the features
features <- read.table("./data/features.txt")

# Read the activity labels
activity_labels <- read.table("./data/activity_labels.txt")

# Join the data 
joined_data <- rbind(train_data_x,test_data_x)
joined_labels <- rbind(train_data_y,test_data_y)
joined_subjects <- rbind(train_data_subject,test_data_subject)

# Set the names of the columns 
names(joined_data) = features[[2]]
names(joined_labels) = c("activityid")
names(joined_subjects) = c("subjects")

# Extract the data from a column as a vector, merge the two vectors and remove duplicates
means_indices <- grep("mean",features[[2]])
std_indices <- grep("std",features[[2]])
merged_indices <- unique(c(means_indices,std_indices)) ## Use unique to remove any duplicates if any

# Extract relevant joined data from the indices 
indiced_joined_data <- joined_data[merged_indices]


# Tidy up the column names
names(activity_labels) = c("activityid","activityname")

# Substitute the IDs with the merge function 
activities <- merge(activity_labels,joined_labels,"activityid")
indiced_joined_data$activities <- activities[[2]]
indiced_joined_data$subjects <- joined_subjects[[1]]


# Clean up the names
names(indiced_joined_data) <- gsub("\\(\\)","",names(indiced_joined_data))
names(indiced_joined_data) <- gsub("std","Std",names(indiced_joined_data))
names(indiced_joined_data) <- gsub("mean","Mean",names(indiced_joined_data))
names(indiced_joined_data) <- gsub("-","",names(indiced_joined_data))

# Create the second set
second_set <- aggregate(indiced_joined_data, by=list(activity = indiced_joined_data$activities, subject=indiced_joined_data$subjects), mean)

# write to file
write.table(indiced_joined_data, "clean_data.txt")
write.table(second_set,"second_set.txt",row.name=FALSE)