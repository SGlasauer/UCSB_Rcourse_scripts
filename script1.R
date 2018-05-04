setwd ("/Users/umiho/Desktop/CourseStella")
read.csv("data/inflammation-01.csv", header=F)

weight_kg <- 55
weight_kg <- 57.5


weight_kg <- 100

dat <- read.csv(file = "data/inflammation-01.csv", header = FALSE)
dat
head(dat)
class(dat)
dim(dat)

dat[1,1]
dat[30, 20]

c(1,2,3)
dat[c(1,3,5), c(10,20)]
dat [1:4, 1:10]
dat [5:12, 1:10]
dat[1,]
dat [,1]
dat[,16:19]

dat[1,]
max(dat[1,])
patient_1 <- dat[1,]
max(patient_1)

min(dat[,7])
mean(dat[,7])
median(dat[,7])
sd(dat[,7])

summary(dat)

mean(dat[,1])
mean(dat[,2])
mean(dat[,3])
#faster:
##get mean of every row
apply(dat, 1, mean)

##get mean of every column
apply(dat, 2, mean)

a <- c(1,2,3)
a
a*3

animal <- c("m", "o", "n", "k", "e", "y")
animal [4:6]
animal [6:4]
animal[-1]

head(dat)
apply(dat, 2,mean)

avg_day_inflammation <- apply(dat, 2,mean)
plot(avg_day_inflammation)

max_day_inflammation <- apply(dat, 2,max)
plot(max_day_inflammation)

min_day_inflammation <- apply(dat, 2,min)
plot(min_day_inflammation)

sd_day_inflammation <- apply(dat, 2,sd)
plot(sd_day_inflammation)

avg_patient_inflammation <- apply(dat, 1, mean)
plot(avg_patient_inflammation)

mean(dat[2,])
class(as.integer(dat[2,]))
mean(as.integer(dat[2,]))




