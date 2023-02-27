#d = 2
#To create a full set, and take the points away
library(plotly)
#library(tidyr)
library(purrr)
#u <-
n <- 100
t <- 50
original_x <- seq(0,t-1,1)
original_y <- seq(0,t-1,1)
original_box <- expand.grid(original_x, original_y) #function to combine 

x <- rdunif(1,t)
y <- rdunif(1,t)
x <- x %% t
y <- y %% t
x_vector <- c(x)
y_vector <- c(y)
#c <- 0
#c_vector <- c(0)

a <- rdunif(n-1, 4)
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

x = x %% t
y = y %% t
#c = c + 1
x_vector <- c(x_vector, x)
y_vector <- c(y_vector, y)
#c_vector <- c(c_vector, c)
}

df <- data.frame(x_vector, y_vector)

original_list <- list()
for (i in 1:length(original_box[[1]])){
	original_list[[i]] <- c(original_box[[1]][i],original_box[[2]][i])
}

visited_points <- list()
for (i in 1:length(df[[1]])){
	visited_points[[i]] <- c(df[[1]][i],df[[2]][i])
}

vacent_list <- original_list[!original_list %in% visited_points]


vacent_x_vector <- c()
vacent_y_vector <- c()
for (i in 1:length(vacent_list)){
	vacent_x_vector <- c(vacent_x_vector, vacent_list[[i]][1])
	vacent_y_vector <- c(vacent_y_vector, vacent_list[[i]][2])
}
new_df <- data.frame(vacent_x_vector, vacent_y_vector)


plot_ly(new_df, x = ~vacent_x_vector, y = ~vacent_y_vector, mode = "markers", marker = list(size = 500/t, symbol = "1", color = '#5875D5')
)
	layout(autosize = F, width = 500, height = 500)
	
	