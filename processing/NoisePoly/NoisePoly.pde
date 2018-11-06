void setup() {
  size(500, 500, P3D);
  colorMode(HSB, 1, 1, 1, 1);
}

float rx = 0;
float ry = 0;
float nz = 0;

void draw() {
  background(0);
  lights();

  translate(width/2, height/2);
  rotateX(rx);
  rx += 0.01;
  rotateY(ry);
  ry += 0.01;

  noStroke();
  fill(0, 0, 1);
  //box(200);
  
  for (int i = 0; i < 100; i++) {
    float r = 200;
    float th = i*2*PI/100; 
    for (int j = 0; j < 100; j++) {
      float ph = j*PI/100 - PI/2;
      float hue = 2*noise(th, ph, nz);
      float x = r*cos(th)*hue;
      float y = r*sin(th)*hue;
      pushMatrix();
      rotateY(ph);
      //text(hue, x, y);
      stroke(hue, 1, 1, 0.3);
      strokeWeight(20*hue*hue);
      point(x, y, 0);
      popMatrix();
    }
  }
  nz += 0.05;
}