# Data wrangling/munging transforming raw data into a structured format suitable for analysis by means collect,clean and manipulate data
#join and merge  datasets based on a common column  to have more complex datasets

#Why? because raw data often contains problems, which can hinder accurate analysis and modeling. it ensure data quality, enhance data interoperability, and derive meaningful insights from the data.

# Step 1: Data COLLECTION by reading from excel, csv(each line is a row and he values , are column data), json(structured key value) or databases web scraping, online surveys and crowd sourcing (group of people share data about same thing)

#import data into R 
#Way 1
# File formats that can hold data are varied:
# ● text files can be read using read.table() function.
# ● CSV files can be read using read.csv() function.
# ● XLS files, can be read using read.excel() function from the “readxl” package
# ● JSON files can be read using read_json() function from the “jsonlite” package

#Way 2
#Getting Data From APIS
# response= GET("url")
#when getting a response back we should check if faild or true by checking the codes by fn : status_code
# to display its content we use content() fn 


# Step2 2: Data inspection/EDA by dimension data types structure and NULL values so we can Discovering Patterns and Spotting Anomalies
#fist we should know shape of data nrow ncol (size) so we can know what algo to use also know the type of columns (int.char, boolean ,date decimal and so ) and detect nulls to be removed durning cleaning proces
#second we should get summery stat on the columns  ( mean , avg , median . std and so ) 
#3rd plot visuals 
#NOTE: dim(dataset) gives the dimensions rows*col
## Detecting null values
#sum(is.na(data)) count  null values
#summary(data) calculate all columns data but we can pass what col names we want

# STep 3: Data Cleaning handle raw data often contains problems, which can,hinder accurate analysis and modeling.missing value removal, outliers and data errors. we use outliers detection added correction  are techniques used for this propose 
# and # Step 4: Data transformation converting data types and naming variables and handling date and time  and make data more consistent and better for analysis

#1- in eda we spot nulls now we deal with it 
#if a row has nul value we either remove the whole row 
#or fill the missing values using with he mean and median of the whole column because i want to keep ex:the gender to avoid bios data
#2- Remove delicates data because if kept it can show a fake indicator about it
#3- fixing data Structure
#-> we only have 2 types of ds 1- numerical or categorical like Male/Female
#4-label encoding  but to analyze data we can only analyze numerical values so we transform categorical data to numerical  better for analysis and representation  this is called label encoding 
#5- Scaling numerical var:
#range differs between columns will give wrong analysis so what we have to do is to make all columns nearly same range by normalization (ex:all ranges between  0,1 ) or standardization (data have mean of zero and deviation of 1 )(ztable)
#by rule normalized value= number/ max(all numbers )
#by standardized vale= number - mean(all values in column)/ std(x)
#6- Finding correlated variables  2 columns give same  value (bmi and weight or age and dob ) ( value that can be calculated based on another column )
#-1 Correlation Matrix:its a matrix of sam dim as its number of variable * number of variable to see each var in row how it effects the var in column if its 1 then its the same var corelation  a var with it self will have maxium value corelation using the cor() fn
#2-Heat Map through colors 1,0,-1 dark is most corelation
#7 Handling Date and Time data : extract y/m/d form full date  and duration like h/s/m or week 


#1 fn to remove row with nulls
new_df <- na.omit(df)
# remove 4th row
new_df <- df[-c(4), ]
# remove 2nd through 4th row
new_df <- df[-c(2:4), ]
# remove 1st, 2nd, and 4th row
new_df <- df[-c(1, 2, 4), ]
# only keep rows where col1 value is less than 10 and col2 value is less than 6
new_df <- subset(df, col1<10 & col2<6)
# Replace NA in a specific column (e.g., Column1)
df$Column1[is.na(df$Column1)] <- mean(df$Column1, na.rm = TRUE)
# Replace NA in all columns
for(i in 1:ncol(df)) {
  df[, i][is.na(df[, i])] <- mean(df[, i], na.rm = TRUE)
}
# OR Install the zoo package if you haven't already
install.packages("zoo")
# Load the zoo package
library(zoo)
# Replace NA in all columns
df <- na.aggregate(df)

# 2 Remove duplicate rows across the entire data frame
df <- df[!duplicated(df), ]
# Remove duplicate rows across specific columns of the data frame
df <- df[!duplicated(df[c('var1')]), ]
#OR 
# Install the dplyr package if you haven't already
install.packages("dplyr")
# Load the dplyr package
library(dplyr)
# Remove duplicate rows across the entire data frame
df <- df %>% distinct(.keep_all = TRUE)
# Remove duplicate rows across specific columns of the data frame
df <- df %>% distinct(var1, .keep_all = TRUE)

# 4- Convert a categorical variable into a numeric variable
df$gender <- ifelse(df$gender == "female", 0, 1)
# 5- scaling numbers 
#by standaraziation # Assuming df is your data frame and var1, var2 are the variables you want to standardize
df[, c("var1", "var2")] <- scale(df[, c("var1", "var2")])
# Assuming df is your data frame and var1, var2 are the variables you want to normalize
df[, c("var1", "var2")] <- lapply(df[, c("var1", "var2")], function(x) (x - min(x)) / (max(x) - min(x)))
# 6- Assuming df is your data frame and var1, var2, var3 are the variables
df <- data.frame(var1, var2, var3)
# Create correlation matrix
cor_matrix <- cor(df)
# Create a heatmap
heatmap(as.matrix(df))
#absulte values of cor matrixes
heatmap(abs(cor_matrix), symm = TRUE)
#7 handling date time 
# Install the lubridate package if you haven't already
install.packages("lubridate")
# Load the lubridate package
library(lubridate)
# Assuming df is your data frame and date_col is your date-time column
df$date_col <- as.POSIXct(df$date_col)
# Extract year
df$year <- year(df$date_col)
# Extract month
df$month <- month(df$date_col)
# Extract day
df$day <- day(df$date_col)
# Extract hour
df$hour <- hour(df$date_col)
# Extract minute
df$minute <- minute(df$date_col)
# Extract second
df$second <- second(df$date_col)
# Extract week of the year
df$week <- week(df$date_col)
# Calculate duration from a specific date (e.g., 2000-01-01)
start_date <- as.POSIXct("2000-01-01")
df$duration <- df$date_col - start_date


# Step 5: Data manipulation  
# step 6: Data Reshaping that deals with transforming data to wide and long formats to facilitate the analysis and Visualization of Data

# filtering,sorting, subset, aggregate(grouping),joining and merging 
# 1- filtering data asc or dsc
# 2- subsetting ( take a part of data ) think of it like  a view table 
subset_rows <- mtcars[1:5,1:3 ] #getting data 5 rows 3 columns 
# 3- data aggregation and grouping (sum,mean,coun ...)
aggregated_data <- aggregate(mpg ~ cyl, data = mtcars, FUN = mean) #first var is name of what am calusalting and - IN RESCET FOR GROUPING IN COLUMN 2 
#Let's calculate the average miles per gallon (mpg) and horsepower (hp) for each number of cylinders (cyl) and gears in the dataset.
aggregated_data <- aggregate(cbind(mpg, hp) ~ cyl + gear, data = mtcars, FUN = mean)
# 4- Data Pivoting :2  columns one become row 2 column to see  relatetion among it like column gender f/m now we have 2 columns male female and the rows category a b 
# -> cat column is now the index what do we mean by indexing data 
# 5- Data Indxing :is  Selecting a column variable to index all rows (condition) so we can sort accordingly and each row should have unique index
#one column indexing 
 df[df$var1 > 5, ] gives the rows where var 1 > 5 for all columns 
# 2 column indexing 
df[df$var1 > 5 & df$var2 < 10, ]
#6- Cross-Tabbing is piviting as step 1 
#step 2 is to count the frequency of the result var one is rows sencond is col count freq
crosstab <- table(mtcars$cyl, mtcars$carb)
# normalizing the crosstab we use prop 
#note that we use margin 2 to analyse verticlly (bl tol, y) margin1 herzontilly (bl 3rd , x)
normalized_crosstab <- prop.table(table(mtcars$cyl, mtcars$carb), margin = 2)


#STEP7- Data Merging and joining 
# when we have data coming from diffrent sources we have to aggregate/group data

# we use data merging when we have same columns (add rows ) by appending data togther 
merged_data <- rbind(data1, data2)

# while we use data joing when whe have diffrent columns but one key column in common like id 
# -> Data Joining comes in many forms
# -> inner-join: only return all columns from 2 datasets but only  the rows that are common ( ex: data1(1,2,3) data2(2,3,4) joining will return only rows of 2,3)
# -> left-join: return all rows from left table and the matching rows from the second table with all the column (added columns will be empty values for the rows not found in the second set) 
# -> right-join:return all rows from right table and the matching rows from the second table with all the column (added columns will be empty values for the rows not found in the first set) 
# -> outer-join(defult): returning all rows and columns
joined_data <- inner_join(data1, data2, by = "common_key")
joined_data <- right_join(data1, data2, by = "common_key")
joined_data <- left_join(data1, data2, by = "common_key")
joined_data <- full_join(data1, data2, by = "common_key")


