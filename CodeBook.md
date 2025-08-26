# CodeBook

## Dataset
This project uses data from the **Human Activity Recognition Using Smartphones Dataset (UCI HAR Dataset)**.  
It contains data collected from the accelerometers and gyroscopes of Samsung Galaxy S smartphones carried by 30 subjects performing 6 activities.

## Variables
The final tidy dataset `tidy_data.txt` contains the following variables:

- **subject**: ID of the subject (ranges from 1 to 30).  
- **activity**: The activity performed. One of:
  - WALKING  
  - WALKING_UPSTAIRS  
  - WALKING_DOWNSTAIRS  
  - SITTING  
  - STANDING  
  - LAYING  

- **Measurements**: For each subject and activity, the dataset contains the average of selected sensor signals. Only the mean and standard deviation measurements were extracted. Examples include:
  - Time_BodyAccelerometer_mean_X  
  - Time_BodyAccelerometer_std_Y  
  - Time_BodyGyroscope_mean_Z  
  - Freq_BodyAccelerometer_mean_X  
  - Freq_BodyAccelerometer_std_Z  
  - … etc.  

These variables represent the **average** (per subject, per activity) of the original mean and standard deviation features.

## Transformations
The following steps were performed in `run_analysis.R`:

1. Merged the training and test datasets into one dataset.  
2. Extracted only the measurements on the mean and standard deviation for each measurement.  
3. Used descriptive activity names to name the activities in the dataset.  
4. Appropriately labeled the dataset with descriptive variable names (expanded abbreviations and cleaned formatting).  
5. Created an independent tidy dataset with the average of each variable for each activity and each subject.  

The result is a tidy dataset (`tidy_data.txt`) with 180 rows (30 subjects × 6 activities) and one column per variable.
