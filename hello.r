#1-first hello in R 
print ('Hello World');

#2-variables are used  to save data works as containers
#how to assign a value to a variable : ASSIGNMENT OPERATORS
#use : = OR <- OR  -> OR <<- OR ->>
#<- (Leftward Assignment): This is the most common way to assign a value to a variable in R1. For example, x <- 3 assigns the value 3 to the variable x1.
#= (Equal Sign Assignment): This is an alternative way to assign a value to a variable1. It works similarly to <-, but it’s not recommended for assignment within functions because it can lead to confusion with the = used for specifying default argument values1. For example, x = 3 also assigns the value 3 to x1.
#-> (Rightward Assignment): This is the same as <-, but the order is reversed1. For example, 3 -> x assigns the value 3 to x1. It’s less commonly used because it’s less readable1.
#<<- and ->> (Global Assignment): These operators assign a value to a variable in the global environment, or the parent frame if it doesn’t exist in the global environment1. For example, if you’re inside a function and want to assign a value to a variable that exists outside the function, you can use <<- or ->>1. For example, x <<- 3 or 3 ->> x assigns the value 3 to x in the global environment1.

"hello" -> C
x <<- 1
y<-'hello'
z = x+3
print(C)
print(x)
print(y)
print(z)
print("end")

#3- class() fn is used to get the datatype of number or variable
#numeric  Integer logical complex character

#logical
print ( class(TRUE) )
print ( class(FALSE) )
#Integer an whole number L is long integer or use as.integer(3)
#to have an integer without the suffix L otherwise R takes all numbers as numeric
print ( class(3L) )
my_integer <- as.integer(3)
print(class(my_integer))
#numeric
print ( class(10.5) )
#complex
print ( class(1+2i) )
#char
print ( class('WORDS') )


#4-Arithmetic Operators how to calculate 

# +(add) -(sub) *(multiple) /(division) ^OR**(exponential/power) same as all lang
# %% reminder 
# %/%2  is used for integer division
#note when doing these operations on vectors we do each one on its corresponding index ex: v1(1)+v2(1)
# note that power ^ when number is big R do it scientific to get actual number print(format(x^y, scientific = FALSE)) but format always give char values so u need to transform it
x <- 10
y <- 5

print ( x+y)
print (x-y )
print (x*y )
print (x/y )
print (x^y )
print (x**y )
print(as.integer(format(x^y, scientific = FALSE)))
print ( x%%y)
print (x%/%y )


#5- Relational operators
# < > == >= <= !=  as all lang
# however when comparing chars  it doesn't use ASCII it use alphabetic order after bigger A<B true
print("hello">"Good")

#6- Logical Operators 
#!(not: It takes each element of the vector and gives the opposite logical value.) 
#&(and wise :It combines each element of the first vector with the corresponding element of the second vector and gives a output TRUE if both the elements are TRUE )
#&&(And: first element of each vector and )
# |(or wise : It combines each element of the first vector with the corresponding element of the second vector and gives a output TRUE if one the elements is TRUE )
# || (or:It takes first element of both the vectors and gives the TRUE if one of them is TRUE.Logical Operators)

# prints false
# print(!(TRUE))
#& element wise comparing each element in vector in its index in vector2 
#c(TRUE,TRUE,FALSE) & C(TRUE,FALSE,FALSE) = c(TRUE,FALSE,FALSE)
#| ELEMENT WISE 
#c(TRUE,TRUE,FALSE) | C(TRUE,FALSE,FALSE) = c(TRUE,TRUE,FALSE)

#7-Miscellaneous Operators
#help inn printing sequence and assigning values to vectors
# : %in% %*%

#PRINT A SEQ BETWEEN 1 5 12345
print(1:5)

#CHECK IF AN ELEMENT IS IN A LIST OR A COLLECTION OF VALUES
val<-2
list1<- c(TRUE,2,"apple")
print(val %in% list1)

#used for matrix multiplications
Matrix1 <- matrix(c(1, 2, 3, 4), nrow = 2)
Matrix2 <- matrix(c(5, 6, 7, 8), nrow = 2)
# Print the matrices
print(Matrix1)
print(Matrix2)

# Multiply the matrices
result <- Matrix1 %*% Matrix2

# Print the result
print(result)

#NOTE
#printing Print() vs cat()
#print prints each word on a line cat (coenact /add) prints on same line


#8-conditional execution if else statement could be as nested as we want
#z=2
z= 3
if (z==2){
     print('true if ')
}else {
     print( 'no if')
}

#9- LOOPS ->> FOR WHILE REPEAT 

# for loop is used when the number of iteration is know ( could be the length of vector/list.. or a sequence)
#no need for incrimination it will loop the whole length of the variable 

for(val in 1:5){
     cat("for ",val,"\n")
}

#while LOOP we should start with a value and manually increment it will loop as long as initial value is valid upon condition
startValue = 1
while (startValue <= 20){
     print(startValue)
     startValue=  startValue+1
}

#repeat loop like its name repeat the code until a specific condition is meet  so force stop of loop by using break
#perfectly used when we don't know when the condition will be meet 
#the whole set of lines before after the conditions will be repeated if the condition is not meet when its meet it get out of the whole repeat and execute the after lines 
testrep=1
repeat{
     print(testrep)
     testrep=testrep+1
     if(testrep>5){
          break
     }
}
print("after break out ")


#10- Functions : is a container that execute a set of instructions once calledupon helps in makeing block of re-usable codes 
# it has a name and accept arguments and return or print a value 
# if it returns a value than the value must be stored in a variable 

#function has a local scope variables defined within it are only accessed within th fn not form global scope
#but a variable declared as global <<- can be accessed in and out fn and if its global on top code  can be accessed within the fn

 #syntax
 #fnNameVariable<- function(parm1,param2) {
    #cal
     #return (val)
 #}

 evenOdd<- function(number){
     if (number %% 2 == 0 ){
          return ("even")
     }else{
          return ("odd")
     }
 }
 #when calling the fn its called argument
 print(evenOdd(3))
  print(evenOdd(4))


#11- Data Structures in R 
# what is DS:  is a way of storing data allowing us to manipulate and access it easy may store data in same type or could be different Types
#There are so Many DS out there each one has its own use case But in R we Only Have the following

#NOTE: C() is the fn that concatenate all elements of all DS tother
#All DS start index from 1 

#1-11 Vectors:
#- Its a one dimension box to store one type of data of a specified length
#we can either create vectors like this 
#we access vectors elements by index 
vector1<- c(1,2,3,4)
vector2<-c(1:4)
print(vector1)
print(vector2)

#2-11 List:
# Its a one Dimension Box Of storing All KINDS of data (heterogenous) of a specified length
# to create a list we should use the key word list 
list1<- list('farah',25,c("lebanon","Beirut"))
print(list1)
#to access vectors inside list or if elemnts are named by: $nameOfelement
print(list1[[3]])

#3-11 Matrix:
# Its a one type data holder BUT 2D rows and columns of whatever number we define 
#to create a Matrix we use the key word Matrix that has 3 params:  matrix(C(data),nrow= , ncol= ) can also take a 4h one to define byrow=true  of how to spread data its by default bycol 

matrix1<-matrix(c(1:6),nrow=2,ncol=3)
print(matrix1)

#4-11 Data Frames:
#A way to save Data in Form of table 2D columns and rows and holds heterogeneous/different types of DataTypes
# To create df we use the key word data.frame()
#Note that the arguments sent are the column names and the values of each vector are the rows
Names=c('Farah','Ahmad','Nana')
Age=c(25,30,2)
Lang=c("ar","eng","fr")
df =data.frame(Names,Age,Lang,stringsAsFactors=FALSE)
print(df)

#Note: str() is one of the built in fn in R used to give a summery of any ds and the objects inside it  Why ? to better understand kind of data the ds hold and whats inside to know how to manipulate and access it 
print(str(df))
#result
#'data.frame':   3 obs. of  3 variables:
# $ Names: chr  "Farah" "Ahmad" "Nana"
# $ Age  : num  25 30 2
# $ Lang : chr  "ar" "eng" "fr"


#Now when we are dealing with real data we either gonna get the data from excel sheet or a CSV files
#To create Data Frames From external Files:
#excel: newDF = read.table(path="Path of the file")
#CSV: newDF = read.csv("FileName.csv")

#to access the data inside the df 
#df[[indexrow],[indexcol] note can be a seq 1:5 rows or column

#Now why df? because we can create subset of a data that we want to analyze based on some conditions
#we create the subset using the keyword subset: newDF = subset(df, conditions) conditions are columnName|variables applying  logical operators != & | < > ... Name=="farah"

#adding rows and columns to the data frame is by creating a new instance(another version )
#rows: newDF = rbind(df, the entries for the new row you have to add )ex: newDf = rbind(df, data.frame(Name = "Sandeep",Language = "C",Age = 23))
#col: newDF = cbind(df, the entries for the new column you have to add ) ex:newDf = cbind(df, Rank=c(3, 5, 1))


#to manipulate the data by adding variables|columns that depends on another columns we use dplyr library(data frame pliers(maniuplating) in R)  
#first we Import It : library(dplyr)
#newDF <- mutate(df,new_varNaming = oldColumn * 2) here am adding new column that takes old column values and multiply by 2

#to delete rows and columns 
#newDF = df[-rowNo, -colNo]

#remember when editing u either create new dataframe updated or just access values directly example: person_df$Age[4] <- 36 or df[1,1] row1 column 1 just by index


#5- ARRAYS:
# To Create Complex Data Holding Structure that holds more than 2D not just rows and columns
# It Holds Homogenous Data Types 
# we create it using the keyword array , dim is for dimensions , nmat= number of matrixes, nrow&ncol for all matrixes which mean in simple words array holds multiple matrixes of same dimentions and same data types
# array(vectorData, dim=c(nrow,ncol,nmat))

array1= array(c(1:8),dim=c(2,2,2))
print(array1)
#result 2 matrixes 2*2 
#, , 1 [,1] [,2]
#[1,]    5    7
#[2,]    6    8
#, , 2   [,1] [,2]
#[1,]    1    3
#[2,]    2    4

#6-11 Factors:
# we use this when dividing data into different categories groups
# basically used to get out nb of accourences or frequency of a data
#lets say u have 1000 record and music genre are repeated u give it the genre and it abstract the words and give u a short list of all words mentioned one or more times 
#we create a factor using the keyword factor or just use it as a fn
testDataFactor=c("Farah","Moussa","NaNa","Farah","Moussa","Farah","Moussa","Farah","Moussa","Red")
testDataFactor2=factor(c("Farah","Moussa","NaNa","Farah","Moussa","Farah","Moussa","Farah","Moussa","Red"))
print(factor(testDataFactor))
print(testDataFactor2)
#result Levels: Farah Moussa NaNa Red

# Exercise: Combining Data Structures
# Create a vector of names
names <- c("Alice", "Bob", "Charlie", "David", "Eve")
# Create a numeric vector of ages
ages <- c(25, 32, 28, 35, 30)
# Create a factor of colors
colors <- factor(c("blue", "red", "green", "blue", "green"))
# Create a list of person information
person_info <- list(name = names,age = ages,color = colors)
# Create a data frame from the person_info list
person_df <- data.frame(Name = person_info$name,Age = person_info$age,Color = person_info$color)
# Access the favorite color of the second person
second_person_color <- person_df$Color[2]
print(second_person_color)
# Modify the age of the fourth person
person_df$Age[4] <- 36
# Print the updated person_df data frame
print(person_df)

#Data Visualization is made to notice any patterns and take better decisions
#types of visuals:
#1- Line Chats: Change of something over Time ( x-sales/y-year)
#2- Bar Charts: Change of something over Time ( x-sales/y-year) But several variables like year 2023 and 2022 (trends)
#3- Pie Charts: Used With Numbers and % show the element as a whole
#4- Histograms: x-frequency y-variable|Bin how often each different value in a set of data occurs like age in a dataset
#5- Scatter Plot: used to see trendlines/colorations (if something/variable increased what happens to another variable increase or decrease) with no concern to time (liner corelation increase decrease or positive negative) 
#6- Bubble Plot: like scatter plot but 3 variables instead of 2
