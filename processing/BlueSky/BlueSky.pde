void setup() {
  size(500, 500);
}

float yoff = 0;
float z = 0;

void draw() {
  background(0);
  
  noiseDetail(8, 1.0*mouseY/height);
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float n = noise(1.5*x/width, yoff + 1.5*y/height, z);
      pixels[y*width + x] = color(n*255, n*255, 255);
    }
  }
  updatePixels();
  yoff += -0.01;
  z += 0.002;
}