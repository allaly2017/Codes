import javax.swing.*;      // Permet de gérer tout ce qui est interface graphique
import java.awt.*;        //  "                                                 "
import java.awt.event.*;  // Permet de créer les fenêtres. Pour créer une nouvelle fenêtre il faut utiliser JFrame

class Fenetre extends JFrame {

	// On se donne 9 boutons pour commencer
	JLabel label1;           // Permet de gérer du texte, affichage de texte intégré à la fenêtre
	JButton j1, j2, b1, b2, b3, b4, b5, b6, b7, b8, b9;
	int cpt1, cpt;
	int compteur; // Pour compter le nombre de coup

	// Les JPanels permettent de gérer l'agencement de la fenêtre
	// Pour l'instant on ne fait rien à ce niveau

	Fenetre() {
		//On commence par initialiser les propriétés basiques de la fenetre
		setTitle (" Morpion ") ;
		setSize (600 ,600) ;
		setResizable ( false ) ;
		setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE ) ;
		setLocationRelativeTo( null ) ;

		cpt1 = 0;
		cpt2 = 0;
		compteur = 0;


		// On aura plusieurs compartiments
		BoxLayout l = new BoxLayout(getContentPane(),BoxLayout.PAGE_AXIS) ;
		getContentPane().setLayout (l) ;

		// On aura trois sections : 1e pour les noms des joueurs et des parties gagnées,
		// une autre pour l'espace de jeu et une dernière à définir ...
		// On crée pour cela trois Panels
		JPanel ptop = new JPanel();
		JPanel pcenter = new JPanel();
		JPanel pbottom = new JPanel();

		// Le panels d'en haut contient deux boutons un pour chaque joeur
		j1 = new JButton("Joueur 1");
		j2 = new JButton("Joueur 2");

		// Création de mes 9 boutons
		b1 = new JButton("");
		b2 = new JButton("");
		b3 = new JButton("");
		b4 = new JButton("");
		b5 = new JButton("");
		b6 = new JButton("");
		b7 = new JButton("");
		b8 = new JButton("");
		b9 = new JButton("");

		// On crée une instance de comportement de nos boutons
		ButtonBehavior comp = new ButtonBehavior(this);

		// On définit le même comportement pour tous les boutons
		j1.addActionListener(comp);
		j2.addActionListener(comp);
		b1.addActionListener(comp);
		b2.addActionListener(comp);
		b3.addActionListener(comp);
		b4.addActionListener(comp);
		b5.addActionListener(comp);
		b6.addActionListener(comp);
		b7.addActionListener(comp);
		b8.addActionListener(comp);
		b9.addActionListener(comp);

		// On ajoute chaque bouton à son panel
		ptop.add(j1);
		ptop.add(j2);

		pcenter.add(b1);
		pcenter.add(b2);
		pcenter.add(b3);
		pcenter.add(b4);
		pcenter.add(b5);
		pcenter.add(b6);
		pcenter.add(b7);
		pcenter.add(b8);
		pcenter.add(b9);


		// Chaque compartiment comportera un bouton
		// Le compartiment prendra une forme en fonction du joueur (croix ou rond)
		// On pourra faire le test de victoire après les 6 clics
		// Un joueur remporte la partie s'il réussit à aligner 3 de ses symboles (vertical, horizontal et oblique)
		// La partie est déclarée nulle si , toutes les cases sont occupée et qu'aucun joueur n'a gagné la partie

	}
}

// Comportement des boutons
class ButtonBehavior implements ActionListener {

	Fenetre f;

	ButtonBehavior(Fenetre F){
		f=F;
	}

	public void actionPerformed(ActionEvent e){
		 switch(e.getSource()){
			 case == f.j1:
			 				f.label1.setText("Vous avez gagné "+cpt1+" parties");
							break;
			 case == f.j2:
							f.label1.setText("Vous avez gagné "+cpt2+" parties");
							break;
			 case == f.b1:
			 				f.compteur = f.compteur + 1;
							if(compteur%2 == 0){
								f.label1.setText("X")
							} else{
								f.label1.setText("O")
							}
							break;
			case == f.b2:
							f.compteur = f.compteur + 1;
							if(compteur%2 == 0){
								  f.label1.setText("X")
								} else{
									f.label1.setText("O")
								}
							break;
			case == f.b3:
							f.compteur = f.compteur + 1;
							if(compteur%2 == 0){
									f.label1.setText("X")
							} else{
									f.label1.setText("O")
							}
							break;
			case == f.b4:
							f.compteur = f.compteur + 1;
							if(compteur%2 == 0){
									f.label1.setText("X")
							} else{
							 		f.label1.setText("O")
							 }
							 break;
			case == f.b5:
					 		f.compteur = f.compteur + 1;
					 		if(compteur%2 == 0){
					 				f.label1.setText("X")
					 		} else{
					 				f.label1.setText("O")
					 		}
					 		break;
			case == f.b6:
							f.compteur = f.compteur + 1;
							if(compteur%2 == 0){
									f.label1.setText("X")
							} else{
									f.label1.setText("O")
							}
							break;
			case == f.b7:
							f.compteur = f.compteur + 1;
							if(compteur%2 == 0){
		   						f.label1.setText("X")
							} else{
									f.label1.setText("O")
							}
							break;
			case == f.b8:
							f.compteur = f.compteur + 1;
							if(compteur%2 == 0){
									f.label1.setText("X")
							} else{
									f.label1.setText("O")
							}
							break;
		 case == f.b9:
							f.compteur = f.compteur + 1;
							if(compteur%2 == 0){
						  		f.label1.setText("X")
							} else{
									f.label1.setText("O")
							}
							break;


		 }
	 }
}

public class JeuMorpion {
	public  static  void  main(String  args []) {
		Fenetre f = new  Fenetre ();
		f.setVisible(true);
	}
}
