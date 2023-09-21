PImage astronaut;

void crearPJ(){
  astronaut = loadImage ("astronaut2.png");
  c1 = crearEsfera(posX, height-400, 20, color(255, 0, 0));
  
  c1.setDamping(1);
  astronaut.resize (100,120);
  c1.attachImage(astronaut);
  c1.setRotatable(false);
  
  world.add(c1);
}
