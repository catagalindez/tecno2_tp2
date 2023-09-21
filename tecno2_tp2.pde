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

int PUERTO_OSC = 12345;

Receptor receptor;

PImage fondo;

FWorld world;
FCircle c1;
FCircle obs1;
FCircle obs2;
FCircle obs3;
FCircle obs4;
FCircle obs5;

float xConMouseX=300;
boolean pjCreado = false;
float posX = 300;

boolean randomOff = false;
boolean resetCuenta = false;
boolean impulso = false;
boolean derecha;
boolean izquierda;
boolean arriba;
boolean abajo;
int cuenta;
int fx;
int fy;


void setup() {
  size(600, 1000);
  fondo = loadImage("espacio1.jpg");

  minim = new Minim(this);
  musica = minim.loadFile("musica.wav");

  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
  world.setGravity(0, 0);

  setupOSC(PUERTO_OSC);
  receptor = new Receptor();

  crearPJ();
  crearObstaculo();
}

void draw() {
  background(255);
  fondo.resize(width, height);
  image(fondo, 0, 0);

  musica.play();
  world.step();
  world.draw();
  resetearRandom();
  tiempoDeEspera();
  impulsarObjetos();
  moverAstronauta();



  receptor.actualizar(mensajes); //  
  //receptor.dibujarBlobs(width, height);


  // Eventos de entrada y salida
  for (Blob b : receptor.blobs) {
    println(b.centerY);
    if (b.centerX > 0.55) {
      derecha = true;
      izquierda = false;
    } else if (b.centerX < 0.45) {
      derecha = false;
      izquierda = true;
    }
    if (b.centerY < 0.40) {
      arriba = true;
      abajo = false;
    } else if (b.centerY > 0.75) {
      arriba = false;
      abajo = true;
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    c1.addForce(100000, 0);
  }
  if (keyCode == LEFT) {
    c1.addForce(-100000, 0);
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

void resetearRandom() {
  if (randomOff == false) {    
    fx=round(random(-50000, 50000));
    fy=round(random(-50000, 50000));
    randomOff = true;
  }
}
