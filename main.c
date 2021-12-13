// Allaly Konan
// 07.12.2021
// Homework 5 : In this program with loop for to make an image ( a chess board)

#include<stdio.h>
#include<stdlib.h>
#include<time.h>
#define n 300


int main(int argc, char *argv[]){

  //srand(time(NULL));

  int i, j, k, l, m, gray=127, white=255, black=0;
  FILE* fw = NULL;

  fw =  fopen("Image.pgm", "w");
  if(fw == NULL){
    printf("ERREUR\n");
    exit(0);
  }


  fprintf(fw,"P2\n");
  fprintf(fw,"%d %d\n255\n",n,n);


  for(m=0; m<(n/60); m++){

    for(k=0; k<((n/10)*(n/60)); k++){
      for(i=0; i<(n/10); i++){
        fprintf(fw, "%d ", black);
      }
      for(i=0; i<(n/10); i++){
        fprintf(fw, "%d ", white);
      }
    }

    for(l=0; l<((n/10)*(n/60)); l++){
      for(j=0; j<(n/10); j++){
        fprintf(fw, "%d ", white);
      }
      for(j=0; j<(n/10); j++){
        fprintf(fw, "%d ", black);
      }
    }
  }
  fclose(fw);

  return 0;
}
