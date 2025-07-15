// Gabriela Valero 202313995
// El gato se mueve con flechas y persigue a un ratón.
// Cuando el gato lo alcanza y se lo "come", su barriga crece y el ratón reaparece en otro lado.
// El gato maúlla al moverse y el ratón chilla al ser atrapado.

Gato miGato;
Raton miRaton;
int puntos = 0;
PFont fuente;

void setup() {
  size(1000, 800);
  fuente = createFont("Arial", 24);
  textFont(fuente);
  miGato = new Gato(color(#E0DBD5), 100, height - 150, 6);
  miRaton = new Raton(color(#73705B), random(200, width - 100), random(height - 200));
}

void draw() {
  dibujarFondo();

  miRaton.display();
  miGato.display();

  // Mostrar puntos
  fill(0);
  text("Puntos: " + puntos, 20, 40);

  // si el gato toca el raton
  float distancia = dist(miGato.posX, miGato.posY, miRaton.posX, miRaton.posY);
  if (distancia < 60) {
    miGato.comer();
    miRaton.reaparecer();
    miRaton.chillar(); // Onomatopeya del ratón
    puntos++;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    miGato.posX -= miGato.velocidad;
    miGato.maullar();
  }
  if (keyCode == RIGHT) {
    miGato.posX += miGato.velocidad;
    miGato.maullar();
  }
  if (keyCode == UP) {
    miGato.posY -= miGato.velocidad;
    miGato.maullar();
  }
  if (keyCode == DOWN) {
    miGato.posY += miGato.velocidad;
    miGato.maullar();
  }
}

void mousePressed() {
  puntos = 0;
  miGato.estomago = 40;
  println("Juego reiniciado");
}

// -------------------------------------------------
// fondo, estética

void dibujarFondo() {
  noStroke();

  // Cielo degradado
  for (int i = 0; i < height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(#F2CED8, #9A8FBF, inter);
    stroke(c);
    line(0, i, width, i);
  }

  // Nubes
  noStroke();
  fill(255, 230);
  ellipse(200, 100, 150, 60);
  ellipse(250, 100, 120, 70);
  ellipse(300, 100, 130, 65);
  ellipse(700, 130, 180, 80);
  ellipse(740, 130, 130, 70);
  ellipse(780, 130, 140, 75);

  // Pasto
  noStroke();
  fill(#375915);
  rect(0, height - 120, width, 120);
  fill(#638C26);
  rect(0, height - 100, width, 100);

  // Flores
  for (int i = 30; i < width; i += 80) {
    fill(#284011);
    rect(i, height - 115, 4, 20); // tallo

    fill(#F2A7A0); // pétalos
    ellipse(i, height - 125, 10, 10);
    fill(#6B90BF);
    ellipse(i + 5, height - 120, 10, 10);
    fill(#1C618C);
    ellipse(i - 5, height - 120, 10, 10);
    fill(#510273);
    ellipse(i, height - 130, 10, 10);
    fill(255, 220, 100); // centro
    ellipse(i, height - 123, 5, 5);
  }
}

// -------------------------------------------------
// Clase Animal (padre)

class Animal {
  color c;
  float posX, posY;

  void display() {
  }
}

// -------------------------------------------------
// Clase Gato

class Gato extends Animal {
  float velocidad;
  float estomago = 40;

  Gato(color tempC, float tempX, float tempY, float tempVel) {
    c = tempC;
    posX = tempX;
    posY = tempY;
    velocidad = tempVel;
  }

  void comer() {
    estomago += 5;
    if (estomago > 100) estomago = 40;
  }

  void maullar() {
    println("¡Miau!");
  }

  void display() {
    noStroke();
    fill(c);

    // Cuerpo
    ellipse(posX, posY, estomago + 60, estomago + 40);

    // Patas
    fill(#C4BDB3);
    ellipse(posX - 20, posY + 25, 15, 10);
    ellipse(posX + 20, posY + 25, 15, 10);

    // Cabeza
    fill(c);
    ellipse(posX + 40, posY - 30, 50, 50);

    // Orejas
    fill(#CFCBC2);
    triangle(posX + 30, posY - 50, posX + 35, posY - 70, posX + 40, posY - 50);
    triangle(posX + 50, posY - 50, posX + 55, posY - 70, posX + 60, posY - 50);
    fill(#7E7F77);
    triangle(posX + 33, posY - 53, posX + 35, posY - 67, posX + 38, posY - 53);
    triangle(posX + 53, posY - 53, posX + 55, posY - 67, posX + 58, posY - 53);

    // Ojos
    fill(255);
    ellipse(posX + 35, posY - 30, 10, 10);
    ellipse(posX + 45, posY - 30, 10, 10);
    fill(0);
    ellipse(posX + 35, posY - 30, 4, 4);
    ellipse(posX + 45, posY - 30, 4, 4);

    // Nariz
    fill(#F2BBD9);
    noStroke();
    triangle(posX + 36, posY - 23, posX + 44, posY - 23, posX + 40, posY - 18);

    // Cola
    stroke(#E0DCD3);
    strokeWeight(6);
    noFill();
    bezier(posX - 50, posY, posX - 80, posY - 10, posX - 60, posY + 30, posX - 90, posY + 20);
  }
}

// -------------------------------------------------
// Clase Raton

class Raton extends Animal {

  Raton(color tempC, float tempX, float tempY) {
    c = tempC;
    posX = tempX;
    posY = tempY;
  }

  void reaparecer() {
    posX = random(100, width - 100);
    posY = random(150, height - 150);
  }

  void chillar() {
    println("¡Squeak squeak!");
  }

  void display() {
    noStroke();
    fill(c);

    // Cuerpo
    ellipse(posX, posY, 50, 30);

    // Cabeza
    ellipse(posX + 20, posY, 25, 25);

    // Orejas
    fill(#595044);
    ellipse(posX + 15, posY - 12, 10, 10);
    ellipse(posX + 15, posY + 12, 10, 10);

    // Ojos
    fill(255);
    ellipse(posX + 23, posY - 5, 6, 6);
    fill(0);
    ellipse(posX + 23, posY - 5, 3, 3);

    // Nariz
    fill(0);
    ellipse(posX + 30, posY, 4, 4);

    // Cola
    stroke(#2A2927);
    strokeWeight(2);
    noFill();
    bezier(posX - 25, posY + 5, posX - 40, posY + 10, posX - 50, posY + 20, posX - 60, posY + 5);
  }
}
