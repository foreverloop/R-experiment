#showing simple linear regression. 
#Much more straightforward than Python!

#read in Hours Studied Vs Test Score
df <- read.table(file.choose(),header=TRUE,sep=',')

#so we can access the columns directly
attach(df)

#show name as R understands them
names(df)

#basic scatterplot of hours against score
plot(hours,score,
     main='Hours Studied / Test Score',
     xlab='Hours Studied',
     ylab='Test Score',
     col='purple')

#centroid
points(mean(hours),mean(score),col='green')

#plot the mean line for score along the X axis
abline(h=mean(score))

#using the linear model to fit the simple regression line to the data
simple_regression = lm(score~hours,data=df)

#inspecting the model coefficients, (for example usage in y = mx + b)
simple_regression

#plot the regression line to the graph
abline(simple_regression,col='orange')

#a number of plots are produced from this
# one showing fitted values vs residuals
# one showing if the regression points are normally distributed
plot(simple_regression)

#shows general correlation
termplot(simple_regression)

#gives summary stats such as p-value, t-value,f-stat, coefficients, intercept
#sum squared error r squared and rsquared adjusted, showing how much of the error
#can be acounted for by the explanatory variable
summary(simple_regression)