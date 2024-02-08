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
# however when comparing chars  it doesn't use ASCII it use alphabetic order after biggr A<B true
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

#PRINT A SEQ BETWEN 1 5 12345
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
#print prints each word on a line cat (concat /add) prints on same line


#8-conditional execution if else statment could be as nested as we want
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
#perfectly used when we dont know when the condition will be meet 
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

