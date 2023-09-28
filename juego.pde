void juego() {
  resetearRandom();
  tiempoDeEspera();
  obstaculo.impulsarObjetos();
  moverAstronauta();
  vidas();
  cuentaRegresivaDanio();
  cambiarPantalla();

  temporizador();

  println("punto: "+puntos+" refresh: "+refreshDanio+" "+segundos);
}

void lugarDeCara() {
  receptor.actualizar(mensajes); //  
  //receptor.dibujarBlobs(width, height);
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

void resetearRandom() {
  if (randomOff == false) {    
    fx=round(random(-50000, 50000));
    fy=round(random(-50000, 50000));
    randomOff = true;
  }
}

void verColisiones() {
  ArrayList<FContact> contacts = c1.getContacts();
  for (int i = 0; i < contacts.size(); i++) {
    FContact fc = contacts.get(i);
    if (fc.contains("obstaculo")) {
      if (refreshDanio == false) {
        puntos--;
        refreshDanio = true;
      }
    }
  }
}

void cambiarPantalla() {
  if ( pantalla == 3 && puntos == puntosParaPerder) {
    pantalla = 4;
    puntos = 5;
    nave.reiniciar();
  }
  if ( pantalla == 3 && segundos == 0 ) {
    pantalla = 5;
    puntos = 5;
    nave.reiniciar();
  }
}

void temporizador() {
  tiempoDeJuego();
  pushStyle();
  textFont(pixeloid);
  fill(225, 25, 25);
  text ("Tiempo: "+segundos, 30, 50);
  popStyle();
}

void vidas() {
  verColisiones();
  pushStyle();
  textFont(pixeloid);
  fill(225, 25, 25);
  text ("Vidas: "+puntos, 450, 50);
  popStyle();
}
