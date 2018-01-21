#Cumulative distribution function on sample and population
#CDF effectively tells us the probability of seeing a value AT LEAST
#as extreme as the one we're observing. for example, a lung capacity of 10
#for the entire population has aprox 78% as show by the graph in this folder
#So 78% of the time when we choose a data point at random, we'd expect it to be
#this capacity or under
df <- read.table(file.choose(),header=TRUE,sep=',')
attach(df)
names(df)

#these are in a random order
hundred_lungs <- LungCap[0:100]

#100 random samples are approximately normally distributed
#you will see the lung capacity of 6 bar doesn't quite fit in the population 
#or the sample
hist(LungCap,prob=TRUE,main='Lung Capacity Normal Distribution',
     xlab='Lung Capacity',
     ylab='Frequency Occuring')

curve(dnorm(x,mean(LungCap),sd=sd(LungCap)),add=TRUE,col='blue')

hist(hundred_lungs,prob=TRUE,main='Lung Capacity Normal Distribution',
     xlab='Lung Capacity',
     ylab='Frequency Occuring')

curve(dnorm(x,mean(hundred_lungs),sd=sd(hundred_lungs)),add=TRUE,col='Red')

#Emperical Cumulative distirbution function below
#where ecdf returns a function which calculates cumulative distribution at a point
#emperical, essentially meaning observation
lung_dist = rnorm(hundred_lungs)
Obs_cdf = ecdf(lung_dist)
Obs_cdf(0) # at 0 we expect this to be approx 0.5, it's 0.45 in this instance

#ECDF for the sample
Obs_sam_cdf = ecdf(hundred_lungs)
sam_cdf_seq = seq(min(hundred_lungs),max(hundred_lungs),by=0.01)
lc_sam_prob = Obs_sam_cdf(sam_cdf_seq)
plot(sam_cdf_seq,lc_sam_prob)

#ECDF for the entire population, has a smoother curve overall
Obs_full_cdf = ecdf(LungCap)
full_cdf_seq = seq(min(LungCap),max(LungCap),by=0.01)
lc_prob = Obs_full_cdf(full_cdf_seq)
plot(full_cdf_seq,lc_prob,main='Lung Capacity Cumulative Distribution',
     xlab='Lung Capacity',
     ylab='Probability')

#lines showing probability of seeing a lung capcity at 10 
#in the population is approx 0.78, 78%
abline(0.78,0,h=0.78)
#hack...
abline(3,10,v=10)
