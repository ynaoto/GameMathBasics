void setup() {
  size(400, 400);
}

void draw() {
  background(100);
  translate(width/2, height/2);
  for (float theta = 0; theta < 2*PI; theta += PI/8) {
    ellipse(100*cos(theta), 100*sin(theta), 10, 10);
  }
}

