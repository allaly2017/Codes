// Aide memoire java

// Instancier une classe signifie créer un objet de la classe

/*              import java.util.Scanner;                                : à mettre au début
                Scanner input = new Scanner(System.in);                  : à mettre dans la class publique qui servira pour le test
                variable = input.nextInt();
-----> permet d'importer la fonction permettant de demander des données à l'utilisateur
                 */

// import java.util.ArrayList; ------> Pour utiliser les fonctions relatives aux listes

// System.out.println();  ----> permet d'afficher un message à l'écran

/*
   int[] tab;                          ------ en C : int tab[]
   tab = new int[5]
   ------> permet de déclarer un tableau d'entiers de taille 5 nommé tab
*/

/*  Déclaration et utilisation d'une liste (ordonnée) en java
    import java.util.ArrayList;
    java.util.List<Type> NomDeMaListe = new ArrayList();  ---> La première lettre du type est en majuscule
    NomDeMaListe.add();   ----> Ajouter un élément à la listes
    NomDeMaListe.remove(idexe) ---> Supprimer un élément de la liste
    NomDeMaListe.set(index,element) ---> Remplacer un élément de la liste
    NomDeMaListe.size()  ------> avoir la taille de ma liste
*/

/*   Déclaration et utilisation d'une liste (non ordonnée) en java
     Set<Type> NomDeMaListe = new HashSet<Type>();
     NomDeMaListe.add();  -----> ajouter un élément
     NomDeMaListe.remove(element)  ----> Supprimer un élément

*/


// Class abstract
/* Une classe abstraite est une classe dont toutes les méthodes n’ont pas été
 implémentées. Elle n’est donc pas instanciable, mais sert avant tout à factoriser
 du code. Une classe qui hérite d’une classe abstraite doit obligatoirement
 implémenter les méthodes manquantes (qui ont été elles-mêmes déclarées « abstraites »
 dans la classe parente). En revanche, elle n’est pas obligée de réimplémenter
 les méthodes déjà implémentées dans la classe parente
 (d’où une maintenance du code plus facile). */
