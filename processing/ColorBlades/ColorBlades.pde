void setup() {
  size(600, 600, P3D);
  colorMode(HSB, 1, 1, 1);
  noStroke();
}

float th = 0;

void draw() {
  background(0);
  translate(width/2, height-20, 0);
  lights();
  beginCamera();
  camera(0, 0, 900, 0, -500, 0, 0, 1, 0);
  endCamera();
  rotateY(th);
  th += 0.01;
  for (int i = 0; i < 300; i++) {
    float a = i/300.0;
    fill(a, 1, 1);
    float w = 500*cos(10*th*a) + 100;
    box(w, 5, w);
    translate(0, -3, 0);
    rotateY(10*PI/180);
  }
}
