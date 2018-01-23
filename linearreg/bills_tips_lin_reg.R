#re-create the simple linear regression previously done in python to check accuracy
bills = c(34,108,64,88,99,51)
tips = c(5,17,11,8,14,5)

#basic scatterplot of bills against tips
plot(bills,tips,
     main='Bills / Tips ',
     xlab='Bills',
     ylab='Tips')

points(mean(bills),mean(tips),col='purple')
abline(h=mean(tips))

simple_regression = lm(tips~bills)
#the coefficient for bills is 0.14622, the same as python predicts
summary(simple_regression)
abline(simple_regression,col='blue')
