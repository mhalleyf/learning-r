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
l <- l[!is.na(l)] # remove NA values
l <- l[!(l %% 2 == 0)] # modulus for each value by 2, where position value is not 0, return this subset of values (odds). 
# IMPORTANT TO NOTE: performing a calculation on an R vector performs the action for each element of the vector. 


# ------------------- Which function ---------------------------------------------
z <- c(101:110) # create a list between 101 and 110
min(z) # find the minimum (101)
max(z) # find the maximum (110)
mean(z) # find the mean (sum of elements / length of vector)
median(z) # find the median
z <- z[-c(5,6)] # removes the 5th and 6th element with -c syntax

which(z > 105) # returns the places (emphasis) which are greater than 105, i.e. 6, 7, 8, 9 ,10
z[which(z > 105)] # returns the values (emphasis) which are greater than 105, i,e, 106, 107..., 110
i <- which(z > 107 | z < 104) # find the elements that are above 107 or below 104 and return boolean T/F values
z[i] # return the vector subset that meets the i conditional T/F statements. Vector returns TRUE values. 
z # Z vector is still maintained as subset conditional was stored in a new variable

mb_i <- microbenchmark({which(z > 107 | z < 104)}, times = 10) # which statements can be very fast for conditionals (8.837ms)

# challenge - which function to return values meeting multiple conditions
i <- which(z %% 2 == 0 | z %% 5 == 0) # return all even numbers and all multiples of 5 from the z vector
z[i] # As above, use boolean logic to return record which meet the TRUE condition
z[which(z %% 2 == 0 | z %% 5 == 0)] # Alternative method


# -------------------- Vectors continued (data types and transformation handling)--
vec1 <- 1:10 # numbers 1 to 10
vec2 <- letters[1:10] # first 10 letter of the alphabet
vec3 <- factor(1:10) # a factor from 1 to 10 with 10 levels

vec4 <- as.numeric (vec1) # converts integer class to numeric
vec5 <- as.character(vec1) # converts vec1 integer class to characters '1' to '10'

vec6 <- c(2, "d") # while first value is numeric, characters takes precedence in defining class(vec6)
vec7 <- c(2, FALSE) # first numeric value takes precedence in defining class(vec7). Bool is 0 or 1. 

# -------------------- Order of importance, 1) Character, 2) Numeric, 3) Logical --
vec8 <- as.numeric(vec3) # no problem converting factor to numeric
vec9 <- factor(round(runif(10,10,70))) 
vec10 <- as.numeric(vec9) # strangely, converting a factor like this returns the number of levels

nlevels(vec9) # vector 9 has 10 levels made up of random uniform numbers

vec11 <- as.numeric(as.character(vec9)) # characters converted back to numeric

vec11 == vec9 # this is TRUE as we went from factors to characters then to numeric
vec10 == vec9 # this is FALSE as we went from factors to numeric which retains numbers of levels

# challenge - create a factor vector based on random numbers. 
vec12 <- factor(round(runif(10,0,10)))
vec13 <- as.numeric(as.character(vec12)) # convert to characters first, then numeric.
vec13 == vec12 # as above, to modify a factor to a numeric and preserve values.

# ----- Introduction to Lists (vectors can only store one data type, lists can contain multiple data types)
# list are a useful mechanism to store more complex data types
vec14 <- 1:3 # numeric data from 1 to 3
vec15 <- letters[1:3] # the first 3 letters of the alphabet
vec16 <- factor(1:3) # a factor with 3 levels

lst1 <- list(vec14, vec15, vec16) # groups 3 vectors into a list object

lst1[1] # returns the full first elements or vec1
lst1[[1]] # returns all components of the first element or equivilent to vec1
vec14 # check that this is the same as above. 

# so how can we access the second element (a, b, c) and the third component or value? 
lst1[[2]][3] # returns the third value from the second element in a list or "c"
names(lst1) <- c("one", "two", "three")

lst1$two[3] # an alternative way to return "c" with the dollar sign ($) syntax

l <- unlist(lst1) # unlist flattens the list into a single vector but preserves the naming convention of each element
class(l) # characters takes precendence 

# challenge - create a list with 123 and abc and access c using dollar sign notation
vec17 <- 1:3
vec18 <- letters[1:3]
lst2 <- list(vec17, vec18) # common error here, make sure to use the list function, not 'c()'
names(lst2) <- c("one", "two")
lst2$two[3] 

# -------------------- Set operations across vectors (overlaps, Venn diagrams etc.) --------------------
a <- c(1:6)
b <- c(5:10)

1 %in% a # %in% returns boolean values TRUE and FALSE based on if the value 1 is in vector a
10 %in% a # checks if value 10 is in vector a and returns FALSE as it is not in this case
a %in% b # returns a vector of boolean TRUE/FALSE values. Where a is in b it will return TRUE, where a is NOT in b return FALSE
b %in% a # where b is in a it will return TRUE, where b is NOT in a return FALSE. Values 1 and 2 or 5 and 6 are in both a and b. 
is.element(a, b) # as above, just a different approach. 
union(a, b) # returns the combined vectors values in a and b without repeating values
intersect(a, b) # returns the intersection of vectors a and b or 5 and 6 (overlap in venn diagram)
setdiff(a, b) # returns the values unique to a but not contained in b
setdiff(b, a) # returns the values unique to b but not contained in a
unique(c(a,b)) # returns the values likeunion but works differently. Unknown why? 

# challenge - get the values unique to each vector and store them in a new vector
a <- 11:15
b <- 13:17

# approach 1, take set diff and join using c() function in new vector
a1 <- setdiff(a, b)
b1 <- setdiff(b, a)
c <- c(a1, b1) 

# approach 2, use union, intersect and setdiff
u <- union(a, b) # Join the two vectors in u
i <- intersect(a, b) # Take the intersect of a and b
c <- setdiff(u, i) # Return the values that belong uniquely to a and b by taking our the intersect or overlapping values


# random sampling - randomly draw items from a list (useful for statistics). With and without replacement. 
a <- 1:60
sample(a) # sample of length of vector, in this case 60 samples
sample(a, replace=T) # this is the same as placing the ball back in and drawing again or replacing
sample(a, 10, replace=T) # this specifies the number of samples from the vector and the replacement property

b <- sample(a, 10, replace=T) # sample 10 balls from the a bucket with replacement and store in b
sort(b, decreasing = T) # sort largest to smallest
rev(sort(b)) # as above, different method

order(b) # returns the places instead of the values

a <- c(1:round(runif(1, min=100, max=150))) # generate a list from 1 to min 100 or max 150 using the runif function

# challange 9 - from 'a' create a 20% sample with replacement then sort in decending order. 
s <- sample(a, length(a)*0.2, replace=T) # sample a for 20% of the count of elements with replacement
sort(s, decreasing=T) # sort decreasing

length(s)/length(a) # checks the sample size is the specified 20%

# -------------------IF statement to check conditions - 
# i.e. variable exceeds a certain limit, else we take an alternative action.
age <- 13

# if syntax in R - slightly complicated and confusing if coming from C++
if(age >= 18){
  print("Can watch the movie")
} else {
  print("Cannot watch the movie")
}

# worth adding that this can be slow (248ms)
age_mb <- microbenchmark({
  if(age >= 18){
    print("Can watch the movie")
  } else {
    print("Cannot watch the movie")
  }
}, times = 10)

group_age <- round(runif(30,10,40)) #REMINDER on runif - generates a random uniform sample of 30 values from 10 to 40
group_desc <- list(min(group_age), max(group_age), mean(group_age)) # check the min, max and mean (describe data)
names(group_desc) <- c("min", "max", "mean") # rename the variables in the group_desc list type
# what we've done here is generate a group size of 30 people with ages from 10 to 40 randomly from a uniform distribution
# now we can check who can watch the movie (if they're over 18) and who can't

any(group_age < 18) # returns a single TRUE / FALSE if condition is met
if(any(group_age < 18)){
  print("Cannot watch the movie")
} else {
  print("Can watch the movie")
}

# IMPORTANT - this if statement returns a warning that only the 1st element of the group will be used. 
# a FOR statement loop is required or the IFELSE statement
if(group_age >= 18){
  print("Can watch the movie")
} else {
  print("Cannot watch the movie")
} # all this tell me is that the first element of the group_age is >= 18


# IFELSE can handle vectors i.e. the example above repeated in this functions
age_check <- ifelse(group_age >=18, "Can watch the movie", "Cannot watch the movie") # Returns a boolean for each element

# ------------------- Introduction to loops (for each element in a vector) - slow --------------------
loop <- 1:15
total <- 1

# for loop basics - print a loop of 1 to loop length (15 as defined above)
for(i in loop){
  print(i)
} # prints i as the nth iteration of the loop

for(i in loop){
  total <- total * i
  print(total)
}

# use logic in loops - for 1 to 15, if i modulus 2 == 0 (i.e. for even #'s) add total + 1 to total (note total grows with length of loop)
# returns 2, 4, 6, 8, 10, 12, 14
for(i in loop){
  if(i %% 2 == 0){
    print(i)
  }
}

# as total = 1, each loop adds 1 to the total and there are 7 even elements in the range 1 to 15 resulting in 8
for(i in loop){
  if(i %% 2 == 0){
    total <- total + 1
  }
}


# alternative approach - more efficient only runs 7 iterations
for(i in seq(2, 15, by=2)){
  total <- total + 1
}

# break statement if condition is met
for(i in seq(2, 15, by=2)){
  total <- total + 1
  if(i == 8){
    break
  }
}

# next statement - note positioning of total statement is different than above
for(i in seq(2, 15, by=2)){
  if(i == 8){
    next
  }
  total <- total + 1
}

# challenge - print the 26 letters of the alphabet
for(i in letters){
  print(i)
}

# -------------------- Introduction to dataframes -----------------------------------------
# first create a bunch of vectors
a <- c(1, 2, 3, 4, NA)
b <- c(6, 7, 8, NA, 10)
c <- c(11, 12, NA, 14, 15)
d <- c(16, NA, 18, 19, 20)
e <- c(21, 22, 23, 24, 25)

df <- data.frame(a,b,c,d,e)
class(df) # returns the class of the object, in this case a Data Frame
nrow(df) # returns the number of rows
ncol(df) # returns the number of columns
stack(df) # stacks all variables on top of each other in a row
rbind(df, df) # adds the first df to the second df
cbind(df, df) # adds the variables of the first and second df
head(df, 3) # returns number of rows you wish to see across all variables (columns)
tail(df) # returns the last few rows
str(df) # returns the description of the data frame and the class of each variable. Dollar sign notation available here. 
summary(df) # returns the descriptive statistics of each column or variable (mean, median, 1st and 2nd quartile etc.)

names(df) <- # returns names of columns
  colnames(df) <- c("a1", "b1", "c1","d1", "e1") # rename columns
rownames(df) # returns names of rows or the index column if present
t <- t(df) # transpose data frame
class(t) # when transposing, data frame becomes a matrix

# remove rows which contain missing values
na.omit(df) # Omits all rows with NA records and returns only the row with no NA values across all variables
df[4, ] # Returns the 4th row and all columns. You can specify the column by placing a 1 or the column name after the variable
df[4, "c1"] # Returns 14 or the c1 variables 4th row value
df[c(4, 5), c(2, 3, 4)] # Returns b1, c1 and d1 columns and the 4th and 5th rows
df$a1 # Returns all elements in column a1

# which function in df 
which(df$e1 >22) # Returns the indicies of the rows that meet the criteria
df[which(df$e1 > 22), ] # VERY USEFUL - Returns the rows where the values in e1 are > 22 including the other columns
df[, which (names(df) %in% c("c1", "d1"))] # Returns all rows for the columns named c1 and d1
df[, c(3, 4)] # Same as above, returns the 3rd and 4th column
which(df[, 5] > 22) # Equivilent to line 399 where e1 rows are > 22, returning all columns
which(df[, 5] > 22) == which(df$e1 >22)

# orders in df
df[order(-df$e1), ] # Sorts the df by reverse order or column e1 or
df[rev(order(df$e1)), ] # Alternative method to sort df in reverse order by column e1

# attach and matrix
# attach(df) # attaches columns to global memory (careful, overides previous variables)
m <- matrix(1:100, nrow=10)

# check size of data frame vs matrix
object.size(m)
object.size(df)

# ggplot2 introduction
library(ggplot2) # loads library if installed as this is a non-base R package
p <- ggplot(diamonds)
p <- ggplot(diamonds, aes(x=carat)) # draws in x axis based on dimension of carat & stores in p.
p <- ggplot(diamonds, aes(x=carat, y=price)) # draws in y axis based on dimension of price & stores in p.
p <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) # use a variable to present color categories inside AES
p <- ggplot(diamonds, aes(x=carat), color="steelblue") # where no variable for color exists, specify outside AES

# The layers of ggplot
p <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) +
  geom_point() # adds geometric objects to cartisian plane

head(diamonds) # explore data set first 6 rows across all variables

p <- ggplot(diamonds, aes(x=carat, y = price, color=cut, shape=color)) +
  geom_point() # adds shape of points based on color of the diamond

# the labels of ggplot - axis.text.x or y and element_text access the text allowing for size argument to be passed
p <- ggplot(diamonds, aes(x=carat, y = price, color=cut)) +
  geom_point() + 
  labs(title="Scatterplot", x="Carat", y="Price") + 
  theme(plot.title=element_text(size=15, face="bold", hjust=0.5),
    axis.text.x=element_text(size=5),
    axis.text.y=element_text(size=5),
    axis.title.x=element_text(size=10),
    axis.title.y=element_text(size=10)) +
  scale_color_discrete(name="Cut of diamonds")

# facet wraps allow you to see multiple plots which is good for categorical elements such as Clarity
p + facet_wrap( ~ cut, ncol=3) # Columns defined by cut
cc <- p + facet_wrap(color ~ cut, scales="free") # Columns defined by cut, scales allowed to float (not best practice)
cc <- p + facet_grid(color ~ cut) # Simplifies viewing when color is involved

ggsave("diamond-values.png", plot=cc) # Saves object cc as png in working directory

library(ggfortify) # ggfortify is ggplot2s engine to autoplot time-series without having to convert objects into a data frame
library(dslabs) # non 'toy' datasets for more practical learning
library(tidyverse) # TBC 
library(ggthemes) # TBC
library(ggrepel) # TBC

data(package="dslabs") # access the R data sets documentation to explore dataset details

list.files(system.file("script", package = "dslabs")) # returns .R files for datasets

# some examples of different types of plots using ggplot
data("heights") # load the data
head(heights) # explore the data
ht <- heights # replicate the data frame into a newly named data frame call ht
names(ht) <- c("Sex", "Height(inch)") # rename the column values

ht$heightcm <- ht[,2] * 2.54 
ht$heightft <- ht[,2] / 12
names(ht) <- c("sex", "htinch", "htcm", "htft") # rename the column values

# plots using tidyverse pipe operator and ggplot (a different approach from base R)
ds_theme_set()
h <- ht %>% 
  ggplot(aes(htcm, fill=sex)) +
  geom_density(alpha=0.2) # we can pass the alpha or transparancy value to the geometry function



