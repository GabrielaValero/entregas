import processing.sound.*;

SoundFile SoundFile;
FFT fft;
int bands = 64; 
float[] spectrum = new float[bands];

void setup() {
  size(1000, 600);
  background(0);
  noStroke();
  frameRate(30);
  
  cancion = new SoundFile(this, "Wicked_Game.mp3");
  fft = new FFT(this, bands);
  fft.input(cancion);
  cancion.play();
}

int numCirculos = 60;  // número de bandas de frecuencia simuladas

  size(1000, 600);
  background(0);
  noStroke();
  frameRate(30);
}

void draw() {
  background(0, 20); // fondo con transparencia para efecto de rastro

  for (int i = 0; i < numCirculos; i++) {
    float x = map(i, 0, numCirculos, 0, width);

    // Movimiento lento, tipo "latido suave"
    float osc = sin(radians(frameCount * 1.2 + i * 12)) * 0.5 + 0.5;
    float size = map(osc, 0, 1, 20, 120);
    float offsetY = sin(radians(frameCount + i * 5)) * 25;

    // Capa de sombra suave (más grande y transparente)
    fill(80, 120, 200, 25);
    ellipse(x, height / 2 + offsetY, size + 15, size + 15);

    // Círculo principal con color más brillante
    fill(100 + i * 2, 150, 255, 90);
    ellipse(x, height / 2 + offsetY, size, size);
  }
}
