/************  tout ce qu il faut pour afficher une Jauge ***************
 ***** francois Sahuc ********** Juin 2017 ******************************
affichage de temperature pour exemple
l affichage est dans un carre de 200 x 200
la variable s appelle temp
*/

float temp=20;// la variable a afficher
float facteur=1.8 ; // variable utilisee pour avoir la pleine echelle, ici pour avoir au maxi 150 degres
                    // a determiner pour chaque cas
void setup ()  
{
size (200,200,P2D);  // zone graphique 200x200
}
void draw()
{
//************* pour faire changer la variable avec la souris ***********
// a modifier ou effacer en cas d un autre usage
 temp= temp+ ((-mouseY+100)/50) ;
 if (temp>150) {temp=150;}  // airspeed max 300
 if (temp<0) {temp=0;}  // airspeed min 0

 // ************* dessin des arcs *****************************
background (0);   //  fond noir
stroke (255);    // trait blanc
fill (90,90,90);  // background gris , c est des valeurs en R,G,B
pushMatrix();      // matrice ;l origine est en haut a gauche
                  // mais tout ce qui est entre push matrix et popmatrix sera decale dans le nouveau repere
translate (100,100);   // on bouge l origine de la matrice au centre, en 100,100, au centre
strokeWeight(4);     //  epaisseur trait 4
stroke (0,255,0);    //  couleur verte
arc(0,0,180,180,HALF_PI,PI+QUARTER_PI);  // arc vert, c est en radians
stroke (240,115,3);  // couleur orange
strokeWeight(6);     //  epaisseur trait 6
arc(0,0,178,178,PI+QUARTER_PI,TWO_PI-QUARTER_PI); // arc orange
stroke (255,0,0); // couleur rouge
strokeWeight(10);   //  epaisseur trait 10
arc(0,0,175,175,TWO_PI-QUARTER_PI,TWO_PI);  // arc rouge
stroke (0);  // trait noir
fill(0); // dessin en noir
arc(0,0,100,100,HALF_PI,TWO_PI); // arc noir pour effacer le centre
stroke(#0096c9);    //  couleur bleu roi  pour le texte
strokeWeight(5);  // epaisseur 5
textSize(25);  //  texte taille 25
fill(#0096c9); //  texte en bleu
 text ("TEMP",10,40); 
 text (int(temp), 30, 70); 

/**   notes ;
arc(a, b, c, d, start, stop)
a   float: x-coordinate of the arc's ellipse
b   float: y-coordinate of the arc's ellipse
c   float: width of the arc's ellipse by default
d   float: height of the arc's ellipse by default
start   float: angle to start the arc, specified in radians
stop   float: angle to stop the arc, specified in radians
*/
// 
// ************* Et maintenant l aiguille ...**********************
pushMatrix();      // matrice pour la rotation
{
rotate(radians(temp*facteur));// tout ce qui est place apres pivote de cette valeur ...
stroke (255,0,0); // couleur rouge
line (0,0,0,100);  // ca c est une ligne simple
                  // ********* ou **********
beginShape();   // ici, une aiguille plus complexe
vertex (0,-10);
vertex (10,0);
vertex (0,100);
vertex (-10,0);
vertex (0,-10);
endShape();  //  fin de l aiguille
}
popMatrix();  // reset de la matrice rotation
 /**  
 // XXXXXXXXXXXXXXXXXXXXXXXXXXXX TEST XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  stroke(255, 0,255);    //  index mauve pour  positionner les elements, a effacer
  strokeWeight(2);
  line (-100,-100,500,500);
  stroke(100,250,100);
  line (-100,100,100,-100);  // croix 
  ellipse(0,0,25,25);
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 */

popMatrix();  // fin de la premiere matrice
}
