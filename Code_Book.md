The run\_analysis.R script performs the data preparation and then
followed by the 5 steps required as described in the course project’s
definition.  

> 1.  **Download the dataset**

-   The folder called UCI HAR Dataset

> 1.  **Assign each data to variable**

-   fectures = features.txt: 561 rows, 2 columns

-   activities = activity\_label.txt: 6 rows, 2 columns

-   subject\_test = test/subject\_test.txt: 2947 rows , 1 column

-   X\_test = test/X\_test: 2947 rows, 561 columns

-   y\_test = test/y\_test: 2947, 1 column

-   subject\_train = train/subject\_train.txt: 7352 rows, 1 column

-   X\_train = train/X\_train.txt: 7352 rows, 561 columns

-   y\_train = train/y\_train.txt: 7352 rows, 1 column

> 1.  **Merges the training set and the test set to create one**

-   X (10299 rows, 561 columns) is created by merging X\_train and
    X\_test

-   Y (10299 rows, 1 column) is created by merging y\_train and y\_test

-   subject (10299 rows, 1 column) is created by merging subject\_train
    and subject\_test

-   total\_data (10299,563 columns) is created by merge X, Y and subject

> 1.  **Extract only the measurements on the mean and standard deviation
>     of each variable**

-   tidy(10299 rows, 80 columns) is created by select sample, Activity
    and the mean, standard deviation for each measurement

> 1.  **Uses descriptive activity names to introduce the activities in
>     the data set **

-   replace the sample column in the tidy data

> 1.  **Aproprietely labels in the data set**

-   All acc in column’s names replaces to Acelerometer

-   All Gyro in column’s names replaces to Gyroscope

-   All BodyBody in column’s names replaces to Body

-   All Mag in column’s names replaces to Magnitude

-   All start with character f in column’s names replace by Frequency

-   All start with character t in column’s names replace by Time

> 1.  **From the data set in step 4, creates a second, independent tidy
>     data set with the average of each variable for each activity and
>     each subject**

-   final (180 rows, 80 columns) is created by summarizing tidy taking
    the group by of sample and activity and showing the mean of every
    variable

-   Export final into final.txt
