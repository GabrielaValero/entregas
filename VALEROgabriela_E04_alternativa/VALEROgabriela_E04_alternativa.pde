// Gabriela Valero Fonseca- 202313995
// entrega-tiempo

// Posición del centro del reloj
int centroX, centroY;

void setup() {
  size(600, 600);
  centroX = width / 2;
  centroY = height / 2;

  // Configuramos el modo de color RGB
  colorMode(RGB, 255);
  noStroke();
}

void draw() {
  background(0); // Fondo negro

  // 1. Dibujamos un círculo base gris oscuro
  fill(30);
  ellipse(centroX, centroY, 300, 300);

  // 2. Convertimos tiempo a ángulos con map()
  float anguloSec = map(second(), 0, 60, 0, TWO_PI);
  float anguloMin = map(minute(), 0, 60, 0, TWO_PI);
  float anguloHor = map(hour() % 12, 0, 12, 0, TWO_PI);


  // 3. Asignamos radios para cada "manecilla visual"
  float rSec = 130;
  float rMin = 100;
  float rHor = 70;

  // 4. Posición circular de cada figura
  float xSec = centroX + cos(anguloSec - HALF_PI) * rSec;
  float ySec = centroY + sin(anguloSec - HALF_PI) * rSec;

  float xMin = centroX + cos(anguloMin - HALF_PI) * rMin;
  float yMin = centroY + sin(anguloMin - HALF_PI) * rMin;

  float xHor = centroX + cos(anguloHor - HALF_PI) * rHor;
  float yHor = centroY + sin(anguloHor - HALF_PI) * rHor;

  // 5. Colores dinámicos con map(), RGB
  float r = map(second(), 0, 59, 100, 255);
  float g = map(minute(), 0, 59, 100, 255);
  float b = map(hour(), 0, 23, 100, 255);

  // 6. Dibujamos cada forma según su tiempo
  fill(r, 80, 80);        // segundos (círculo pequeño)
  ellipse(xSec, ySec, 15, 15);

  fill(80, g, 80);        // minutos (círculo mediano)
  ellipse(xMin, yMin, 25, 25);

  fill(80, 80, b);        // horas (círculo más grande)
  ellipse(xHor, yHor, 35, 35);
}
