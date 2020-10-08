# https://google.github.io/CausalImpact/CausalImpact.html

library(CausalImpact)

setwd("set_directory")
eurusd<-read.csv("eurusd.csv")
gbpusd<-read.csv("gbpusd.csv")

set.seed(1)
x1 <- eurusd$Value
y <- gbpusd$Value
data <- cbind(y, x1)

dim(data)
head(data)
matplot(data, type = "l")

pre.period <- c(1, 230)
post.period <- c(231, 249)

impact <- CausalImpact(data, pre.period, post.period)
plot(impact)

summary(impact)
summary(impact, "report")

impact$summary