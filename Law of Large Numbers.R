# Central Limit Theorem

# Law of large number != Central limit theorem
nSim <- 10000
n <- 100

meanArray <- array(0, dim=nSim)
for(i in 1:nSim) {
  x <- rexp(n)
  meanArray[i] <- mean(x)
}

hist(meanArray)
abline(v = mean(meanArray), 
  lty = "dashed", lwd = 4, col = "blue")

qqnorm(meanArray)
qqline(meanArray)

# shapiro.test
# ad.test

# Import the data
file_path <- "http://www.sthda.com/sthda/RDoc/data/housetasks.txt"
housetasks <- read.delim(file_path, row.names = 1)
head(housetasks)
summary(housetasks)

chisq <- chisq.test(housetasks)

chisq$observed

# Expected counts
round(chisq$expected,2)

library(corrplot)
corrplot(chisq$residuals, is.cor = FALSE)

  
  
