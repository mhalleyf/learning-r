Logistic Regression
================
M. Halley-Frame

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Including Code

You can include R code in the document as follows:

``` r
# Store location of dataset into a variable called url
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"

# Extract and store data using read.csv into a variable called data
data <- read.csv(url, header=FALSE)

# Preview the first six rows of the dataset
head(data)
```

    ##   V1 V2 V3  V4  V5 V6 V7  V8 V9 V10 V11 V12 V13 V14
    ## 1 63  1  1 145 233  1  2 150  0 2.3   3 0.0 6.0   0
    ## 2 67  1  4 160 286  0  2 108  1 1.5   2 3.0 3.0   2
    ## 3 67  1  4 120 229  0  2 129  1 2.6   2 2.0 7.0   1
    ## 4 37  1  3 130 250  0  0 187  0 3.5   3 0.0 3.0   0
    ## 5 41  0  2 130 204  0  2 172  0 1.4   1 0.0 3.0   0
    ## 6 56  1  2 120 236  0  0 178  0 0.8   1 0.0 3.0   0

``` r
# Rename columns according to the data dictionary at the url source
colnames(data) <- c("age", "sex", "cp", "trestbps", "chol",
  "fbs", "restecg", "thalach", "exang", "oldpeak", "slope", "ca", "thal", "hd")

# Here we review the structure of the data and assess what needs to be cleaned up to the correct data type
str(data)
```

    ## 'data.frame':    303 obs. of  14 variables:
    ##  $ age     : num  63 67 67 37 41 56 62 57 63 53 ...
    ##  $ sex     : num  1 1 1 1 0 1 0 0 1 1 ...
    ##  $ cp      : num  1 4 4 3 2 2 4 4 4 4 ...
    ##  $ trestbps: num  145 160 120 130 130 120 140 120 130 140 ...
    ##  $ chol    : num  233 286 229 250 204 236 268 354 254 203 ...
    ##  $ fbs     : num  1 0 0 0 0 0 0 0 0 1 ...
    ##  $ restecg : num  2 2 2 0 2 0 2 0 2 2 ...
    ##  $ thalach : num  150 108 129 187 172 178 160 163 147 155 ...
    ##  $ exang   : num  0 1 1 0 0 0 0 1 0 1 ...
    ##  $ oldpeak : num  2.3 1.5 2.6 3.5 1.4 0.8 3.6 0.6 1.4 3.1 ...
    ##  $ slope   : num  3 2 2 3 1 1 3 1 2 3 ...
    ##  $ ca      : Factor w/ 5 levels "?","0.0","1.0",..: 2 5 4 2 2 2 4 2 3 2 ...
    ##  $ thal    : Factor w/ 4 levels "?","3.0","6.0",..: 3 2 4 2 2 2 2 2 4 4 ...
    ##  $ hd      : int  0 2 1 0 0 0 3 0 2 1 ...

``` r
# Remove 0 and 1 numerics and replace with M/F then convert to a factor
data[data == "?"] <- NA
data[data$sex == 0,]$sex <- "F"
data[data$sex == 1,]$sex <- "M"
data$sex <- as.factor(data$sex)

# Convert all required variables into their factor requirement
data$cp <- as.factor(data$cp)
data$fbs <- as.factor(data$fbs)
data$restecg <- as.factor(data$restecg)
data$exang <- as.factor(data$exang)
data$slope <- as.factor(data$slope)

# Convert columns with missing data or "?" that we replaced with NA to ints first then factors
data$ca <- as.integer(data$ca)
data$ca <- as.factor(data$ca)

data$thal <- as.integer(data$thal)
data$thal <- as.factor(data$thal)

# Here we perform a test on the hd variable for 0 and if true, return healthy, else unhealthy
data$hd <- ifelse(test=data$hd == 0, yes="Healthy", no="Unhealthy")
data$hd <- as.factor(data$hd)

# Confirm all changes have taken effect on the dataframe
str(data)
```

    ## 'data.frame':    303 obs. of  14 variables:
    ##  $ age     : num  63 67 67 37 41 56 62 57 63 53 ...
    ##  $ sex     : Factor w/ 2 levels "F","M": 2 2 2 2 1 2 1 1 2 2 ...
    ##  $ cp      : Factor w/ 4 levels "1","2","3","4": 1 4 4 3 2 2 4 4 4 4 ...
    ##  $ trestbps: num  145 160 120 130 130 120 140 120 130 140 ...
    ##  $ chol    : num  233 286 229 250 204 236 268 354 254 203 ...
    ##  $ fbs     : Factor w/ 2 levels "0","1": 2 1 1 1 1 1 1 1 1 2 ...
    ##  $ restecg : Factor w/ 3 levels "0","1","2": 3 3 3 1 3 1 3 1 3 3 ...
    ##  $ thalach : num  150 108 129 187 172 178 160 163 147 155 ...
    ##  $ exang   : Factor w/ 2 levels "0","1": 1 2 2 1 1 1 1 2 1 2 ...
    ##  $ oldpeak : num  2.3 1.5 2.6 3.5 1.4 0.8 3.6 0.6 1.4 3.1 ...
    ##  $ slope   : Factor w/ 3 levels "1","2","3": 3 2 2 3 1 1 3 1 2 3 ...
    ##  $ ca      : Factor w/ 4 levels "2","3","4","5": 1 4 3 1 1 1 3 1 2 1 ...
    ##  $ thal    : Factor w/ 3 levels "2","3","4": 2 1 3 1 1 1 1 1 3 3 ...
    ##  $ hd      : Factor w/ 2 levels "Healthy","Unhealthy": 1 2 2 1 1 1 2 1 2 2 ...

## Including Plots

You can also embed plots, for example:

![](logistic-regression_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
