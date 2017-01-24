float vitesseX = 15;
float posX = 25;
float vitesseY = 50;
float posY;
float grav = 0.7;
int timer = 0;
boolean YLock = false;
boolean mouseClick = false;
float coeffRebondX = 0.8;
float coeffRebondY = 0.8;
int tailleBalle = 20;
void setup() {
  posY = height - height/10;
  size (800,600); //on définit la taille de la fenêtre
  background(255);
  fill (128,128,128); // on créée la couleur et le style de la balle
  noStroke(); 
  ellipse (posX,posY,tailleBalle,tailleBalle); // on créée l'image originale de la balle
  frameRate(60); // on définit une vitesse fixe pour la simulation
}
void mousePressed() { //on clique pour lancer la balle
  if (mouseClick == false){ // on vérifie si la balle a  déjà été lancée
  vitesseX = mouseX / 20;  //Les coordonnées de la souris au moment du clic sont utilisées pour définir la vitesse de départ de la balle pour permettre différents lancers
  vitesseY = -(height - mouseY) / 20;
  mouseClick = true; // on modifié une variable booléenne pour dire que la balle a été lancée
  }
}
void draw() { // boucle principale qui permet le fonctionnement du programme
  
  if (mouseClick == true){ //Vérifie si on a cliqué pour lancer la balle
  background(255); // on replace le fond de la fenêtre pour effacer les instances précédentes de la balle
  if (YLock == false) { // on vérifie si la balle a arrêté de rebondir
  vitesseY = vitesseY + grav; //on modifie la valeur de la vitesse verticale pour y ajouter l'accélération gravitationnelle
  posY = posY + vitesseY; // on modifie la position de la balle en fonction de la vitesse
  }
  if (YLock == true){ // si la balle a arrté de rebondir on modifie seulement sa vitesse horizontale
    vitesseX = vitesseX * 0.99;
  }
  posX = posX + vitesseX; // la balle se déplace horizontalement quel que soit son état (en l'air ou roulant au sol)
  ellipse(posX, posY,tailleBalle,tailleBalle); // on dessine la balle à son nouvel emplacement
  if (timer < 10) { 
    timer ++;// on définit un temps entre les rebonds pour éviter les "doubles rebonds" qui font passer la balle au travers du sol
  }
    if (posX >= width - (tailleBalle / 2) + 2 || posX <= 12) {   // on créée un rebond contre le mur
      vitesseX = -vitesseX * coeffRebondX;
      vitesseY =vitesseY * coeffRebondY;
    }
    if (posY >= height - (tailleBalle / 2) + 2 && timer == 10) { // on définit un rebond au sol
    if (vitesseY <= 5) { // on définit une vitesse en dessous de laquelle la balle arrête de rebondir et se met à rouler
      vitesseY = 0;
      YLock = true;  //on indique au reste du programme que la balle ne rebondit plus
    }
    vitesseY =-vitesseY * coeffRebondY;    // on change le sens du vecteur vitesse afin de correspondre à la vitesse après le rebond
    vitesseX = vitesseX * coeffRebondX;
    timer = 0; // on remet le compteur de temps entre deux rebonds à 0
  }
    if (posY <= (tailleBalle / 2) + 2 && vitesseY <= 0){ // la balle peut aussi rebondir contre le plafond
      vitesseY = -vitesseY * coeffRebondY;
      vitesseX = vitesseX * coeffRebondX;
    }
}
}
