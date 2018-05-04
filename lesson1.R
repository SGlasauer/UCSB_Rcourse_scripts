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

##helpful: alt- makes <-
<- 

##writing functions
Fahrenheit_to_kelvin <- function(temp_F) {
  temp_K <- ((temp_F-32)*(5/9))+273.15
  return (temp_K)
}

Fahrenheit_to_kelvin(100)

kelvin_to_celsius <- function(temp_K) {
  temp_C <- temp_K - 273.15
  return (temp_C)
}

kelvin_to_celsius(300)

fahrenheit_to_celsius <-  function(temp_F) {
  temp_K <- Fahrenheit_to_kelvin(temp_F)
  temp_C <- kelvin_to_celsius(temp_K)
  return (temp_C)
}

fahrenheit_to_celsius(100)

sentence <- c("write", "programs", "for", "people", "not", "computers")

asterisk <- "***"

fence <-  function (sentence, wrapper) {
  answer <-  c(wrapper, sentence, wrapper)
  return(answer)
}

fence(sentence, asterisk)

center <- function(data, desired) {
  new_data <- (data - mean(data)+desired)
  return(new_data)
}

##test the center function
z <-  c(0,0,0,0)

center(z, 3)

centered <- center(dat [,4], 0)

min(dat[,4])
min(centered)
max(dat,4)
max(centered)
mean(dat[,4])
mean(centered)

sd(dat[,4])
sd(centered)

all.equal(sd(dat[,4]), sd(centered))

center <- function(data, desired=0) {
  new_data <- (data - mean(data)+desired)
  return(new_data)
}

center(dat[,4])

##write function that scales numbers in a vector from 0-1
##this needs the min and the max

x <- c(6,8,9,1,13,5)

rescale <- function (data) {
 rescaleddata <- ((data-min(data))/max(data))
 return(rescaleddata)
}

rescale(data = dat[,4])

rescale(x)  
