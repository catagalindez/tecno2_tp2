import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import netP5.*;
import oscP5.*;
import fisica.*;
Minim minim;
AudioPlayer musica;
AudioPlayer intro;
AudioPlayer ganar;
AudioPlayer perder;
AudioPlayer colision;
AudioPlayer victoria;

Obstaculo obstaculo;
Astronauta astronauta;
Nave nave;
Vida vida;

int PUERTO_OSC = 12345;

Receptor receptor;

PImage fondo1, fondo2, fondo3, fondo4, fondo5;
PFont pixeloid;

PImage fondoContador;

FWorld world;
FCircle c1;
FCircle obs1,obs2,obs3,obs4,obs5,obs6;

float x = 300;
float y = 800;
float  diam = 20;

boolean randomOff = false;
boolean resetCuenta = false;
boolean impulso = false;
boolean derecha;
boolean izquierda;
boolean arriba;
boolean abajo;
boolean refreshDanio = false;
int cuentaDanio = 200;
int cuenta;
int fx;
int fy;
int puntos = 5;
int puntosParaPerder = 0;
int segundos = 30;


int pantalla = 1;

void setup() {
  size(600, 1000);

  astronauta = new Astronauta(x, y, diam);
  obstaculo = new Obstaculo();
  nave = new Nave();
  vida = new Vida(puntos);

  fondo1 = loadImage("inicio.jpeg");
  fondo2 = loadImage("instrucciones.jpeg");
  fondo3 = loadImage("espacio1.jpg");
  fondo4 = loadImage("perder.jpg");
  fondo5 = loadImage("ganar.jpg");

  fondoContador = loadImage("timer.png");

  pixeloid = createFont("PixeloidSans.ttf", 32);

  minim = new Minim(this);
  musica = minim.loadFile("musica.wav");
  ganar = minim.loadFile("ganar.wav");
  perder = minim.loadFile("perder.wav");
  intro = minim.loadFile("intro.mp3");
  colision = minim.loadFile("colision.wav");
  victoria = minim.loadFile("victoria.mp3");
    

  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.setGravity(0, 0);

  setupOSC(PUERTO_OSC);
  receptor = new Receptor();

  astronauta.crearPJ();
  obstaculo.crearObstaculo();
}

void draw() {
  background(255);
  //INICIO
  if (pantalla == 1) {
    fondo1.resize(width, height);
    image (fondo1, 0, 0);
    musica.play();
    victoria.rewind();
    intro.rewind();
  }
  //INSTRUCCIONES
  else if (pantalla ==2) {
    fondo2.resize(width, height);
    image(fondo2, 0, 0);
    victoria.rewind();
    intro.rewind();

  }
  //JUEGO
  else if (pantalla ==3) {
    fondo3.resize(width, height);
    image(fondo3, 0, 0);
    //cosas que se inician cuando empieza el juego
    intro.play();
    musica.rewind();
    victoria.rewind();
    world.step();
    world.draw();

    nave.dibujar();
    juego();
    lugarDeCara();
  }
  //PERDER
  else if (pantalla == 4) {
    fondo4.resize(width, height);
    image(fondo4, 0, 0);
    segundos = 30;
    perder.play();
    intro.rewind();
    musica.rewind();
    victoria.rewind();
  } else if (pantalla == 5) {
    fondo5.resize(width, height);
    image(fondo5, 0, 0);
    segundos = 30;
    ganar.play();
    intro.rewind();
    musica.rewind();
    victoria.play();
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    c1.addForce(100000, 0);
  }
  if (keyCode == LEFT) {
    c1.addForce(-100000, 0);
  }
  if (keyCode == UP) {
    c1.addForce(0, -100000);
  }
  if (keyCode == DOWN) {
    c1.addForce(0, 100000);
  }


  if ( pantalla == 1 && keyCode == 'i' || keyCode == 'I' ) {
    pantalla = 2;
  }
  if ( pantalla == 2 && keyCode == 'c' || keyCode == 'C' ) {
    pantalla = 3;
  }
  if ( pantalla == 5 || pantalla == 4 && keyCode == ' ') {
    pantalla = 1;
  }
}

void moverAstronauta() {
  if (derecha == true && izquierda == false) {
    c1.addForce(20000, 0);
  }
  if (izquierda == true && derecha == false) {
    c1.addForce(-20000, 0);
  }
  if (arriba == true && abajo == false) {
    c1.addForce(0, -20000);
  }
  if (abajo == true && arriba == false) {
    c1.addForce(0, 20000);
  }
}
