// Gabriela Valero 202313995 - Entrega 6
// Historia interactiva con imágenes (inicio, clímax, desenlace)

PImage img;         // Imagen actual
int index = 0;      // Estado actual: 0=inicio, 1=clímax, 2=desenlace

void setup() {
  size(1000, 1000);
  loadImageEvent(index);  // Cargar imagen inicial
}

void draw() {
  background(255);       // Fondo
  image(img, 0, 0, width, height);  // Mostrar imagen actual
}

void keyPressed() {
  // Avanzar al siguiente momento con flecha ABAJO o barra espaciadora
  if (keyCode == DOWN || key == ' ') {
    index++;
    if (index > 2) index = 2;  // Limitar al desenlace
    loadImageEvent(index);
  }

  // Retroceder con flecha ARRIBA
  if (keyCode == UP) {
    index--;
    if (index < 0) index = 0;  // Limitar al inicio
    loadImageEvent(index);
  }
}

// Función que carga la imagen  segun el orden 
void loadImageEvent(int i) {
  switch (i) {
    case 0:
      println("Inicio - La apuesta entre La Muerte y Xibalba");
      img = loadImage("inicio.jpg");
      break;
    case 1:
      println("Clímax - Manolo muere y viaja al más allá");
      img = loadImage("climax.jpg");
      break;
    case 2:
      println("Desenlace - Manolo regresa, María lo elige");
      img = loadImage("desenlace.jpg");
      break;
  }
}
