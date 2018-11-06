void setup() {
  size(500, 500);
  colorMode(HSB, 1, 1, 1, 1);
}

float r = 0;
float th = 0;
float hue = 0;

void draw() {
  //background(0);
  float x = 250 + r*cos(th);
  float y = 250 + r*sin(th);
  fill(hue, 1, r/100, 0.5);
  ellipse(x, y, 20, 20);
  r += 1;
  th += 0.1;
  if (400 < r) {
    r = random(10);
    hue = random(1);
  }
}