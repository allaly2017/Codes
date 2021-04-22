public class Animal
/* Le fichier peut contenir plusieurs classes public
et le nom du fichier devrat être le nom de l'une de ces classes
*/
{
    // Attributs
    boolean vivant;
    int age;
    static int NbredAnimauxVivants;
    String nom;
    String cri;

    // Constructeurs
    // Créer des animaux : objet du type animal
    Animal(String Nom, String Cri)
    {
      /* Permet de créer un animal à partir de son nom et de son cri
      Les autres traitements sont les mêmes pour tous les animaux */
      nom = Nom;
      cri = Cri;
      age=0;
      vivant = true;
      System.out.println(nom + " est né.");
      NbredAnimauxVivants++;
    }


    // Méthodes
    void vieillir()
    {
      // vieillir d'un an
      if(vivant==true)
      {
        age++;
      }
    }
    void vieillir(int n)
    {
      // vieillir de n années
      if(vivant==true)
      {
        age=age+n;
      }
    }
    void crier()
    {
      if(vivant==true)
      {
        System.out.println(nom + " : "+ cri);
      }
    }
    void mourir()
    {
      if(vivant==true)
      {
        vivant=false;
        NbredAnimauxVivants--;
      }
    }
    // Méthode pour afficher les infos d'un animal
    void details()
    {
      System.out.println("Nom = " + nom);
      System.out.println("Age = " + age);
      System.out.println("Cri = " + cri);
      System.out.println("Vivant = " + vivant);
    }
}

public class Jungle
{
  // Attributs
  Animal[] zoo;

  // Constructeurs
  Jungle(int n)
  {
    zoo = new Animal[n];
    for(int i=0; i<n; i++)
    {
      zoo[i] = new Animal();
    }
  }

  // Méthodes
  void cris()
  {
    for(int i=0; i<zoo.length; i++)
    {
      zoo[i].crier();
    }
    System.out.println();
  }
  void details()
  {
    for(int i=0; i<zoo.length; i++)
    {
      zoo[i].details();
    }
    System.out.println();
  }

  public static void main(String[] args)
  {
    Jungle zoo1 = new Jungle[4];

    zoo1.zoo[0] = new Animal("Chat", "Miaou");
    zoo1.zoo[1] = new Animal("Mouton", "bèèè");
    zoo1.zoo[2] = new Animal("Crapaud", "coa");
    zoo1.zoo[3] = new Animal("Chien", "wowo");

    zoo1.details();
  }

}
