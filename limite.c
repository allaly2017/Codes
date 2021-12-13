// Author Allaly Konan
// 22.11.2021
// Exercice 3 Homework2b

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#define TOL 1e-10
#define EPS 1e-3

double f(int n){
  return (pow(n,2)-2*n)/(2*pow(n,2)-1);
}

double g(double x){
  return sin(x)/x;
}

int main(){

  /*
  We search the limit of a numerical sequence when m tends to infinity.
  Our method consists in increasing m and observing the variation
  between two neighbouring values of the sequence.
  */
  double l11,l12, diff;
  int m = 0;
  l11 = f(m);
  do{
    m++;
    l12 = f(m);
    diff = fabs(l12 - l11);
    l11 = l12;
  }while(diff>TOL);
  printf("The limit of the sequence is : %lf reached with %d iterations \n", l12, m);


  /*
  We search the limit of a real fonction. We observed the graph of the function
  and we know that the function is increasing on [-M_PI,0[ and decreasing on ]0,M_PI],
  better, it is symmetrical on [-M_PI,M_PI], so to have the limit around 0
  we just have to search the value of the function just before x changes sign
  */
  double l22, x=1;
  do{
    x-=EPS;
    l22 = g(x);
  }while(x>0);
  printf("The limit of the fonction is : %lf \n", l22);



  return 0;
}
