#my first r file 
# comment by starting with # 
women
# Ctrl + Enter --> Execute 
?women
# For seeking help start by ? 
?mean
mtcars
?mtcars
#extract column data & find mean of milage 
mean(mtcars$mpg)
# mean of horse power 
?names(mtcars)
names(mtcars)
mean(mtcars$hp)
# mean of all columns 
colMeans(mtcars)
rowMeans(mtcars)
head(mtcars) # only frst 6 rows gets printed
head(mtcars,1)# first row displayed
?head(mtcars,1)
tail(mtcars,1)# last row displayed 
#histogram 
hist(mtcars$mpg)
hist(mtcars$mpg, breaks= 3)

#vectors
x =c (1,2,3,4) #  x is a variable 
    #c joins 1,2,3,4, to a particular variable 
x# we had created a data i.e vector x having numeric value
class(x)# data type 

x1= c(2L ,8L)
x1
class(x1)

class(mtcars)

x3= c("a", "b", "fsd")
x3
class(x3)

x4= c(TRUE , FALSE, T , F)
x4 # used to get printed 
class(x4)

x5= 1:10000 # create sequence of no from 1 to 1 lakh 
x5
# assigning + printing --> put ( xxxx ) i.e. (x5= 1:10000)
#  to directly print it thereby no need for x5 now.

# assignment = or <- assigning value to variable 

x6 <- 2 

#
(x7= rnorm(1000))# mormalising bell curve 
mean(x7)
sd(x7) # standard deviation 
length(x7) # calculate length of data items 
# plot density 
plot(density(x7))
hist(x7)
#overlay
hist(x7, freq=F)
points(density(x7))
# data set with diferent means 

 x8 = rnorm( 100 , mean = 60 , sd = 10 )
x8  
hist(x8, freq = F)
points(density(x8))

# skewed data mean mode median dont overlap 

library(e1071)
kurtosis(x8)
skewness(x8) # -ve skewness means it's left skewed
#-----------------------------------
#Vectors & Filtering & Sorting Data 
 x9 =runif(100, 30, 90) #uniform distribution 
x9
trunc(x9)# removes decimal places 
round(x9, 1)# round up  to 1 dec point
floor(x9) # lower value i.e 53.9 = 53
ceiling(x9)# higher value i.e. 44.1 = 45

x10= ceiling(x9)
x10

# Sorting 
mean(x10)
median(x10)
sort(x10)# sorting 
sort(x10, decreasing = T)
x10[x10 > 60] # display all no's greater than 60 []
sort(x10[x10 > 60])

x10[1:10] # no's b/w position 1 to 10
x10[20:30] # no's b/w position 20 to 30

x10[-c(1:20)] # don't want value of pos 1 to 20 EXCLUDE
x10[c(1,5,7)]# want no's at position 1,5,7


#### MATRICES vectors in 2 D 

m1= matrix(1:24, nrow= 6)
m1
dim(m1)# row ,column

m2=matrix(1:56, ncol=8)# 1:100 will create error 
m2

m3= matrix(1:24 ,ncol=6 ,byrow=T)# defined order of data being filled 
# default data is filling column wise 
m3

# naming rows & columns 
colnames(m3)= month.abb[1:6] # column is months 
m3

rownames(m3)=paste('Product',1:4,sep ='_')
m3

rowMeans(m3)
colMeans(m3)
rowSums(m3)
colSums(m3)

# print few rows/ columns of a matrix(row,columns) default
m1[ ,1:2] # print first 2 column 
m3[,1:2]
m3[c(1,3),]# print first and 3rd row 
colMeans(m3[c(1,3), ])
colSums(m3[c(1,3), ])
m3[ , c('Apr','May')]

max(m3)
min(m3)
range(m3)

# DATA FRAME $--?
n=30
(rollno= paste('F', 1:30, sep='_'))# alpha Numeric
(sname= paste('Student', 1:30 , sep='$'))

(gender = sample( c ('M','F'),size=n, replace=T, prob=c(.7,.3)))# if replace is not used then it would be hard to assign 2 items Male/ Fmale to 30 people 
# prob=c(.7,.3) probablity used to generate the data in as per user's demand i.e. 70% M, 30%F 
table(gender) #table command is used to count segregated data 

##CONCEPT OF SET SEED 
set.seed(1235) # same nos of M & F in all lappis 
(gender = sample( c ('M','F'),size=n, replace=T, prob=c(.7,.3)))# if replace is not used then it would be hard to assign 2 items Male/ Fmale to 30 people 
table(gender) #table command is used to count segregated data i.e count male , count female 

t1=table(gender)
t1
prop.table(t1)# tells the percentage of males & females 

set.seed(123)
college = sample(c('SRCC','FMS','IIM'),size=n,replace=T,prob=c(.4,.3,.3))  
college
t2=table(college)
t2
prop.table(t2)# gives percentage distribution

(marks1= round(rnorm(n=n, mean=60, sd=10),0))
(marks2= round(rnorm(n=n, mean=55, sd=15),0))
#executing mutiple commands in same line 
rollno; sname; gender; college ;marks1;marks2

length(marks2)
students= data.frame(rollno ,sname, gender,college,marks1,marks2)
students
class(students)
#to print just one of the data column of the students dataframe use $ 
students$college
# to view 2 columns 
students[,c(2,5:6)]
students[,c('sname','marks1','marks2')]
head(students)

#Structure 
str(students)# consider all character as factors by default only gender and college is category data 

summary(students) #
quantile(students $marks1) # by default probs=c(0,0.25,0.5,.75,1)
quantile(students$marks1, probs=seq(0,1,.1)) #decile        
quantile(students $marks1, probs= seq(0,1,.01)) #percentile
seq(1,100,10)
?seq# seq(from=1, to=100, by a gap of= 3)
quantile(students$marks1, probs=seq(0,1,.25)) #decile        

summary(students)
students$rollno=as.character(students$rollno)
students$sname=as.character(students$sname)
str(students)
summary(students)
head(students)
# CSV FILE GENERATION exported CSV file that can be exported to excel 
write.csv(students,'fms.csv', row.names=F)
library(dplyr)
# fetching CSV Data 
students2=read.csv('fms.csv')
head(students2)
students3= read.csv(file.choose())#loading CSV File to R
head(students3)
str(students3)


#students who had scored above 60 and are females
students[students$marks1 > 60, ]
students[students$gender=='F', ]
students[students$gender=='F' & students$college=='SRCC', ]

#Summry statics 

library(dplyr)
students %>% filter(gender=='M'& marks1>60)  # pipe operator 

students %>% group_by(college)%>% summarise(max(marks1),max(marks2))
students %>% filter(college=='FMS')%>% select (marks1,marks2)
