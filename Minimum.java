import java.util.Scanner;
public class Minimum
{
  int[] t = new int[5];
  static int m = 0;

  public static void main(String[] args)
  {
    Scanner input = new Scanner(System.in);
    for(int i=0; i<5; i++)
    {
      t[i] = input.nextInt();
    }

    m = t[0];
    for(int i=0; i<5; i++)
    {
      if(m > t[i])
      {
        m = t[i];
      }
    }
    System.out.println("Le Minimum est ");
    System.out.println(m);
  }
}
