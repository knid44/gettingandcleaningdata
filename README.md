# Getting and Cleaning Data Course Project
Course Project for Week 4 of Getting and Cleaning Data, Coursera

## Objective
The objective of this analysis is to create a single tidy data set from various data files available from UCI.

## Background
Accelometer data for over 500 variables was collected from 30 subjects wearing Samsung Galaxy S smartphones. Subjects were divided into a 'test' group and a 'training' group, and data was collected for six different activites, such as walking, climbing stairs, sitting, standing, etc. The orginal data was collected in several files:

1. Activity Labels (designates activities with a numerical value from 1 - 6)
2. Features Labels (designates descriptive names for the 500+ variables measured)
3. X Test & X Train (record of numeric values for the 500+ variables measured)
4. Y Test & Y Train (designates the activity by numerical value from 1 - 6 for each observation)
5. Subject Test & Subject Train (designates the subject with a numerical label from 1 - 30 for each observation)

## Method
The script 'run_analysis.R' applys the following steps:

1. Loads the appropriate libraries into R
2. Reads the .txt files into data tables
3. Appends the Y data tables and the Subject data tables to the X data tables
4. Binds the Test and Train data tables into a single data table
5. Re-names the columns by the descriptive names in the Features data table
6. Subsets the data to only include variables that include information on the means or standard deviations
7. Replaces the Activity numbers with descriptive names
8. Creates a data table with the average (mean) of each variable by Activity and Subject

## Output
The final output is the included .txt file 'dataset2.txt' which can be viewed in a friendly way using the read.table function in R.
