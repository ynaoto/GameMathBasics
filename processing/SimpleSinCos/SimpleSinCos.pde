float cx, cy;
float r, th;

void setup() {
  size(500, 500);
  cx = width/2;
  cy = height/2;
  r = 200;
  th = 0;
}

void draw() {
  background(0);
  fill(255, 255, 255);
  ellipse(cx + r*cos(th), cy + r*sin(th), 50, 50);
  fill(255, 0, 0);
  ellipse(cx, cy, r*cos(th), r*sin(th));
  th += 0.1;
}

