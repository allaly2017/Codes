import java.util.Scanner;
public class Exo5_Konan
{

  static boolean test_premier(int n)
  {
    if( n==0 || n== 1)
    {
      return false;
    }
    if( n== 2)
    {
      return true;
    }
    for( int i=2; i<n; i = i+1)
    {
      if( n%2 == 0)
      {
        return false;
      } else
      {
        return false;
      }
    }

  public static void main(String []args)
    {
      System.out.println(test_premier(5));
    }
  }



  /**
  public static void main(String []args)
  {
    Scanner input = new Scanner(System.in);
    System.out.println("Entrer un nombre :");
    int n = input.nextInt();
    boolean reponse;
    for (int i=2; i<n; i =i+1)
    {
      if(n%2 == 0)
      {
        reponse = "FALSE";
        break;
      } else
      {
        reponse = "TRUE";
      }
    }
    System.out.println(reponse);
  }
}
**/
