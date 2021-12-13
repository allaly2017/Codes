// Author Allaly Konan
// 22.11.2021
// Exercice 2b Homework2b

#include<stdio.h>
#include<math.h>

int main(){

  // This program calculate the Harmonic mean of five entered numbers.

  int a1, a2, a3, a4, a5;
  double H, H1, H21, H22, H23, H24, H25;


  puts("Enter the first number :");
  do{
    scanf("%d", &a1);
  }while(a1==0); // The number must be non zero

  puts("Enter the second number :");
  do{
    scanf("%d", &a2);
  }while(a2==0); // The number must be non zero

  puts("Enter the third number :");
  do{
    scanf("%d", &a3);
  }while(a3==0); // The number must be non zero

  puts("Enter the fourth number :");
  do{
    scanf("%d", &a4);
  }while(a4==0); // The number must be non zero

  puts("Enter the fifth number :");
  do{
    scanf("%d", &a5);
  }while(a5==0); // The number must be non zero

  H1 = 5*(a1*a2*a3*a4*a5);
  H21 = (1./a1)*(a1*a2*a3*a4*a5);
  H22 = (1./a2)*(a1*a2*a3*a4*a5);
  H23 = (1./a3)*(a1*a2*a3*a4*a5);
  H24 = (1./a4)*(a1*a2*a3*a4*a5);
  H25 = (1./a5)*(a1*a2*a3*a4*a5);

  H = H1/(H21+H22+H23+H24+H25);
  printf("The Harmonic mean of these numbers is H = %lf \n", H);



  return 0;
}
