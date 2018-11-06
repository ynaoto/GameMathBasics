void setup() {
  size(600, 600, P3D);
  noStroke();
  colorMode(HSB, 1, 1, 1);
}

float th = 0;

void draw() {
  background(0);
  lights();
  translate(width/2, height-20, 0);
  beginCamera();
  camera(0, 0, 1000, 0, 0, 0, 0, 1, 0);
  rotateX(5*th);
  endCamera();
  for (int i = 0; i < 1000; i++) {
    fill(i/1000.0, 1, 1);
    box(10);
    rotateY(th*10*PI/180);
//    translate(0.05*i, -1, 0);
    float a = 0.01*i;
//    translate(a*a*a, -1, 0);
    translate(a*a*a, 10*cos(i*PI/180), 0);
  }
  th += 0.001;
}
