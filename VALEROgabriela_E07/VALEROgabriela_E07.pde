//Gabriela Valero
//time_spent_alone: eje x, las personas con mayor tiempo solas se ubican a la derecha
//friends_circle_size: eje y las personas con mas amigos van mas alto
//azul son introvertidos y naranja extrovertidos
//los introvertidos se agrupan mas hacia la derecha-abajo, y los extrovertidos hacia la izquierda-arriba

Table table;
int nSamples;

float[] timeAlone;
float[] friendCircle;
String[] personality;

void setup() {
  size(1000, 1000);
  table = loadTable("personality_datasert.csv", "header");
  nSamples = table.getRowCount();
  
  timeAlone = new float[nSamples];
  friendCircle = new float[nSamples];
  personality = new String[nSamples];

  for (int i = 0; i < nSamples; i++) {
    timeAlone[i] = table.getFloat(i, "Time_spent_Alone");
    friendCircle[i] = table.getFloat(i, "Friends_circle_size");
    personality[i] = table.getString(i, "Personality");
  }
}

void draw() {
  drawWaveBackground(); // Fondo animado

  noStroke();
  for (int i = 0; i < nSamples; i++) {
    float x = map(timeAlone[i], 0, max(timeAlone), 80, width - 80);
    float y = map(friendCircle[i], 0, max(friendCircle), height - 80, 80);

    float baseSize = 10;
    float pulse = sin(frameCount * 0.05 + i * 0.2) * 3; // Movimiento dinámico para cada punto
    float size = baseSize + pulse;

    float d = dist(mouseX, mouseY, x, y);
    float alpha = (d < 15) ? 255 : 180;

    if (personality[i].equals("Introvert")) {
      fill(120, 160, 255, alpha);  // azul
    } else {
      fill(255, 170, 90, alpha);   // naranja
    }

    ellipse(x, y, size, size);
  }
}

// ----------------------
// Fondo con ondas
void drawWaveBackground() {
  background(15, 15, 30);
  
  stroke(255, 40);
  noFill();

  for (int y = 0; y <= height; y += 40) {
    beginShape();
    for (int x = 0; x <= width; x += 20) {
      float offset = sin(radians(x + frameCount)) * 10;
      vertex(x, y + offset);
    }
    endShape();
  }
}
