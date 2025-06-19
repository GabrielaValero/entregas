int incrementos = 50;
int posX = 0;
int speedX = 6;

void setup() {
  size(1000, 1000);
  background(0,0,0);
  noStroke();
  frameRate(30); 
}

void draw() {
  // Colores random
  if (frameCount % speedX == 0) {
    background(0,0,0);
    
    // Bucle para hacer los triángulos
    for (int y = 0; y <= height; y += incrementos) {
      for (int x = 0; x <= width; x += incrementos) {
        fill(random(150, 255), random(100, 255), random(150, 200));
        triangle(x, y, x + incrementos, y, x + incrementos/2, y + incrementos);
      }
    }
  }
}
