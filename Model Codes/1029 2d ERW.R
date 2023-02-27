library(purrr)
library(ggplot2)

#d <- 2
p <- 0.9 #Memory parameter
n <- 10000 #Number of steps
t <- 100 #Size of the torus
x <- rdunif(1,t)
y <- rdunif(1,t)
x <- x %% t
y <- y %% t
x_vector <- c(x)
y_vector <- c(y)

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
x = x %% t
y = y %% t
#c = c + 1
#x
#y
x_vector <- c(x_vector, x)
y_vector <- c(y_vector, y)
#x_vector
#y_vector

memory <- rbind(dx, dy)
#visited <- rbind(x_vector, y_vector)

#The other steps
a <- runif(n)
for (i in 1:(n-1)){
if (a[i] <= p){
	j <- sample(ncol(memory), 1)
	x <- (x + memory[,j][[1]]) %% t
	y <- (y + memory[,j][[2]]) %% t
	x_vector <- c(x_vector, x)
	y_vector <- c(y_vector, y)
	memory <- cbind(memory, rbind(memory[,j][[1]], memory[,j][[2]]))
}
else{
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
	x = x %% t
	y = y %% t
	memory <- cbind(memory, rbind(dx, dy))
	x_vector <- c(x_vector, x)
	y_vector <- c(y_vector, y)	
}
}

df <- data.frame(x_vector, y_vector)
plot_ly(df, x = ~x_vector, y = ~y_vector, mode = "markers", marker = list(size = 500/t, symbol = "1", color = '#5875D5')
)%>%
	layout(autosize = F, width = 500, height = 500)



