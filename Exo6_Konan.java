import java.util.Scanner;
public class Exo6_Konan
{
  // Ce programme permet de retrouver le minimum dans un tableau

  public static void main(String []args)
  {
  Scanner input = new Scanner(System.in);

  // On crée le tableau et on ajoute ses valeurs
  int[] tab = new int[5];
  for(int i=0; i<5; i=i+1)
  {
    tab[i] = input.nextInt();
  }

  // On choisit le premier element du tableau comme le minimum et on le compare aux autres
  int ValMin = tab[0];
  for(int i=0; i<5; i=i+1)
  {
    if(ValMin > tab[i])
    {
      ValMin = tab[i];
    }
  }

  System.out.println(ValMin);
  // On peut mieux faire en créant une fonction qui retourne le minimum et on l'utilise sur notre tablau
  }

}
