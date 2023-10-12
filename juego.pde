void juego() {
  resetearRandom();
  tiempoDeEspera();
  obstaculo.impulsarObjetos();
  moverAstronauta();
  vidas();
  cuentaRegresivaDanio();
  cambiarPantalla();

  temporizador();

  vida.dibujarVida(puntos);
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
    fx=round(random(-100000, 100000));
    fy=round(random(-100000, 100000));
    randomOff = true;
  }
}

void verColisiones() {
  ArrayList<FContact> contacts = c1.getContacts();
  for (int i = 0; i < contacts.size(); i++) {
    FContact fc = contacts.get(i);
    if (fc.contains("obstaculo")) {
      if (refreshDanio == false) {
        colision.play();
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
  image(fondoContador, 0, 0);
  fondoContador.resize(200, 100);
  tiempoDeJuego();
  pushStyle();
  textFont(pixeloid);
  fill(250, 25, 50);
  text ("00:"+nf(segundos, 2), 55, 65);
  popStyle();
}

void vidas() {
  verColisiones();
}
