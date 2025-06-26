// Gabriela Valero Fonseca - 202313995
// entrega-tiempo - “Reloj Solar Dinámico”
// Inspirado en "The Digital Architecture of Time Management" de Judy Wajcman

int centroX, centroY;

void setup() {
  size(600, 600);
  centroX = width / 2;
  centroY = height / 2 + 100;
  colorMode(RGB, 255);
  noStroke();
}

void draw() {
  // 1. Fondo dinámico: cambia según la hora (día a noche)
  float brillo = map(hour(), 0, 23, 20, 255);
  background(brillo, brillo, 255); // cielo azul claro u oscuro

  // 2. Suelo
  fill(80, 50, 30);
  rect(0, centroY, width, height - centroY);

  // 3. Base del reloj solar
  fill(100);
  rect(centroX - 50, centroY - 10, 100, 20);

  // 4. Triángulo gnomon (estructura que proyecta sombra)
  fill(200);
  triangle(centroX, centroY - 100, centroX - 10, centroY + 10, centroX + 10, centroY + 10);

  // 5. Posición del sol (según hora + minutos)
  float anguloSol = map(hour() + minute() / 60.0, 0, 24, PI, TWO_PI);
  float radioSol = 250;

  float xSol = centroX + cos(anguloSol) * radioSol;
  float ySol = centroY - 150 + sin(anguloSol) * 100;

  // 6. Sol
  fill(255, 220, 100);
  ellipse(xSol, ySol, 40, 40);

  // 7. Sombra proyectada desde el triángulo
  float dx = centroX - xSol;
  float dy = centroY - 100 - ySol;
  float mag = sqrt(dx * dx + dy * dy);
  dx /= mag;
  dy /= mag;

  float sombraX = centroX + dx * 150;
  float sombraY = centroY - 100 + dy * 150;

  fill(0, 0, 0, 100);
  triangle(centroX, centroY - 100, centroX, centroY, sombraX, sombraY);

  // 8. Círculo pulsante que representa los segundos
  float tamSeg = map(second(), 0, 59, 10, 50);
  fill(0, 0, 0, 80);
  ellipse(centroX, centroY - 150, tamSeg, tamSeg);

  // 9. Nube flotante decorativa (animación con segundos)
  float nubeX = map(second(), 0, 59, 50, width - 50);
  float nubeY = 100;
  fill(255);
  ellipse(nubeX, nubeY, 60, 40);
  ellipse(nubeX - 20, nubeY + 5, 40, 30);
  ellipse(nubeX + 20, nubeY + 5, 40, 30);
}
