#d = 1
library(purrr)
library(plotly)

n <- 500
x <- rbinom(n,1,0.5)
z <- 2*x - 1
y_vector <- cumsum(z)
plot(y_vector, type = "o")

y <- 0
y_vector <- c(y)

for (i in 1 : n)
{
if (x[i] > 0){
y <- y + 1
y_vector <- c(y_vector, y)
} else{
y <- y -1
y_vector <- c(y_vector, y)}
}

plot(y_vector, type = "o")
x
cumsum(x)


#d = 2
n <- 20
t <- 10
x <- rdunif(1,t)
y <- rdunif(1,t)
x_vector <- c(x)
y_vector <- c(y)
#c <- 0
#c_vector <- c(0)

a <- rdunif(n, 4)
for (i in 1 : n)
{
if (a[i] == 1){
x = x + 1
}else if (a[i] == 2){
x = x - 1
}else if (a[i] == 3){
y = y + 1
}else{
y = y - 1}
x
y

x = x %% t
y = y %% t
#c = c + 1
x_vector <- c(x_vector, x)
y_vector <- c(y_vector, y)
#c_vector <- c(c_vector, c)
}
x_vector
y_vector
df <- data.frame(x_vector, y_vector)
plot_ly(df, x = ~x_vector, y = ~y_vector, mode = "lines", line = list(color = 'ffffff', width = 5)
)%>%
	layout(autosize = F, width = 500, height = 500, plot_bgcolor = '#5875D5')



#d = 3
n = 3000
x_vector <- c(0)
y_vector <- c(0)
z_vector <- c(0)
c_vector <- c(0)
x <- 0
y <- 0
z <- 0
c <- 0

a <- rdunif(n,2^3)
for (i in 1 : n)
{
if (a[i] == 1){
x = x + 1
}else if (a[i] == 2){
x = x - 1
}else if (a[i] == 3){
y = y + 1
}else if (a[i] == 4){
y = y - 1
}else if (a[i] == 5){
z = z + 1
}else{
z = z - 1}
c = c + 1
x_vector <- c(x_vector, x)
y_vector <- c(y_vector, y)
z_vector <- c(z_vector, z)
c_vector <- c(c_vector, c)}
data <- data.frame(x_vector, y_vector, z_vector, c_vector)
data
plot_ly(data, x = ~x_vector, y = ~y_vector, z = ~z_vector, type = 'scatter3d', mode = 'lines',  line = list(width = 4, color = ~c_vector)
)%>%
	layout(plot_bgcolor = '#5875D5')





