void setup() {
  size(500, 500);
}

float yoff = 0;
float z = 0;

void draw() {
  background(0);
  
  stroke(255, 10);
  strokeWeight(50);
  noiseDetail(8, 1.0*mouseY/height);
  for (int y = 0; y < height; y += 10) {
    for (int x = 0; x < width; x += 10) {
      float n = noise(1.5*x/width, yoff + 1.5*y/height, z);
      pushMatrix();
      translate(x, y);
      rotate(n*2*PI);
      line(0, 0, 20, 20);
      popMatrix();
    }
  }
  yoff += -0.01;
  z += 0.002;
}