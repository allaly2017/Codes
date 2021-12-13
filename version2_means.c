#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#define N 5

double sum(int t[]){
  res = 0;
  for(int i=0; i<k; i++){
    res += t[i];
  }
  return res;
}

int main(){
  int tab[5];
  double A,H,G;


  for(int i=0; i<N; i++){
    puts("Enter an integers : ");
    scanf("%d", tab[i]);
  }
  printf("The Arithmetical mean is : %lf \n", sum(tab[])/N.);
  // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  // The code does't work, it needs some modifications
}
