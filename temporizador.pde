void tiempoRandom() {
  if (resetCuenta == false){
    cuenta=round(random(50,200));
    resetCuenta = true;
  }
}

void tiempoDeEspera(){
  tiempoRandom();
  if (cuenta >= 0){
  cuenta--;
  impulso = false;
  } else {
  resetCuenta = false;
  impulso = true;
  }  
}
