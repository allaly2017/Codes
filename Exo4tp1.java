import java.util.Scanner;

// Programme qui demande un entier n et affiche les termes de la suite de Syracuse

public class Exo4tp1
{
  public static void main(String[] args)
  {
    Scanner  input = new Scanner(System.in);
    System.out.println("Entrer un nombre entier");
    int n = input.nextInt();
    for( int i=n; i>0; i--)
    {
      if(n%2 == 0)
      {
        System.out.println(n/2);
      } else
      {
        System.out.println(3*n+1);
      }
    }
  }
}
