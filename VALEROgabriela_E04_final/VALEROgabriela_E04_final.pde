// Gabriela Valero Fonseca - 202313995
// entrega 4-tiempo - “Reloj Solar”
// Inspirado en "The Digital Architecture of Time Management" de Judy Wajcman. 
//Para esta entrega creé un reloj solar digital usando figuras geométricas simples. En lugar de usar manecillas, texto o números, utilicé un triángulo como base que proyecta una sombra dependiendo de la posición del sol, el cual se mueve de acuerdo a la hora actual. También agregué una nube que se desplaza con los segundos y un círculo que cambia de tamaño para mostrar el paso del tiempo.
//quise representar el tiempo de una forma más visual, natural y tranquila, parecida a cómo funcionaban los relojes de sol antiguos

int centroX, centroY;

void setup() {
  size(600, 600);
  centroX = width / 2;
  centroY = height / 2 + 100;
  colorMode(RGB, 255);
  noStroke();
}

void draw() {
  // color de fondo
  background(217, 112, 20); // color del cielo (atardecer)

  // el piso
  fill(80, 50, 30);
  rect(0, centroY, width, height - centroY);

  // Base del reloj solar
  fill(100);
  rect(centroX - 50, centroY - 10, 100, 20);

  // Triángulo (estructura que proyecta sombra)
  fill(200);
  triangle(centroX, centroY - 100, centroX - 10, centroY + 10, centroX + 10, centroY + 10);

  //Posición del sol (según hora + minutos)
  float anguloSol = map(hour() + minute() / 60.0, 0, 24, PI, TWO_PI);
  float radioSol = 250;

  float xSol = centroX + cos(anguloSol) * radioSol;
  float ySol = centroY - 150 + sin(anguloSol) * 100;

  //Sol
  fill(255, 220, 100);
  ellipse(xSol, ySol, 40, 40);

  //Sombra proyectada desde el triángulo
  float dx = centroX - xSol;
  float dy = centroY - 100 - ySol;
  float mag = sqrt(dx * dx + dy * dy);
  dx /= mag;
  dy /= mag;

  float sombraX = centroX + dx * 150;
  float sombraY = centroY - 100 + dy * 150;

  fill(0, 0, 0, 100);
  triangle(centroX, centroY - 100, centroX, centroY, sombraX, sombraY);

  //Círculo que representa los segundos
  float tamSeg = map(second(), 0, 59, 10, 50);
  fill(0, 0, 0, 80);
  ellipse(centroX, centroY - 150, tamSeg, tamSeg);

  // Nube flotante para demostrar el movimiento (animación con segundos)
  float nubeX = map(second(), 0, 59, 50, width - 50);
  float nubeY = 100;
  fill(255);
  ellipse(nubeX, nubeY, 60, 40);
  ellipse(nubeX - 20, nubeY + 5, 40, 30);
  ellipse(nubeX + 20, nubeY + 5, 40, 30);
}
