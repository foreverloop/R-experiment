#experiments with multiple regression and the Smoke column in R
df <- read.table(file.choose(),header=TRUE,sep=',')
attach(df)
names(df)

plot(Age,LungCap,main='Age / Lung Capacity',xlab='Age',ylab='Lung Capacity',col='purple')

lin_m <- lm(LungCap ~ Smoke)
summary(lin_m)

plot(LungCap,Age,pch=19)

#convert Smoke to 1 for yes and 0 for no
smoke_f <- factor(Smoke,c("yes","no"),c(1,0))
smoke_f

#Too many non smokers, because lower ages will almost defintely not smoke
#probably worth filtering the data to only use people who are older
plot(LungCap,Smoke,pch=19)
smoke_code <- ifelse(Smoke == 'yes',1,0)
logistic_smoke = glm(smoke_code~ LungCap,binomial)
summary(logistic_smoke)
xv <- seq(min(LungCap),max(LungCap),0.01)
yv <- predict(logistic_smoke,list(LungCap=xv),type='response')
lines(yv,xv,col='red')

levels(Gender)

gencode <- ifelse(Gender == 'female',1,0)
plot(LungCap,gencode)
gender_smoke = glm(gencode ~ LungCap,binomial)
#female lung capacity is lower than male
summary(gender_smoke)
xv <- seq(min(LungCap),max(LungCap),0.01)
yv <- predict(gender_smoke,list(LungCap=xv),type='response')
lines(yv,xv,col='red')

abline(10,3,v=10)
abline(7.7702,0.875)
abline(7.7702,0)
smoking_height <- lm(Height ~Smoke)
summary(smoking_height)
single_model <- lm(LungCap ~ Height)

summary(single_model)
multi_model <- lm(LungCap ~ Height + Smoke)
confint(multi_model,conf.level=0.95)

#if age is held constant, smoking reduces lung capacity by -0.64859
#according to the multiple regression here
summary(multi_model)
termplot(multi_model)
plot(Height,LungCap,pch=19,col='pink')

#smoking taken into account
#not all coefficients being, bad results
abline(multi_model)
#smoking not taken into account
abline(single_model,col='blue')
