library(purrr)
library(plotly)

#d <- 2
p <- 0.99 #Memory parameter
n <- 0 #Number of steps
t <- 10 #Size of the torus
x <- rdunif(1,t)
y <- rdunif(1,t)
x <- x %% t
y <- y %% t
x_vector <- c(x)
y_vector <- c(y)
i <- 1 #covered area


#The first step
start_time <- Sys.time()
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
#c = c + 1
#x
#y
x_vector <- c(x_vector, x)
y_vector <- c(y_vector, y)
e <- cbind(x_vector, y_vector)
i <- i + 1
n <- n + 1
#x_vector
#y_vector

memory <- rbind(dx, dy)
#visited <- rbind(x_vector, y_vector)

#The other steps
w <- 100 #expected covered space
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
end_time <- Sys.time()
time <- end_time - start_time

message("Taken ", n, " steps to cover ", cover_percent, " of the box")
message("Taken ", time, " secs to cover ", cover_percent, " of the box")

df <- data.frame(x_vector, y_vector)
#df
plot_ly(df, x = ~x_vector, y = ~y_vector, mode = "markers", marker = list(size = 500/t, symbol = "1", color = '#5875D5')
)%>%
	layout(autosize = F, width = 500, height = 500)




