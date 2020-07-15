getwd() # displays the working directory in R
x <- 1
# the <- is called the assignment operator which actually assigns a value to a symbol
# x is a symbol assigned with a value of 1
print(x) # this prints out the value of x
x # this is another way of printing the value of x
# symbol represents that everything to the right is a comment.
# when you just type the object, R prints it automatically
# [1] appears because it shows it is the first element of the vector.
x <- 1:20
x

#DATA TYPES USED IN R
# 1. OBJECTS
# these include character, numeric (real numbers), integer, complex. logical (trie/false)
# a vector only contain objects of the same class.
# empty vectors can be created with the vector() function

#a. Numbers 
# generally treated as numeric objects
# inf can be used abnd treated as a number
# NaN represents undefined value, can also be treated as missing value

#ATTRIBUTES
#each object in R has an attribute
# common attributed in R are 
#names, dimnames
#dimensions (e.g. matrices, arrays) - matrix can have nox of rows and nox columns
#class - numeric objects their class is numeric
#length - number of elements

# attributes() is a general function which allows you set or modify the attributes for the R object


#VECTORS AND LISTS
# c() function is another that can be used to create R objects
# this simply mean concatenate 
x <- c(0.5, 0.6) # this creates a numeric object by concatenating .5 and .6
x <- c(TRUE, FALSE) # logical
x <- c(T, F) # logical
x <- c("a", "b", "c") # character
x <- 9:29 ## integer
x <- c(1+0i, 2+4i) ##complex

#using the vector() function
x <- vector("numeric", length = 10) # this creates a default value which is 0
x

#MIXING OBJECTS
#the genral rule is R will create the least common denominator
# will coerce the vector to the least common value
y <- c(1.7, "a") ## character
y <- c(TRUE, 2) # numeric - R interpretes TRUE as 1
y <- c("a", TRUE) # character


# CONVERTING FROM ONE FORM TO ANOTHER
# as. function is used
x <- 0:6
class(x) # used to define the class of the vector
as.numeric(x)
as.logical(x) # 0 is FALSE but any number that is greater than 0 is TRUE
as.character(x)
as.complex(x)
#however, a string cannot be converted into a numeric

#LISTS
# just like a vector
x <- list(1, "a", TRUE, 1+4i)
x #prints each element independently
# elements of a list have double brackets while the rest have single brackets


#MATRICESS
# special vectors in R though have a special attribute called dimensions 
# that is the number of rows and columns
m <- matrix(1:6, nrow = 2, ncol = 3)
m
dim(m)


#NOTE
# can also create a matrix by screening the dimension attribute of a vector
m <- 1:10
m
dim(m) <- c(2, 5) # creates a matrix with 2 rows and 5 columns
m

# can also create a matrix by binding rows and columns
#using the cbing() and rbind() functions
x <- 1:3
y <- 10:12
cbind(x, y) #considers a matrix with x and y as columns  
rbind(x, y) #considers a matrix with x and y as rows



#FACTROS
#special type of a vector used to represent categorical data 
# some may not be ordered e.g male and female while others may be ordered
# factors are important because they are used in modeling functions like lm() and glm()
# Using factors with labels is better than using integers because factors are self describing
# i.e. having a variable with "Male" and "Female" is better than a variable that has values 1 and 2
# can be created with a factor function
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
unclass(x) # assigns values to the categories,



# however, sometimes you may want "yes" to come before "no"
# then, ordering the levels is the best for this. this van be important in linear modeling because the first level is used as baseline
# this can be set using the levels argument to factor()
x <- factor(c("yes", "yes", "no", "yes", "no"),
            levels = c("yes", "no"))
x
unclass(x)



#MISSING VALUE
#represented by NA ro NaN forn undefined mathematical operations
# is.na() ussed to test uif there are missing value
# is.nan() used to test NaN
# NA values also have a class, so there are integer NA, character NA etc.
# a NaN value is also NA but the converse is not true
x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)
x <- c(1, 2, NA, 10, NaN, 3)
is.nan(x)



#DATA FRAMES
# used to store tabular data
# represented as special type of lists
# each column should have the same type of data
# data frames can store different types of classes
# also have special attributes called row.names
# often created by calling read.table() or read.csv()
# can be converted into a matrix by calling data.matrix()
#data.frame() can also be used to create data frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, T))
x
nrow(x)
ncol(x)



#NAME ATTRIBUTES
# R objects can also have names which is useful for writing readable code and self descrining objects
x <- 1:3
names(x)
names(x) <- c("foo", "bar", "norf")
x
names(x)

#Lists can also have names
x <- list(a=1, b=2, c=3)
x
# Note: to access each element within the list we use the $
mean(x$c)

####READING TABULAR DATA IN R
## Principle functions
#read.table, read.csv   ## reading data
#readLines              ## reading lines of a text file
#source                 ## reading in R code files (inverse of dump)
#dget                   ## reading in R code files (inverse of dump)
#load                   ## reading saved workspaces
#unserialize            ## reading single R objects in binary form


###Writing data functions
#write.table, writeLines, dump, dput, save, serialize

##Reading Data Files with read.table
# most commonly used function: arguments include
#file                   ##name of the file or connection
#header                 ##logical indicating if the file has a header line
#sep                    ##string indicating how columns are separated
#colClasses             ##character vector indicating class for each column in dataset
#nrows                  ##nox rows in the dataset
#comment.char           ##character string indicating the comment character
#skip                   ##nox lines to skip from beginning
#stringsAsFactors       ##should character variable be coded as string

# note: you can read tables without specifying any of the arguments
# read.csv is identical to read.table only that the separator is a comma while read.table is a space
# read.csv always specifies header=TRUE




###READING IN LARGER DATASETS WITH read.table
## with large datasets, doing the following thngs will make it easier and will prevent R from closing
    #read the help page for read.table
    #make a rough estimate of the memory required to store your dataset.
#if the dataset is larger than the RAM on the computer, you can probably stop here
    #Set comment.char = "" if there are no commented lines in your file.

    #use the colClasses argument. Specifying this option instead of using a default
#can make read.table run much faster, often twice as fast. In order to use the option, you have to do
#this you have to know the class of each column in your data frame e.g if all the columns are "numeric",
#then you can just set colClasses = "numeric"
initial <- read.table("datatable.txt", nrows = 100)
classes <- sapply(initial, class)
tabAll <- read.table("dataset.text",
                     colClasses = classes)
    #Set nrows does not make R run faster but helps with memory usage. A mild estimate is okay. You can 
#use the Unix tool wc to calculate the number of lines in a file.

####KNow your system while dealing with large datasets
    # how much memory is available
    # what other applications are in use
    # are there other users logged into the same system
    # is the OS 32 or 64 bit

#CALCULATING memory rewuirements
    ## If i have a data frae with 1,500,000 rows and columns, all of chich are numeric data, roughly, how
#much memory is required to store this data frame?
x <- 1500000 * 120 *8 #(assuming each character weighs 8 bytes)
x <- x/2^20 #converting it to MBs
x # x is roughly 1.3 GB


###TEXTUAL DATA FORMATS
    #dumping and dputing are useful because the resulting format is edit-able and in case of corruption, 
#potentially recoverable
    #unlike writing out a table or csv file, dump and dput preserve the metadata (sacrificing some readability)
#so that another user doesn't have to specify it all over again.
    ## textual formats can work much better with version control programs like subversion or git which can only 
#track changes meaningfully in text files
    ##textual formats can be longer lived; if there is corruption somewhere in the file, it can be easier to fix
#the problem
    ##adhere to the Unix philosophy
    ##Downside: not very space efficient

##DPUT-ting R objects
y <- data.frame(a = 1, b = "a")
dput(y)
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y
##in other words the dget functions writes an R code that which can be used to reconstruct an R object


##DUMPING R objects
    ##same as dget only that this can be used on multiple objects
x <- "foo"
y <- data.frame(a = 1, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x, y) # removes x and y
source("data.R") # this adds the removed objects back into R
y
x



##CONNECTION INTERFACES TO THE OUTSIDE WORLD
#Data can be read using connection interfaces. connections can be made to files or to other more 
#exotic things like;
    #file         ##opens a connection to a file
    #gzfile       ##opens a connection to a file compressed with gzip
    #bzfile       ##opens a connection to a file compressed with bzip2
    #url          ##opens a connection to a webpage

#FILE connections
##Reading lines of a text file
con <- gzfile("words.gz")
x <- readLines(con, 10)
x 

##readLines can also be used to read elements on a webpage
con <- url("http://www.jhsph.edu", "r")
x <- readLines(con)
head(x)



#####SUBSETTING R OBJECTS: Basics
#There are a couple of operators that can be used to extract subsets of R objects
    # [         ##always returns an object of the same class as the original;
#can be used to select more than one element (there is no exception)
    # [[        ##is used to extract elements of a list or a data frame; it can only
#be used to extract a single element and the class of the returned object will not necessarily
#be a list or data frame
    # $         ##used to extract elements of a list or data frame by name; semantics are 
#similar to that of [[
#EXAmple
x <- c("a", "b", "c", "c", "d", "a")
x[1]      #extracts the first element of the vector
x[2]      #extracts the second element of the vector
x[1:4]    #extracts from the first to the third

##Logical index
x[x > "a"]        #extrcats elements that are greater than a
u <- x > "a"      #this is logical
u                 # returns T/F for each of the elements
x[u]              # subsets all the elements that are greater than "a"


#SUBSETTING A list
x <- list(foo = 1:4, bar = 0.6)
x[1]      ##produces a list that contains the sequence 1:4
x[[1]]    ##produces just the sequence
#Note: The above explain the difference between a single and double bracket
x$bar
x[["bar"]]
#these two above produce the same results

#EXTRACTING multiple elements from the list [] is used | you can't use the $ here
x <- list(foo = 1:4, bar = 0.6, baz = "hello")
x[c(1, 3)]

###Assuming I have a list that contains a list
#the double bracket operator can take an integer sequency rather than a single number
x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
x[[c(1, 3)]]      ## extracts the third element of the list (first element)
x[[1]][[3]]       ## same as the above


##SUBSETTING MATRICES
# while dealing with matrices first index is the row index and the second is the column index
x <- matrix(1:6, 2, 3)
x
x[1, 2] #extracts a figure in the first row and second column
x[2, 1] # second row first column

# you may not always specify both indices when specifying a matrix)
x[1, ]    #produces the first row of the matrix
x[, 2]    #produces the second column of the matrix

# By default, when a single element of a matrix is retrieved, it is returned as a vector
#of length 1 rather than a 1X1 matrix. This can be turned off by setting drop = FALSE
x[1, 2]
x[1, 2, drop = FALSE] # retuns a matrix instead of a vectro

# similarly, subsetting a single column or a single row will still give a vector not a matrix
#we still use drop = FALSE
x[1, , drop = FALSE]
x[, 2, drop = FALSE]


###PARTIAL MATCHING
#Partial matching is  handy tool which often saves you a lot of time. Not usually useful when writing 
# functions but when typing in the command line
#works with a [[ and $ sign
x <- list(aardwork = 1:5)
x$a     ##gives the results like someone that has types aardwork
x[["a"]]  ##return a null because this looks for an exact name to avoid that we use pass an argument exact = FALSE
x[["a", exact = FALSE]]



##REMOVING MISSING VALUES
##Assuming
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)   #generates a logical vector bad
bad #but this is not what we are interested in
# to generate a vector of interest we shall take the opposite of bad
x[!bad]   # this gives us the vector of interest
y <- x[!bad]

##Assuming I have multile vectors and multiple objects and i want to take the subset of all the objects without missing values
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x,y)
good
x[good]
x1 <- x[good]
x1
y[good]
y1 <- y[good]
y1

# can also use complete.cases() to remove missing values from dataframes



###VECTORIZED OPERATIONS
## usually work with matrices 
#Many operations in R are vectorized making code more efficient, concise and easier to read
######Vectors
x <- 1:4
y <- 6:9
x + y
x > 2
x == 2
x * y
x / y
########Matrices
x <- matrix(1:4, 2, 2)
y <- matrix(rep(10, 4), 2, 2)         #note: rep means repeat
##element-wise multiplication
x *y
x / y
##true matrix multiplication
x %*% y
x + y

 



####WEEK 1 Assignment
#4
x <- 4
class(x)
#5
x <- c(4, "a", TRUE)
class(x)
#6
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)
#8
x <- list(2, "a", "b", TRUE)
x[[2]]
length(x[[2]])
#9
x <- 1:4 
y <- 2
x+y
#10
x <- c(17, 14, 4, 5, 13, 12, 10)
x[x>10]<-4
x

#11
# Using the dataset at "https://d396qusza40orc.cloudfront.net/rprog/data/quiz1_data.zip"
hw1_data <- read_csv("hw1_data.csv")
hw1_data
# rm(data)
colnames(hw1_data)
print(hw1_data)
print("Extract first two rows:")
x =  hw1_data[1:2,] #This code extracts the first two rowns of the dataset
x
x =  hw1_data[1:3,] # extracts the first three rowns of the dataset
x

# Counting the number of observations in R
n_row <- nrow(hw1_data) # creates an object that counts the number of observations
n_row # pringing the object to count the observations
nrow(hw1_data) # counts the number of observations without creating any object

# extracting the last two rows of a dataframe
hw1_data[152:153,] # exctracts that now we know the number of observations

# value of ozone in the 47th row
hw1_data[47, 1] # value of ozone in 47th row

#counting the number of missing observations in dataframe
sum(complete.cases(hw1_data$Ozone)) # calculates the number of complete observations
sum(!complete.cases(hw1_data$Ozone)) # returns the missing observations

#calculating the mean of ozone without including the missing observations
mean(hw1_data$Ozone, na.rm = TRUE) # calculates the mean

# Extract the subset of rows of the data frame where Ozone values are above 31 and 
#Temp values are above 90. What is the mean of Solar.R in this subset?
x <- subset(hw1_data, Ozone > 31&Temp > 90)
mean(x$Solar.R, na.rm = TRUE)

# mean of "Temp" when "Month" is equal to 6?
hw1data <- subset(hw1_data, Month==6)
nrow(hw1data)   # displays the number of observation
mean(hw1data$Temp) # this is the actual mean

# maximum ozone value in the month of May (i.e. Month is equal to 5)?
x <- subset(hw1_data, Month==5)
max(x$Ozone, na.rm = TRUE)

nrow(hw1_data)

#####EXPORTING FROM EPIDATA
#library(epxToR)
#z <- read.epx("SUB-STUDY  I- FortPortal.epx", use.epidata.labels=TRUE)
#DF <- as.data.frame(z)








#############   **WEEK 2**    #############
##  1*CONTROL STRUCTURES IN R*
#Allows control flow of R program. Common structures are;
    # if, else: testing condition
    # for: execute a loop a fixed number of times
    # while: execute a loop while a condition is true
    # repeat: execute an infinite loop
    # next: skip an iteration of a loop
    # return: exit a function

#**** IF-ELSE*******
#*this
#*
#*
#*
#*
#*
#*
#*
#*

