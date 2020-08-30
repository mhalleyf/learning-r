# Learn R starts here
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
rm(list=ls()) # Remove all elements from the R environment


# -------------------- Ways to generate data within vectors in R ------------------
v <- 1:10 # generates a vector from 1 to 10 with 10 elements
v <- 9:0  # generates a vector from 9 to 0 with 10 elements
s <- seq(0, 20, by = 2) # generates a vector from 0 to 20 (inclusive) counting by 2
s <- seq(1, 20, by = 2)   # generates a vector from 1 to 19 (inclusive) counting by 2 therefore only odd numbers
s <- seq(0, 50, by = pi)  # generates a vector from 0 to 50 (inclusive) counting by pi
sv <- c(v, s)             # adds v from 1:10 followed by seq s counting by pi
r <- rep(1:2, 10)         # repeats 1 and 2, 10 times
r <- rep(c(1,2,3), each=3) # repeats 1, 2, 3 three times each
r <- rep(1:4, 1:4)             # repeats 1 once, 2 twice, 3 trice, 4 four times

# challenge - create a vector 1,1,1,2,2,3,4,4,4,4 using functions that is the fastest for base R code
v1 <- microbenchmark({rep(1:4, times = c(3, 2, 1, 4))}, times = 10) # best single function approach (2.478ms)
v2 <- microbenchmark({c(rep(1:3, 3:1), rep(4, times=4))}, times = 10) # best two function approach (3.356ms)
v3 <- rep(seq(1,10, by=2), times=3) # repeat 1 to 10 by twos, three times


# -------------------- Random numbers --------------------------------------------
set.seed(123) # allows replication of same randomly generated values
rand_uniform <- runif(10) # random uniform function returning 10 random values
rand_uniform <- runif(10, min=1, max=100) # return random uniform numbers between a specified range
rand_poisson <- rpois(n = 100, lambda = 3) # returns a random poisson distrubution
rand_norm <- rnorm(100, 0, 1) # returns a random normal distribution
hist(rand_norm) # check visually by passing to the hist() plot function in base R
hist(rand_poisson) # check visually by passing to the hist() plot function in base R
rand_uniform <- round(runif(100, min=10, max=1000)) # Return random values between 10 and 1000 rounded (expected mean of ~500)
hist(rand_uniform, col="blue")  # generates a histogram/bar graph of randomly generated values
mean(rand_uniform) # returns the mean
alphabet <- letters[round(runif(10, min=1, max=26))] # calls the letters function which contains the alphbet (random 10 letters)


# -------------------- Removing values and cleaning data -------------------------
l <- rep(seq(1, 5), times=2) # generate a list between 1 and 5 twice creating 10 objects
l[10] <- NA # Replace the 10th element with NA

# Search lists for missing values 
is.na(l) # bool check returns TRUE if NA
!is.na(l) # bool check returns FALSE if NA
l[is.na(l)] # returns the value if NA - useless but... 
l[!is.na(l)] # returns the value if not NA - VERY USEFUL
l <- na.omit(l) # omits the na value from the vector l and passes subset to l (overiding original var)
l == 1 # conditional check of values that equal 1 without overriding the variable.
l[l == 1] # returns all values == to 1 in vector, however be careful NA is included 
l[!l == 1] # returns all values != to 1 in vector, however be careful NA is also included 
l[l %in% c(1,3)] # returns all values == to 1 and 3 but not NAs


