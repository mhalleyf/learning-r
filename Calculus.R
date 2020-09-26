require(mosaic)

# Functions
funC <- 3*x - 2 ~ x
linFunC <- m*x + b ~ x

# Mosaic PlotFunctions Examples
plotFun(funC, x.lim=range(0,10))
plotFun(linFunC, x.lim=range(0,10), m=3,b=-2)
plotFun(A*x^2 ~ x, x.lim=range(-2,3), A=10)
plotFun(A*x^2 ~ x, col="red", A=5)
plotFun(cos(t) ~ t, t.lim=range(0,4*pi))

# Solving
plotFun(sin(x^2)*cos(sqrt(x^4+3)-x^2)-x+1 ~ x,
  x.lim=range(-5,5))

findZeros(sin(x^2)*(cos(sqrt(x^4+3)-x^2))-x+1 ~ x, x.lim=range(-100,100))

