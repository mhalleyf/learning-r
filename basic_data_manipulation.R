# -------------------- Learn R starts here -----------------------------------------

# -------------------- Basic math functions ----------------------------------------
add <- 2 + 2 # adds two numeric values and stores in variable add
equations <- 1 + 2 / 3 * 4 # computes equation (PEMDAS) and stores answer to equation 
root <- sqrt(25) # takes the square root of numeric value and stores in variable root
exponents <- 3^3 # cubes numeric value 3 and stores in variable exponents
pie <- pi # pi is a value in base R
rnd <- round(pi) # the round function rounds to the nearest whole number, takes digits = n argument
flr <- floor(pi) # rounds down to the nearst whole number
cei <- ceiling(pi) # rounds up to the nearest whole number
quot <- 25 %% 4 # divides numeric value by another numeric value but returns the remainder
evens <- 2 %% 2 # quotients are helpful to determine evens (returns 0)
odds <- 3 %% 2 # quotients are helpful to determine odds (returns 1)

# -------------------- Data type handling in R ------------------------------------
a <- 1
b <- as.integer(a) # as.datatype() function tells R what to store in the variable b
c <- "abc"
d <- as.factor(c(-1,0,1))
e <- TRUE

class(a) # returns the data type of a (numeric)
class(b) # returns the data type of b (integer)
class(c) # returns the data type of c (character)
class(d) # returns the data type of d (factor)
nlevels(d) # nlevels returns the number of levels in the factor
levels(d) # returns the specific values in the factor
class(e) # returns the data type of e (logical) 

ls() # lists variables currently in the R environments memory

# -------------------- Vectors ----------------------------------------------------
# Can only store values of the same datatype 
ht <- c(165, 170, 175, 180, 185) # the c() function concatenates values
length(ht) # returns the length or number of values in ht
class(ht) # returns the data type of ht which is numeric
ht[3] # syntax to access the 3rd element of the vector or 175
ht[c(3,5)] # syntax to access the 3rd and 5th element of the vector

# Access the 1st and nth element of a vector
wt <- c(50, 51, 54, 57, 60, 66, 68, 68, 70, 72, 75, 76, 78, 80, 83, 84)
length(wt) # returns the length of the vector or a count of elements
wt[c(1, length(wt))] # returns the 1st and nth element of the vector
wt[1:length(wt)] # returns the 1st to the nth element (all elements) of the vector

# -------------------- Set WD and perform basic file management -------------------
wd <- setwd("~/R Projects/learning-r") # set the working directory
dir(wd)
list.files(wd) # list files in working directory
file.create("myFile.txt") # create a file called myFile.txt
fpath <-file.path("~/R Projects/learning-r", "myFile.txt") # assign a path and file name to fpath variable
file.create(fpath) # an alternative method to the above example creating myFile.txt
save.image("learning-r.RData") # Save workspace so you can take off from where you left off
load("learning-r.RData") # Load a pre-saved workspace avoiding the need to re-run code
rm(list=ls()) # Remove workspace





