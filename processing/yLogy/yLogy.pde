float a = 300;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  if (mousePressed) {
    a = 3*mouseY;
  }
  float r = 1 - (float)mouseX/width;
  for (int gx = 0; gx < width; gx++) {
    float x = 1 - (float)gx/width;
    float dx, dy;
    float c;
    if (x < r) {
      dx = 1/(float)Math.E;
      dy = r;
      c = 0;
    } else {
      dx = 1-1/(float)Math.E;
      dy = 1-r;
      x -= r;
      c = 1/(float)Math.E;
    }
    x = x*dx/dy + c;
    float y = x*log(x);
    stroke(255, 0, 0);
  //line(gx, 0, gx, -a*y);
    line(0, gx, -a*y, gx);
  }
}

