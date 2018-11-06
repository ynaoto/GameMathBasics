float th = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  ellipse(250 + 200*cos(th), 250 + 100*sin(th), 50, 50);
  println(th);
  th += 0.1;
}

