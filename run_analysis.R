setwd("C:/Users/user/Desktop/R/Course 3/Assignment")

##Loading all data files
##Load label file
act_lbl<- read.table(file = "UCI HAR Dataset/activity_labels.txt")
features<- read.table(file = "UCI HAR Dataset/features.txt")
##Load test data
x.test<- read.table(file = "UCI HAR Dataset/test/X_test.txt", header=F)
y.test<- read.table(file = "UCI HAR Dataset/test/y_test.txt", header=F)
##Load train data
x.train<- read.table(file = "UCI HAR Dataset/train/X_train.txt", header=F)
y.train<- read.table(file = "UCI HAR Dataset/train/y_train.txt", header=F)

##Merge Activity together
y.test<- merge(x = y.test, y = act_lbl, by.y = "V1", by.x = "V1", all = T)
y.train<- merge(x = y.train, y = act_lbl, by.y = "V1", by.x = "V1", all = T)

##Adding column names for x data
names(x.test)<- tolower(features$V2)
names(x.train)<- tolower(features$V2)

##Bind all the columns together
test<- cbind(x.test, y.test$V2)
train<- cbind(x.train, y.train$V2)

#Rename column name
names(test)[562] <- "activity"
names(train)[562]<- "activity"

##Bind all rows together
test.train<- rbind(test, train)

##Getting all mean and  standard deviation
names(test.train)[grep("mean[\\()]|std[\\()]", x = names(test.train))]
names(test.train)[grep("mean\\(|std\\(", x = names(test.train))]

test.train.mean.std<- test.train[, grep("mean\\(|std\\(", x = names(test.train))]

names(test.train.mean.std)<- gsub(pattern = "[\\()]", replacement = "", gsub(pattern = "-", replacement = ".", names(test.train.mean.std)))

names(test.train.mean.std)


View(test.train.mean.std)
str(test.train.mean.std)
summary(test.train.mean.std)

library(dplyr)

by.activity<- group_by(.data = test.train.mean.std, test.train$activity)

paste(names(by.activity), "= mean(", names(by.activity), "),"  )

str(by.activity)

data<- summarize(by.activity, 
tbodyacc.mean.x = mean( tbodyacc.mean.x ),tbodyacc.mean.y = mean( tbodyacc.mean.y ),
tbodyacc.mean.z = mean( tbodyacc.mean.z ),tbodyacc.std.x = mean( tbodyacc.std.x ),
tbodyacc.std.y = mean( tbodyacc.std.y ),tbodyacc.std.z = mean( tbodyacc.std.z ),
tgravityacc.mean.x = mean( tgravityacc.mean.x ),tgravityacc.mean.y = mean( tgravityacc.mean.y ),
tgravityacc.mean.z = mean( tgravityacc.mean.z ),tgravityacc.std.x = mean( tgravityacc.std.x ),
tgravityacc.std.y = mean( tgravityacc.std.y ),tgravityacc.std.z = mean( tgravityacc.std.z ),
tbodyaccjerk.mean.x = mean( tbodyaccjerk.mean.x ),tbodyaccjerk.mean.y = mean( tbodyaccjerk.mean.y ),
tbodyaccjerk.mean.z = mean( tbodyaccjerk.mean.z ),tbodyaccjerk.std.x = mean( tbodyaccjerk.std.x ),
tbodyaccjerk.std.y = mean( tbodyaccjerk.std.y ),tbodyaccjerk.std.z = mean( tbodyaccjerk.std.z ),
tbodygyro.mean.x = mean( tbodygyro.mean.x ),tbodygyro.mean.y = mean( tbodygyro.mean.y ),
tbodygyro.mean.z = mean( tbodygyro.mean.z ),tbodygyro.std.x = mean( tbodygyro.std.x ),
tbodygyro.std.y = mean( tbodygyro.std.y ),tbodygyro.std.z = mean( tbodygyro.std.z ),
tbodygyrojerk.mean.x = mean( tbodygyrojerk.mean.x ),tbodygyrojerk.mean.y = mean( tbodygyrojerk.mean.y ),
tbodygyrojerk.mean.z = mean( tbodygyrojerk.mean.z ),tbodygyrojerk.std.x = mean( tbodygyrojerk.std.x ),
tbodygyrojerk.std.y = mean( tbodygyrojerk.std.y ),tbodygyrojerk.std.z = mean( tbodygyrojerk.std.z ),
tbodyaccmag.mean = mean( tbodyaccmag.mean ),tbodyaccmag.std = mean( tbodyaccmag.std ),
tgravityaccmag.mean = mean( tgravityaccmag.mean ),tgravityaccmag.std = mean( tgravityaccmag.std ),
tbodyaccjerkmag.mean = mean( tbodyaccjerkmag.mean ),tbodyaccjerkmag.std = mean( tbodyaccjerkmag.std ),
tbodygyromag.mean = mean( tbodygyromag.mean ),tbodygyromag.std = mean( tbodygyromag.std ),
tbodygyrojerkmag.mean = mean( tbodygyrojerkmag.mean ),tbodygyrojerkmag.std = mean( tbodygyrojerkmag.std ),
fbodyacc.mean.x = mean( fbodyacc.mean.x ),fbodyacc.mean.y = mean( fbodyacc.mean.y ),
fbodyacc.mean.z = mean( fbodyacc.mean.z ),fbodyacc.std.x = mean( fbodyacc.std.x ),
fbodyacc.std.y = mean( fbodyacc.std.y ),fbodyacc.std.z = mean( fbodyacc.std.z ),
fbodyaccjerk.mean.x = mean( fbodyaccjerk.mean.x ),fbodyaccjerk.mean.y = mean( fbodyaccjerk.mean.y ),
fbodyaccjerk.mean.z = mean( fbodyaccjerk.mean.z ),fbodyaccjerk.std.x = mean( fbodyaccjerk.std.x ),
fbodyaccjerk.std.y = mean( fbodyaccjerk.std.y ),fbodyaccjerk.std.z = mean( fbodyaccjerk.std.z ),
fbodygyro.mean.x = mean( fbodygyro.mean.x ),fbodygyro.mean.y = mean( fbodygyro.mean.y ),
fbodygyro.mean.z = mean( fbodygyro.mean.z ),fbodygyro.std.x = mean( fbodygyro.std.x ),
fbodygyro.std.y = mean( fbodygyro.std.y ),fbodygyro.std.z = mean( fbodygyro.std.z ),
fbodyaccmag.mean = mean( fbodyaccmag.mean ),fbodyaccmag.std = mean( fbodyaccmag.std ),
fbodybodyaccjerkmag.mean = mean( fbodybodyaccjerkmag.mean ),fbodybodyaccjerkmag.std = mean( fbodybodyaccjerkmag.std ),
fbodybodygyromag.mean = mean( fbodybodygyromag.mean ),fbodybodygyromag.std = mean( fbodybodygyromag.std ),
fbodybodygyrojerkmag.mean = mean( fbodybodygyrojerkmag.mean ),fbodybodygyrojerkmag.std = mean( fbodybodygyrojerkmag.std ))

write.table(data, row.names=FALSE , file = "data.txt")
