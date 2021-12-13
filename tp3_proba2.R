setwd("./Downloads/")


######## Exercice 1 : Représentation de fonctions

### Question 1

a <- -5
b <- 5
ngrid <- 50
xgrid <- seq(a,b,length=ngrid)
ygrid <- xgrid
f=function(x,y){1/(2*pi)*exp(-0.5*(2*x^2-2*x*y+y^2))}
yf <- outer(xgrid,ygrid,f)
persp(xgrid,ygrid,yf,theta=10,phi=20,expand=0.45)

# ce code permet de donner une représentation en perspective d'une fonction
# il faut commencer par construire la grille 

### Question 2

g = function(t,x){
  return(t^(x-1)*exp(-t))
}

g(-1,1)

Gam = function(t){
  return(integrate(g, 0, +Inf, stop.on.error = TRUE ))
}

Gam(1)




