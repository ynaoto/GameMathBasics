void setup() {
  size(500, 500);
  background(255);
  frameRate(10000);
  stroke(255, 0, 0, 100);
}

void draw() {
  float x = random(-2, 2);
  float y = random(-2, 2);
  float a = x*x + y*y - 1;
  float b = a*a*a - x*x*y*y*y;
  if (b < 0) {
    float gx = map(x, -2, 2, 0, width);
    float gy = map(y, -2, 2, height, 0);
    strokeWeight(random(10));
    point(gx, gy);
  } 
}
