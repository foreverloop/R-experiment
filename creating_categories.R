df <- read.table(file.choose(),header=TRUE,sep=',')
attach(df)
df
names(df)
class(Height)
Height
#now going to make these into categories
CatHeight <- cut(Height,breaks=c(0,50,55,60,65,70,100))
CatHeight
#these are weighted so the biggest numbers fall in a lower category
CatHeight <- cut(Height,breaks=c(0,50,55,60,65,70,100),labels=c("A","B","C","D","E","F"))
#the values we had are now categorised into the labels A,B,C,D,E,F based 
#on what was provided
CatHeight
#R will choose for itself 6 break points for the data, not frequently used apparently
CatHeight <- cut(Height,breaks=6,labels=c("A","B","C","D","E","F"))

CatHeight
