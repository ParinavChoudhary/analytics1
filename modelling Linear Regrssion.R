# Modelling 
# linear regressionn - simple ,multiple 
#y ~ x1(SLR) ; y ~ x1 + x2 + X2 ..( M Linear Regression )
# y dependent var ,X Independent 

head(women)
# y ~ weight , x~ Height
# predict weight for a particular HEight . Find corellation 
cor(women$height, women$weight) #relative strength and dirxn of relationship 
cov(women$height ,women$ weight)# dirxn of relationship(height is directly proportional to weight) +ve or -ve

plot(women$height ,women$weight)
#lm is command of linear modelling 
fit1=lm(weight ~ height, data=women)
summary(fit1)
# F stats pvalue<<.05 : linear model exist
# at least one independent variable is significant in predecting dependent variable 
### Multiple Rsquare= .991 (coeff of determination) i.e. 99% of variation in y is explained by x 
# multiple r square when you have one ind. Var. otherwise take adj. Rsq. 
#y=mx+c ; y=-87 +3.45*height only intrapolation possible within the range ,but extrapolationcant be done as the weight can not be negative 

range(women$height)
#in result *** menas variable are significant for predicting y i.e dep var 
# thus yes linear model exist 
women$height
women$weight
y= -87 + 3.45* women$height
# predicted weights for actual height 
y
fitted(fit1)# 30th and 27th are the same ,30 being more accurate
residuals(fit1) # differnce between predicted and actual values ,it is the diff b/w predective and actual weight 
summary(fit1)# summary of the model 
summary(residuals(fit1))
summary(students$marks1)
(newdata1=data.frame(height=c(60.4,55.9)))
(p1=predict(fit1, newdata=newdata1,type='response'))
