#first R script with basic commands. 
#Test if this can be understood on Github. 
#More to follow.
x <- 5
print (x)
golden_balls_final <- read.csv("~/golden_balls_final.csv")
View(golden_balls_final)
sum(golden_balls_final['prize_value_gbp'])
ls()
rm(x)
ls()
name <- 'charlie'
name
2^2
sqrt(9)
log(8)
exp(8)
abs(-14)
# comments are done after hash, like python single comment
test_vector <- c(1,3,5,7,9)
test_vector
temperature <- c("hot","cold")
temperature
5:10
seq(from=1 to=20 by=1/4)
seq(from=1, to=20, by=1/4)
seq(from=1, to=20, by=0.40)
rep(1,times=20)
#vectors can be operated on if they are of the same length
ls()
x = c(1,2,3,4,5)
y = c(5,4,3,2,1)
z = x + y
z

#getting elements out
x[1]
y[2] #result will be 4
ls()
rm(test_vector)
first_m = matrix(c(1,2,3,4,5), nrow=4, byrow=FALSE)
first_m
first_m[3,]
first_m[3,1]
first_m[4,2]
first_m[3,2] #2
q()