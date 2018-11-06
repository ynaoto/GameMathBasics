float x, y, r;

void setup() {
  size(500, 500);
  x = y = 250;
  r = 100;
}

void draw() {
  background(255);
  float dx = mouseX - x;
  float dy = mouseY - y;
  if (dx*dx + dy*dy < r*r) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  ellipse(x, y, 2*r, 2*r);
}

