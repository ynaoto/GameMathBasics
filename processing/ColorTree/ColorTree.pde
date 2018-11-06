void setup() {
  size(600, 600);
  colorMode(HSB);
}
void tree(float d, float rth, float lth, int level) {
  if (d < 3) {
    return;
  }
  stroke(map(level, 0, 10, 0, 255) % 256, 255, 255);
  line(0, 0, 0, d);
  translate(0, d);
  rotate(rth);
  tree(0.7*d, rth, lth, level + 1);
  rotate(-rth);
  rotate(lth);
  tree(0.8*d, rth, lth, level + 1);
  rotate(-lth);
  translate(0, -d);
}
void draw() {
  background(255);
  translate(width/2, height);
  rotate(-PI);
  float rth = map(mouseX, 0, width-1, PI/4, -PI/4);
  float lth = map(mouseY, 0, height-1, -PI/4, PI/4);
  tree(100, rth, lth, 0);
}