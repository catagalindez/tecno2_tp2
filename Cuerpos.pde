FCircle crearEsferaRaw(float x, float y, float t, color c, float g, boolean e, PImage img) {
  FCircle main = new FCircle(t);
  main.setPosition(x, y);
  main.setVelocity(0, 0);
  main.setFillColor(c);
  main.setStatic(e);
  float r = (t/20)/2;
  main.setDensity(g/(PI*r*r));
  main.setNoStroke();
  main.attachImage(img);
  return main;
}

FCircle crearEsfera(float x, float y, float t, color c, PImage img) {
  return crearEsferaRaw(x, y, t, c, 100, false, img);
}
