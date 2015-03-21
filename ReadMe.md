The dataset includes the following files:
=========================================

- README.txt
- CodeBook.md - Shows information of variables in data.txt
- run_analysis.R - Shows the steps on how data.txt is being created.
- data.txt - Mean values of data from the accelerometers from the Samsung Galaxy S smartphone


run_analysis.R
-The code first import all data provided (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
Next it will import all data into the system. Next it will add column and row description into the data sets and combine both test and train data.

After data has been combine into one dataset, only mean and standard deviation is being extracted.

Lastly getting the mean of each activity and export the data into data.txt
