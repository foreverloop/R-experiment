#Dummy variables in regression
df <- read.table(file.choose(),header=TRUE,sep=',')
attach(df)
names(df)

#categorised values of heights
CatHeight <- cut(Height,breaks=c(0,50,55,60,65,70,100),labels=c("A","B","C","D","E","F"))
CatHeight[1:10]

#requires 2 classes to describe this variable
levels(Smoke)

#we need 6 levels to represent this
levels(CatHeight)

#mean lung capacity for each height category
mean(LungCap[CatHeight=="A"])
mean(LungCap[CatHeight=="B"])
mean(LungCap[CatHeight=="C"])
mean(LungCap[CatHeight=="D"])
mean(LungCap[CatHeight=="E"])
mean(LungCap[CatHeight=="F"])

#dependent variable first, then explanatory variable after
line_re <- lm(LungCap ~ CatHeight)
line_re
summary(line_re)

#gives b sub(0), which is the intercept, the lung capacity of someone in cat A
#since everyone is AT LEAST in the lowest group

#R chooses the base category on the first Alphabetically or Numerically named categories

#this way, we have been able to use categorical data in a regression model
#the categories need to have a value associated though, for example
#if this was a house price regression, there might be a "Near a train track?"
#category with 1 for yes and 0 for no. it might associate a value of minus 30,000 pounds 
#we could then use this model. see also the images to explain how 
#these are interpreted