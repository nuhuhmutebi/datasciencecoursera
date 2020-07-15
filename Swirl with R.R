########A brief introduction to SWIRL
#1. install.packages("swirl")
library(swirl)
#3. install_from_swirl("R Programming")
#4. swirl()

##BASIC BUILDING BLOCKS OF R PROGRAMMING
getwd() # checks the working directory
ls() # lists all objects in the local workspace
list.files() # lists all files in the working directory
dir() # lists all files in the working directory
?list.files # checks for help about list.files function
old.dir <- getwd() # assigns old.var as a value to the working directory (WD)
dir.create("testdir") # creates another directory testdir within the current WD
setwd("testdir") # sets the WD to "testdir"
file.create("mytest.R") # creates a file "mytest.R" within the current WD
file.exists("mytest.R") # checks if "mytest.R" does exist in the working directory and returns a TRUE/FALSE
file.info("mytest.R") # access information about the file
# to grab specific items can use $ sign to select a specific item say
file.info("mytest.R")$mode #this selects the mode
file.info("mytest.R")$size # selects the size
# etc.
#Renaming a file in R
file.rename(from = "mytest.R", to = "mytest2.R") # renames from the fist name to the last name
file.remove("mytest.R") # deletes mytest.R file
#Making another file copy from an exiting copy
file.copy(from = "mytest2.R", to = "mytest3.R") # creates "mytest3.R" file from "mytest2.R" file
##Providing a relative path to the file
file.path("mytest3.R") # this provides a relative path to "mytest3.R" file
###construct file and directory paths that are independent of the operating system your R code is | running on.
file.path("folder1", "folder2")
###Create a directory in the current working directory called "testdir2" and a subdirectory for it called "testdir3", all in
# one command by using dir.create() and file.path().
dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)
##Setting back to the original directory
setwd(old.dir)

# to clear a list of variables within the workspace
ls() # displays a list of variables within the workspace
rm(list=ls()) # clears the list of variables within the workspace


##SEQUENCIES OF NUMBERS
#simplest way to create a sequence of numbers is using the ':' operator
1:20 # creates a sequence of numbers from 1 to 20
seq(1, 20) # like in line 46
pi:10 # starts with pi(3.142..) and increasing in the increments of 1. Upper limit of 10 not reached because sequence would be greater than 10
seq(0, 10, by=0.5) # gives a sequence between 0 and 10 incremented by 0.5
my_seq <- seq(5, 10, length=30) # do not care about the increment, just need a sequence of 30  numbers between 5 and 10 
length(my_seq) # displays the length of the object
##can use the length of my_seq to generate other sequencies
1:length(my_seq) # between 1 and length of my_seq
seq(along.with = my_seq) # same output as line 53
seq_along(my_seq) # same as 53-54 output
##NOTE: there are several approaches to solving the same problem in R. simple approaches that involve less typing are best
#also important for your code to be readable.
# in case there is a built in function, it is highly recommended for the purpose
rep(0, times = 40) # replicates 0 forty times
rep(c(0, 1, 2), times = 10) # creates 10 repetitions of vector (0,1,2)
rep(c(0, 1, 2), each = 10) # creates a vector with 10 zeros, 10 ones and 10 twos


####VECTOR
#simplest and most common data structure in R
# can be atomic vectors-only one data type or lists-multiple data types
num_vect <- c(0.5, 55, -10, 6)
tf <- num_vect<1 # creates vector if num_vect is less than 1. It is simply a vector of logical values
# num_vect<1 is a condition and tells us whether each corresponding element od our vector satisfies this condition
num_vect >= 6
###########The `<` and `>=` symbols in these examples are called 'logical operators'. Other logical operators include 
## `>`, `<=`, `==`|' for exact equality, and `!=` for inequality.
# If we have two logical expressions, A and B, we can ask whether at least one is TRUE with A | B (logical 'or' a.k.a.'union')
paste(my_char, collapse = " ") # joins elements of my_cha together into one continuous character string. there should be space between the double quotes
my_name <- c(my_char, "Nuhuh Mutebi") #adding my name
paste(my_name, collapse = " ") # try it out and see for yourself
###we can join two character vectors
paste("Hello", "world!", sep = " ")
####join two vectors each of length 3 using the paste()
paste(1:3,  c("X", "Y", "Z"), sep = "")


#############MISSING VALUES
#NA representing not available or missing values
x <- c(44, NA, 5, NA)
x *3
#Notice that the elements of the resulting vector that correspond with the NA values in x are also NA.
#To make things a little more interesting, lets create a vector containing 1000 draws from a standard normal distribution
y <- rnorm(1000)
#Next, let's create a vector containing 1000 NAs with
z <- rep(NA, 1000)
#Finally, let's select 100 elements at random from these 2000 values (combining y and z) such that we don't know how many NAs
#we'll wind up with or what positions they'll occupy in our final vector
my_data <- sample(c(y, z), 100)
# Let's first ask the question of where our NAs are located in our data. The is.na() function tells us whether each element of
#a vector is NA. Call is.na() on my_data and assign the result to my_na.
is.na(my_data)
my_na <- is.na(my_data)
my_na
#####Computing the total number of NAs in our data
##The trick is to recognize that underneath the surface, R represents TRUE as the number 1 and FALSE as the number 0.
#Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.
sum(my_na)

#######Now that we've got NAs down pat, let's look at a second type of missing value -- NaN, which stands for 'not a number'. To
#generate NaN, try dividing (using a forward slash) 0 by 0 now.




#######SUBSETTING A VECTOR
##In this lesson, we'll see how to extract elements from a vector based on some conditions that we specify.
#The way you tell R that you want to select some particular elements (i.e. a 'subset') from a vector is by placing an 'index
#vector' in square brackets immediately following the name of the vector.
my_data[1:10] # extracts the first 10 elements of my_data
######Indexing logical vectors
my_data[is.na(my_data)]
#Recall that `!` gives us the negation of a logical expression
###want to create a vector called y that contains all of the non-NA values from my_data, we can use y <- my_data[!is.na(my_data)]. Give it a try.
y <- my_data[!is.na(my_data)]
y #prints y where missing values are isolated
y[y > 0] # gives us all the positive elements of y
#######Combining our knowledge of logical operators with our new knowledge of subsetting, we could do this -- x[!is.na(x) & x > 0].
my_data[!is.na(my_data) & my_data > 0] # in case we request for values of my_data that are both non-missing and greater than 0

####NOTE: Many programming languages use what's called 'zero-based indexing', which means that the first element of a vector is
#considered element 0. R uses 'one-based indexing', which (you guessed it!) means the first element of a vector is considered
#element 1.
my_data[c(3, 5, 7)] # subsets the 3rd, 5th, and 7th elements of my_data
##What if we are interested in all elements save 2 and 10
#Whereas my_data[c(2, 10)] gives us ONLY the 2nd and 10th elements of my_data, 
my_data[c(-2, -10)] #gives us all elements of my_data EXCEPT for the 2nd and 10 elements.
###A shorthand way of specifying multiple negative numbers is to put the negative sign out in front of the vector of positive
my_data[-c(2, 10)]

###So far, we've covered three types of index vectors -- logical, positive integer, and negative integer. The only remaining
##type requires us to introduce the concept of 'named' elements.
#Create a numeric vector with three named elements using 
vect <- c(foo = 11, bar = 2, norf = NA).
vect # prints elements of vect
names(vect) # prints by names by passing vect
#####Alternatively, we can create an unnamed vector vect2 with c(11, 2, NA). Do that now.
##Then, we can add the `names` attribute to vect2 after the fact with 
names(vect2) <- c("foo", "bar", "norf").
##Now, let's check that vect and vect2 are the same by passing them as arguments to the identical() function.
identical(vect, vect2)
vect["bar"] #gives the second element of vect





######MATRICES AND DATAFRAMES
#The main difference, as you'll see, is that matrices can only contain a single class of data, while data frames can consist
#of many different classes of data.
my_vector <- 1:20
my_vector # prints the contents
dim(my_vector) # returns "NULL" since it is a vector
length(my_vector) #
dim(my_vector) <- c(4, 5) # looks strange but assigns a 'dim' attribute for an R object
dim(my_vector) # print to confirm we've set the 'dim' attribute correctly
attributes(my_vector) # same result as the above
##But, wait! That doesn't sound like a vector any more. Well, it's not. Now it's a matrix. 
my_vector # viewing contents of my vector
class(my_vector) # 
##assigning my_vector a new name
my_matrix <- my_vector
##creating a matrix
my_matrix2 <- matrix(1:20, nrow = 4, ncol = 5)

##Now, imagine that the numbers in our table represent some measurements from a clinical experiment, where each row represents
#one patient and each column represents one variable for which measurements were taken.
#We may want to label the rows, so that we know which numbers belong to each patient in the experiment. One way to do this is
#to add a column to the matrix, which contains the names of all four people.
#Let's start by creating a character vector containing the names of our patients -- Bill, Gina, Kelly, and Sean. Remember
patients <- c("Bill", "Gina", "Kelly", "Sean")
#Now we'll use the cbind() function to 'combine columns'.
cbind(patients, my_matrix)
#Something is fishy about our result! It appears that combining the character vector with our matrix of numbers caused
#everything to be enclosed in double quotes. This means we're left with a matrix of character strings, which is no good.
##NOTE: Remember that matrices contain only one data class as earlier said and when we tried to combine a character vector 
#with numeric matrix, R was forced to 'coerce' the numbers to characters. This is called 'implicit coercion', because we didn't ask for it.

###This can e achieved if we converted our matrix into a data frame using
my_data <- data.frame(patients, my_matrix)
my_data
#Behind the scenes, the data.frame() function takes any number of arguments and returns a single object of class `data.frame`
#that is composed of the original objects.
class(my_data) # check out for the class
##It's also possible to assign names to the individual rows and columns of a data frame, which presents another possible way
#of determining which row of values in our table belongs to each patient.
#Since we have six columns (including patient names), we'll need to first create a vector containing one element for each
#column. Create a character vector called cnames that contains the following values (in order) -- "patient", "age", "weight",
#"bp", "rating", "test".
cnames <- c("patient", "age", "weight", "bp", "rating", "test")
###  Now, use the colnames() function to set the `colnames` attribute for our data frame.
colnames(my_data) <- cnames
my_data






