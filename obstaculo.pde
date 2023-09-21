PImage asteroide;

void crearObstaculo() {
  asteroide = loadImage ("asteroide4.png");

  obs1=  crearEsfera(random(50, 550), random(50, 550), 100, color(0, 200, 0));
  obs2=  crearEsfera(random(50, 550), random(50, 550), 100, color(0, 200, 0));
  obs3=  crearEsfera(random(50, 550), random(50, 550), 100, color(0, 200, 0));
  obs4=  crearEsfera(random(50, 550), random(50, 550), 100, color(0, 200, 0));
  obs5=  crearEsfera(random(50, 550), random(50, 550), 100, color(0, 200, 0));

  obs1.setDamping(0);
  obs2.setDamping(0);
  obs3.setDamping(0);
  obs4.setDamping(0);
  obs5.setDamping(0);

  asteroide.resize(100,100);
  obs1.attachImage(asteroide);
  obs2.attachImage(asteroide);
  obs3.attachImage(asteroide);
  obs4.attachImage(asteroide);
  obs5.attachImage(asteroide);

  world.add(obs1);
  world.add(obs2);
  world.add(obs3);
  world.add(obs4);
  world.add(obs5);
}

void impulsarObjetos() {
  if (impulso == true) {
    obs1.addImpulse(fx, fy);
    obs2.addImpulse(-fx, fy);
    obs3.addImpulse(fx, -fy);
    obs4.addImpulse(-fx*2, -fy);
    obs5.addImpulse(fx, fy*2);
    randomOff = false;
  }
}
