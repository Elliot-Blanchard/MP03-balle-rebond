float vitesseX = 15;
float posX = 25;
float vitesseY = 50;
float posY;
float grav = 0.7;
int timer = 0;
boolean YLock = false;
boolean mouseClick = false;
void setup() {
  posY = height - height/10;
  size (800,600);
  background(255);
  fill (128,128,128);
  noStroke();
  ellipse (posX,posY,20,20);
  frameRate(30);
}
void draw() {
  
  if (mouseClick == true){
  background(255);
  if (YLock == false) {
  vitesseY = vitesseY + grav;
  posY = posY + vitesseY;
  }
  if (YLock == true){
    vitesseX = vitesseX * 0.99;
  }
  posX = posX + vitesseX;
  noStroke();
  ellipse(posX, posY,20,20);
  if (timer < 10) {
    timer ++;
  }
    if (posX >= width - 12 || posX <= 12) {
      vitesseX = -vitesseX;
    }
    if (posY >= height - 12 && timer == 10) {
    if (vitesseY <= 5) {
      vitesseY = 0;
      YLock = true;
    }
    vitesseY =-(vitesseY * 0.7);
    vitesseX = vitesseX * 0.8;
    timer = 0;
  }
    if (posY <= 12 && vitesseY <= 0){
      vitesseY = -vitesseY;
    }
}
}

void mousePressed() {
  if (mouseClick == false){
  vitesseX = mouseX / 20;
  vitesseY = -(height - mouseY) / 20;
  mouseClick = true;
  }
}