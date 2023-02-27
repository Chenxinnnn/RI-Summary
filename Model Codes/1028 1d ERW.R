#d <- 1
p <- 0.9 #Memory parameter
n <- 1000 #Number of steps
existed <- c()

#The first step
x <- rbinom(1,1,0.5)
z <- 2*x - 1
existed <- c(existed, z)

#Other steps
a <- runif(n)
a[1] <= p
for (i in 1:n){
if (a[i] <= p){
	new <- sample(existed,1)
	existed <- c(existed, new)
}
else{
	x <- rbinom(1,1,0.5)
	z <- 2*x - 1
	existed <- c(existed, z)
}
}
x_vector <- cumsum(existed)
x_vector
plot(x_vector, type = "o")
