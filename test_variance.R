setwd ("~/Downloads/Prog_Stat/")

M <- c(250,254,254,253,256,250,257,251,253,255,250,255,252,261,252,251,255)
mean(M)
var(M)
l <- length(M)
var_2 <- (1/l)*sum(M^2) -(mean(M))^2
var_2
M^2
(1/l-1)*sum(M^2)-(mean(M))^2
