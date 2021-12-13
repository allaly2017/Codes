// Author Allaly Konan
// 22.11.2021
// Exercice 2a,2c Homework2b

#include<stdio.h>
#include<math.h>

int main(){

  // This program calculate the Arithmetic en Geometrical means of five entered numbers.

  int a1, a2, a3, a4, a5;
  puts("Enter the first number :");
  scanf("%d", &a1);
  puts("Enter the second number :");
  scanf("%d", &a2);
  puts("Enter the third number :");
  scanf("%d", &a3);
  puts("Enter the fourth number :");
  scanf("%d", &a4);
  puts("Enter the fifth number :");
  scanf("%d", &a5);

  double A, G;

  A = (a1+a2+a3+a4+a5)/5.;
  printf("The Arithmetic mean is A = %lf \n", A);

  G = pow(a1*a2*a3*a4*a5, 1./5);
  printf("The Geometrical mean is G = %lf \n", G);



  return 0;
}
