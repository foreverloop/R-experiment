#Histograms, Normal Distributions, scaling data to 0 mean and 1 sd, Z scores
df <- read.table(file.choose(),header=TRUE,sep=',')
attach(df)
names(df)

#basic histogram of lung capacities
hist(LungCap,prob=TRUE,main='Lung Capacity Normal Distribution',
     xlab='Lung Capacity',
     ylab='Frequency Occuring')

#plot a smooth curve using normal distribution and previous x values on plot
curve(dnorm(x,mean(LungCap),sd=sd(LungCap)),add=TRUE,col='Red')

#Summary stats
mean(LungCap)
median(LungCap)

#tells how much on average the values in the list deviate from the mean
sd(LungCap)

#where I have NOT standardised the data to mean = 0 standard dev. = 1
#gives the odds of seeing a value at least the size of the current data point, 
#given the mean and sd of sample
densities <- dnorm(LungCap,mean(LungCap),sd(LungCap))

#Normal distribution graph
plot(LungCap,
     densities,
     main='Lung Capacity Normal Distribution',
     xlab='Lung Capacity',
     ylab='Frequency Occuring')

#inefficient but nice continuous line, not quite a normal dist
plot(density(LungCap),main='Lung Capacity Distribution',
     xlab='Lung Capacity',
     ylab='Frequency Occuring')

#Standardised values (Z scores)
#half of these valeus will be below the mean, half above
#Z score represents how far away a value is from the mean
#if the sample is small (< 30), it's referred to as t-statistic
scaledLungCap <- scale(LungCap)

#if we want to see it as a table
sort(scaledLungCap)

#below checks the scale worked
#colMeans gives mean for the vector, very small number raised to e to a power, effectively 0
colMeans(scaledLungCap)
#gives the stanard deviation for the vector, 1 after scale
apply(scaledLungCap,2,sd)