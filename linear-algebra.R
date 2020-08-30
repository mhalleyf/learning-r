# --------------------- Linear algebra in R --------------------------------------------------------
X <- matrix(1:12, 4, 3) # Generates a matrix with values from 1 to 12 of 4 rows and 3 columns
a <- 2
print(a*X) # Each element of a matrix X is multiplied by a or notation  as aX = {ax1,... axN}
t(X) # Use function t to transpose rows into columns

# Matrix multiplication
X <- matrix(c(1,3,2,1,-2,1,1,1,-1),3,3) # Creation of a 3 x 3 matrix with 
beta <- c(3,2,1)
X%*%beta # is not (6 2 1)
diag(3) # Generates the identify matrix
# X^-1 X = I states that if I take the INVERSE of some matrices and multiply it by the matrix X, I will get the identity matrix

# SOLVE FOR a, b and c in the below system of equation
# a + b + c = 6
# 3a - 2b + c = 2
# 2a + b - c = 1

X <- matrix(c(1,3,2,1,-2,1,1,1,-1),3,3) # Creation of a 3 x 3 matrix with 
y <- matrix(c(6,2,1),3,1) # The 6, 2, 1 answers from original equations are placed in a 3 x 1 matrix
solve(X,y)


# -------------------- How linear algebra works for statistics - i.e. simple linear regression ----
# y = numeric dependant variable
# x = independant variable

x <- c(17, 13, 12, 15, 16, 14, 16, 16, 18, 19) # X independent variable
y <- c(94, 73, 59, 80, 93, 85, 66, 79, 77, 91) # Y dependant variable
df <- data.frame(x, y) # Combine variables h and w in a data frame called df
plot(df) # If only two dimension, explore data visually. 

# Linear regression function is stated as y = a + bx
# Slope (b) of regression line is b = r * (sy / sx) where s is the standard deviation of y and x
# Y-intercept (a) of regression line is a = yhat - b * xhat

xhat <- mean(x) # Calculate the mean of x and store in new variable
yhat <- mean(y) # Calculate the mean of y and store in new variable

df$xmxhat <- df$x - xhat # Take each x value and subtract the mean of all x values
df$ymyhat <- df$y - yhat # Take each y value and subtract the mean of all y values
df$xtyhat <- df$xmxhat * df$ymyhat # Take x minus x hat * y minus y hat
df$xmxhatsq <- df$xmxhat^2 # Square x minus x hat
df$ymyhatsq <- df$ymyhat^2 # Square y minus y hat

# Find the totals of required columns, i.e. xmxhatsq
xtyhatttl <- sum(df$xtyhat)
xsqttl <- sum(df$xmxhatsq)
ysqttl <- sum(df$ymyhatsq)

# Pearsons R formula is the sum of x and y variance from mean of x and y or xtyhatttl div by var of x and y sq
pr <- xtyhatttl / (sqrt(xsqttl * ysqttl))

# Standard deviation calcuation is sy = sqrt(sum(y-yhat)^2) / (n - 1)
sy <- sqrt(ysqttl / (length(y) - 1)) # The standard deviation is the 'average' error (+/-)
sx <- sqrt(xsqttl / (length(x) - 1)) # As the total difference from mean is squared  making all pos / number of observations - 1


# Calculate B or the slope of the line b = r * (sy / sx)
b <- pr * (sy / sx)

# Calculate A or the intercept of the line a = yhat - (b * xhat)
a <- yhat - (b * xhat)

# Use the SLR formula as a predictor of y = a + bx 
df$ytest <- a  + (b * x)

lm(y ~ x)