a <- 2
b <- -3
sigSq <- 0.5
x <- runif(40)
y <- a + b * x + rnorm(40, sd = sqrt(sigSq))
plot(x, y)
abline(a, b, col = "green")
dev.print(png, "toylinePlot.png", width = 480)
