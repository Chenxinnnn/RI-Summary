library(purrr)
library(plotly)


#d <- 3
p <- 0.88 #Memory parameter
n <- 50 #Number of steps
t <- 10 #Size of the torus
x <- rdunif(1,t)
y <- rdunif(1,t)
z <- rdunif(1,t)
x <- x %% t
y <- y %% t
z <- z %% t
x_vector <- c(x)
y_vector <- c(y)
z_vector <- c(z)

#The first step
b <- rdunif(1, 6) #b is just used to determine which direction to go

if (b == 1){
x <- x + 1
dx <- 1
dy <- 0
dz <- 0
}else if (b == 2){
x <- x - 1
dx <- -1
dy <- 0
dz <- 0
}else if (b == 3){
y <- y + 1
dx <- 0
dy <- 1
dz <- 0
}else if (b == 4){
y <- y - 1
dx <- 0
dy <- -1
dz <- 0
}else if (b == 5){
z <- z + 1
dx <- 0
dy <- 0
dz <- 1	
}else{
z <- z - 1
dx <- 0
dy <- 0
dz <- -1	
}
x = x %% t
y = y %% t
z = z %% t
#c = c + 1
#x
#y
x_vector <- c(x_vector, x)
y_vector <- c(y_vector, y)
z_vector <- c(z_vector, z)
#x_vector
#y_vector

memory <- rbind(dx, dy, dz)
#memory
#visited <- rbind(x_vector, y_vector)

#The other steps
a <- runif(n)
for (i in 1:(n-1)){
if (a[i] <= p){
	j <- sample(ncol(memory), 1)
	x <- (x + memory[,j][[1]]) %% t
	y <- (y + memory[,j][[2]]) %% t
	z <- (z + memory[,j][[3]]) %% t
	x_vector <- c(x_vector, x)
	y_vector <- c(y_vector, y)
	z_vector <- c(z_vector, z)
	memory <- cbind(memory, rbind(memory[,j][[1]], memory[,j][[2]], memory[,j][[3]]))
}
else{
	b <- rdunif(1, 6) #b is just used to determine which direction to go
	if (b == 1){
	x <- x + 1
	dx <- 1
	dy <- 0
	dz <- 0
	}else if (b == 2){
	x <- x - 1
	dx <- -1
	dy <- 0
	dz <- 0
	}else if (b == 3){
	y <- y + 1
	dx <- 0
	dy <- 1
	dz <- 0
	}else if (b == 4){
	y <- y - 1
	dx <- 0
	dy <- -1
	dz <- 0
	}else if (b == 5){
	z <- z + 1
	dx <- 0
	dy <- 0
	dz <- 1
	}else{
	z <- z - 1
	dx <- 0
	dy <- 0
	dz <- -1
	}
	x = x %% t
	y = y %% t
	z = z %% t
	memory <- cbind(memory, rbind(dx, dy, dz))
	x_vector <- c(x_vector, x)
	y_vector <- c(y_vector, y)	
	z_vector <- c(z_vector, z)
}
}

df <- data.frame(x_vector, y_vector, z_vector)
plot_ly(df, x = ~x_vector, y = ~y_vector, y = ~z_vector, marker = list(color = ~mpg, colorscale = c('#FFE1A1', '#683531'), showscale = True))%>%
	#layout(autosize = F, width = 500, height = 500)



