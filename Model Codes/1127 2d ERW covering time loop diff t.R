library(purrr)
library(plotly)
start_time <- Sys.time()

ps <- c(0, 0.2, 0.4, 0.6, 0.8, 0.9, 0.95, 0.98, 0.99)
U <- c()
V <- c()

for (p in ps){
#d <- 2
N <- c()
t <- 60 #Size of the torus

for (r in 1:200){
n <- 0 #Number of steps
x <- rdunif(1,t)
y <- rdunif(1,t)
x <- x %% t
y <- y %% t
x_vector <- c(x)
y_vector <- c(y)
i <- 1 #covered area

#The first step
b <- rdunif(1, 4) #b is just used to determine which direction to go
if (b == 1){
x <- x + 1
dx <- 1
dy <- 0
}else if (b == 2){
x <- x - 1
dx <- -1
dy <- 0
}else if (b == 3){
y <- y + 1
dx <- 0
dy <- 1
}else{
y <- y - 1
dx <- 0
dy <- -1}
x <- x %% t
y <- y %% t
x_vector <- c(x_vector, x)
y_vector <- c(y_vector, y)
e <- cbind(x_vector, y_vector)
i <- i + 1
n <- n + 1

memory <- rbind(dx, dy)

#The other steps
w <- 3600 #expected covered space
cover_percent <- w/(t*t)
while (i < w) {
n <- n + 1
a <- runif(1)
if (a <= p){
	j <- sample(ncol(memory), 1)
	x <- (x + memory[,j][[1]]) %% t
	y <- (y + memory[,j][[2]]) %% t
	a <- e[e[,1] == x,,drop = F]
	b <- a[a[,2] == y,,drop = F]
	if (nrow(b) == 0) {
		i <- i + 1
	}
	x_vector <- c(x_vector, x)
	y_vector <- c(y_vector, y)
	e <- cbind(x_vector, y_vector)
	memory <- cbind(memory, rbind(memory[,j][[1]], memory[,j][[2]]))
}else{
	b <- rdunif(1, 4) #b is just used to determine which direction 
	if (b == 1){
	x <- x + 1
	dx <- 1
	dy <- 0
	}else if (b == 2){
	x <- x - 1
	dx <- -1
	dy <- 0
	}else if (b == 3){
	y <- y + 1
	dx <- 0
	dy <- 1
	}else{
	y <- y - 1
	dx <- 0
	dy <- -1}
	x <- x %% t
	y <- y %% t
	memory <- cbind(memory, rbind(dx, dy))
	a <- e[e[,1] == x,,drop = F]
	b <- a[a[,2] == y,,drop = F]
	if (nrow(b) == 0) {
		i <- i + 1
	}
	x_vector <- c(x_vector, x)
	y_vector <- c(y_vector, y)
	e <- cbind(x_vector, y_vector)	
}
}
N <- c(N,n)
}
u <- mean(N)
v <- median(N)
U <- c(U, u)
V <- c(V, v)
}

df <- data.frame(ps, U, V)
write.table(df,"t = 60.txt",sep="\t",row.names=FALSE)


plot(ps, U, type = 'o', col = 'red', xlim = c(0,1), ylim = c(32000,88000), main = 'Torus Size 60, Run 200 Times', xlab = 'memory parameter', ylab = 'cover time')
lines(ps, V, type = 'o', col = 'blue')
legend('topleft', legend = c('Mean', 'Median'), col = c('red', 'blue'), lty = c(1,1), lwd = 2)
end_time <- Sys.time()
time <- end_time - start_time
df
time

