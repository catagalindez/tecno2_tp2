class Obstaculo {
  int numImagenes = 4;
  PImage chatarraEspacial [];
  PImage randoImagen;
  float ancho, alto, x, y;

  Obstaculo() {
    chatarraEspacial = new PImage[numImagenes];
  }

  void crearObstaculo() {
    for (int i = 0; i < numImagenes; i++) {
      chatarraEspacial[i] = loadImage("chatarra"+i+".png");
    }

    obs1 = crearEsfera(random(50, 550), random(50, 550), 75, color(0, 200, 0), chatarraEspacial[2]);
    obs2 = crearEsfera(random(50, 550), random(50, 550), 100, color(0, 200, 0), chatarraEspacial[3]);
    obs3 = crearEsfera(random(50, 550), random(50, 550), 115, color(0, 200, 0), chatarraEspacial[1]);
    obs4 = crearEsfera(random(50, 550), random(50, 550), 130, color(0, 200, 0), chatarraEspacial[0]);
    obs5 = crearEsfera(random(50, 550), random(50, 550), 115, color(0, 200, 0), chatarraEspacial[1]);
    obs6 = crearEsfera(random(50, 550), random(50, 550), 130, color(0, 200, 0), chatarraEspacial[3]);

    obs1.setDamping(0);
    obs2.setDamping(0);
    obs3.setDamping(0.2);
    obs4.setDamping(0.5);
    obs5.setDamping(0);
    obs6.setDamping(0.1);

    chatarraEspacial[0].resize(130, 130);
    chatarraEspacial[1].resize(115, 115);
    chatarraEspacial[2].resize(75, 75);
    chatarraEspacial[3].resize(100, 100);

    obs1.setName("obstaculo");
    obs2.setName("obstaculo");
    obs3.setName("obstaculo");
    obs4.setName("obstaculo");
    obs5.setName("obstaculo");
    obs6.setName("obstaculo");

    world.add(obs1);
    world.add(obs2);
    world.add(obs3);
    world.add(obs4);
    world.add(obs5);
    world.add(obs6);
  }


  void impulsarObjetos() {
    if (impulso == true) {
      obs1.addImpulse(fx, fy);
      obs2.addImpulse(-fx, fy);
      obs3.addImpulse(fx, -fy);
      obs4.addImpulse(-fx*2, -fy);
      obs5.addImpulse(fx, fy*2);
      obs6.addImpulse(-fx,-fy*2);
      randomOff = false;
    }
  }
  boolean colision(float x_, float y_, float ancho_, float alto_) {
    if (y-alto/2 < y_+alto_/2 &&
      y+alto/2 > y_-alto_/2 &&
      x-ancho/2 < x_+ancho_/2 &&
      x+ancho/2 > x_-ancho_/2) {

      return true;
    } else {
      return false;
    }
  }

  void temp() {
  }
}
