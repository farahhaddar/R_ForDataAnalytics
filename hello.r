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
