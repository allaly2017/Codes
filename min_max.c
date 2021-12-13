// Author Allaly Konan
// 22.11.2021
// Exercice 1 Homework2b

#include<stdio.h>
#include<math.h>
#define N 10

int main(){

  // The program give the minimum and maximum of entered numbers.

  double mini = -1000, maxi = 1000;
  double x;
  for(int i=0; i<N; i++){
    puts("Enter a real");
    scanf("%lf", &x);
    if(x<mini){mini = x;}
    if(x>maxi){maxi = x;}
  }
  printf("The minimum of entered numbers is : %lf \n", mini);
  printf("The maximum of entered numbers is : %lf \n", maxi);













  /*
  Find the minimum of two given numbers

  double a,b, min, max, ech;
  puts("Enter a number");
  scanf("%lf", &a);
  puts("Enter a other number");
  scanf("%lf", &b);

  min = a;
  max = b;
  if(min<max){
    printf("The minimum of the entered numbers is : %lf \n", min);
  }else{
    if(min>max){
      ech = min;
      min = max;
      max = ech;
      printf("The minimum of the entered numbers is : %lf \n", min);
    }else{
      printf("The entered numbers are equal \n");
    }
  }
  */





  return 0;
}
