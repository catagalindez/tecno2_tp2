class Nave {
  color relleno = 200;
  PImage imgNave;
  int posX = width/2;
  int posY = -height-height/3;

  Nave() {
    imgNave = loadImage("nave.png");
  }

  void dibujar() {
    dibujarNave();
    mover();
  }

  void dibujarNave() {
    pushStyle();
    imageMode(CENTER);
    image(imgNave, posX, posY);
    popStyle();
  }

  void mover() {
    if (posY < height/2) {
      posY ++;
    }
  }

  void reiniciar () {
    posY = -height-height/3;
  }
}
