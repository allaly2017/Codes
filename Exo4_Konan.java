import java.util.Scanner;
public class Exo4_Konan
{
  public static void main(String []args)
  {
    Scanner input = new Scanner(System.in);
    System.out.println("Entrer un nombre :");
    int n = input.nextInt();
    double u0 = n;
    double u1 ;
    while(u0!=1)
    {
      if(u0%2 == 0)
      {
        u1 = u0/2;
        System.out.println(u1);
        u0 = u1;
      } else
      {
        u1 = 3*u0 + 1;
        System.out.println(u1);
        u0 = u1;
      }
    }
  }
}
