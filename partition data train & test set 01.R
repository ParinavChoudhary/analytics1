women
nrow(women)
index= sample(x=1:nrow(women), size =.7*nrow(women))

index
women[1:5,]
train=women[index,]
test=women[-index,]

fit1=lm(weight~height ,data=train)
summary(fit1)

p4=predict(fit1, newdata=test, type='response')
cbind(p4,test$weight)
