df <- read.table(file.choose(),header=TRUE,sep=',')
attach(df)
names(df)
#Age is a discrete value, which explains this spacing
plot(Age,LungCap,main='Age / Lung Capacity',xlab='Age',ylab='Lung Capacity',col='purple')

#the mean age is not a discrete value, here is the centroid anyway
points(mean(Age),mean(LungCap),col='green')
#would have to use the median for that
median(Age)

#mean line of lung capacity
abline(h=mean(LungCap))

#produce a simple regression of dependant variable, LungCap and independent variable, Age
simple_regression = lm(LungCap~Age,data=df)

simple_regression
plot(simple_regression)
termplot(simple_regression)
summary(simple_regression)
abline(simple_regression,col='orange')

#multicolinearity... as these appear to be bound together
#only one would be useful in a real world model
plot(Age,Height)
plot(LungCap,Height)
plot(LungCap,Age)
cor(Age,Height,method='pearson')

multi_model <- lm(LungCap ~ Age + Height)
summary(multi_model)
confint(multi_model,conf.level=0.95)

