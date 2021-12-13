// Author Allaly Konan
// 22.11.2021
// Exercice 4 Homework2b

#include<stdio.h>
#include<math.h>
#define TOL 1e-6

/*
 This program calculate an approximative value of
 pi/2 e pi/4. The approximative value is given by a fonction, to
 achive our objectif we observe the variation of the value of the fonction
 and we stop when the diffirence between two neighbouring values of the fonction
 is less than a choosen tolerance value.
 */

double f(int n){
  return pow(-1.,n)/(2*n+1);
}

double g(int n){
  return pow(2.*n,2)/(pow(2*n,2)-1);
}

int main(){
  double pi_2 = 1, pi_4, sum, prod, diff1, diff2;

  int k = 0;
  sum = f(k); // f(0)
  pi_4 = f(k);
  pi_2 = 1;
  prod = 1;
  do{
    k++;
    pi_4 +=f(k); // f(0)+f(1)
    diff1 = fabs(pi_4-sum);
    sum = pi_4;

    pi_2 *=g(k);
    diff2 = fabs(pi_2-prod);
    prod = pi_4;
  }while(diff1>TOL && diff2>TOL);
  printf("pi/4 = %.10lf \n", pi_4);
  printf("### \n %lf \n", M_PI/4);
  printf("#######################################\n");
  printf("pi/2 = %.10lf \n", pi_2);
  printf("### \n %lf \n", M_PI/2);













  /*
  double somme = 0;
  for(int j=0; j<1000;j++){
    somme +=f(j);
    printf("%lf\n", somme);
  }
  double prod = 1;
  for(int j=1; j<100000; j++){
    prod *=g(j);
  }
  printf("%lf\n", prod);
  printf("#################### \n %lf \n", M_PI/2);
  */




  return 0;
}
