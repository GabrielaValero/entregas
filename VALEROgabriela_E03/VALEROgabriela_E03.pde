// Gabriela Valero-202313995
// Entrega 3 
// Usar map() y colorMode()
//para esta entrega tomé de referencia el diseño de la interfaz de DVD video que es un rebote aleatorio del logotipo en cualquier parte de la pantalla junto con un cambio de color.
//para adicionar, usé dos formas geometricas para demostrar el cambio de forma para cumplir con los requisitos de la rubrica (color, posición y forma)

// código de posición y velocidad
float posX, posY;
float speedX = 4;
float speedY = 3;
int forma = 0; // 0 = elipse, 1 = cuadrado, 2 = triángulo

// Variable para guardar el color
color figuraColor;

// Tamaño de la figura
int tamaño = 100;

void setup() {
  size(1000, 1000);
  noStroke();
  colorMode(RGB, 255); 
  background(0,0,0);

  // Posiciones iniciales al centro
  posX = width / 2;
  posY = height / 2;

  // Color inicial
  figuraColor = color(random(255), random(255), random(255));
}

void draw() {
  background(0);

  // Actualizar posición
  posX = posX + speedX;
  posY = posY + speedY;

  // Rebotar horizontal
  if (posX >= width - tamaño/2 || posX <= tamaño/2) {
    speedX = speedX * -1;

    // Elegir figura geometrica aleatoria (0, 1 o 2)
    forma = int(random(3));

    // Color nuevo (random RGB)
    figuraColor = color(random(255), random(255), random(255));
  }

  // Rebotar vertical
  if (posY >= height - tamaño/2 || posY <= tamaño/2) {
    speedY = speedY * -1;

    // Elegir figura geometrica aleatoria (0, 1 o 2)
    forma = int(random(3));

    // Color nuevo random
    figuraColor = color(random(255), random(255), random(255));
  }

  // Aplicar el color random
  fill(figuraColor);

  //forma 
  if (forma == 0) {
    ellipse(posX, posY, tamaño, tamaño);
  } else if (forma == 1) {
    rectMode(CENTER);
    rect(posX, posY, tamaño, tamaño);
  } else if (forma == 2) {
    triangle(posX, posY - tamaño / 2,
             posX - tamaño / 2, posY + tamaño / 2,
             posX + tamaño / 2, posY + tamaño / 2);
  }
}

// no supe en que parte usar map pero la figura "cobró vida" :)
