class Estrella {
  PImage estrella;
  int tam;
  int x;
  int y;

  Estrella(int _posX, int _posY, int _tam) {
    x = _posX;
    y = _posY;
    tam = _tam;
    estrella = loadImage("estrella.png");
  }

  void dibujarEstrella(int _posX) {
    int posX = _posX;
    image(estrella, posX, y);
    estrella.resize(tam, tam);
  }
}

class Vida {
  Estrella estrella [];
  int vida;
  int tam = 70;
  int posX = 580;
  int posY = 15;


  Vida(int _vida) {
    vida = _vida;
    estrella = new Estrella [vida];
    for (int i = 0; i < vida; i++) {
      estrella[i]= new Estrella(posX, posY, tam);
    }
  }

  void dibujarVida(int _vida) {
    int puntos = _vida;
    for (int i = 0; i < puntos; i++) {
      int largo = round(map(i, posX, 275, posX, width-puntos*tam/2-20));
      int x = round(map(i, puntos, 0, posX, largo));
      estrella[i].dibujarEstrella(x);
      
    }
  }
}
