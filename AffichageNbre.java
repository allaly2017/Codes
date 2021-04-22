import java.util.Scanner;

public class AffichageNbre{

  // Fonction qui teste si un nombre est premier
  static boolean TestPremier(int nbre){
    //System.out.println("On fait le test");
    if(nbre == 0 || nbre == 1){
      return false;
    }
    if(nbre==2){
      return true;
    }
    for(int i=2; i<nbre; i++){
      if(nbre%i==0){
        return false;
      } else{
        return true;
      }
    }
    return true;
  }

  public static void main(String[] argv){
    Scanner input = new Scanner(System.in);
    System.out.println("Entrer un nombre entier : ");
    int n = input.nextInt();

    // Exercice 2
    // Programma qui demande un entier n puis affiche n/3, n%3 et n/3 - n%3
    System.out.println("n/3 = " + n/3);
    System.out.println("n%3 = " + n%3);
    System.out.println("n/3 - n%3 = " + (n/3 - n%3));

    // Exercice 3
    // // Programma qui demande un entier n puis affiche ses n premiers carré
    for(int i=1; i<n+1; i++){
      System.out.println(i + " au carré vaut " + i*i);
    }

    // Exercice 4
    // Suite de Syrracuse
    int m = n;
    while(m!=1){
      if(m%2 != 0){
        m=3*m+1;
      } else{
        m=m/2;
      }
      System.out.println(m);
    }

    // Exercice 5
    // Dire si un nombre est premier ou non
    if(TestPremier(n)==true){
      System.out.println(n+ " est premier");
    } else{
      System.out.println(n+ " n'est premier");
    }

  }
}
