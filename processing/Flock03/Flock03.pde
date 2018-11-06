float x, y;
float x1, y1;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  ellipse(mouseX, mouseY, 50, 50);
  x += 0.1*(mouseX - x);
  y += 0.1*(mouseY - y);
  ellipse(x, y, 50, 50);
  x1 += 0.1*(x - x1);
  y1 += 0.1*(y - y1);
  ellipse(x1, y1, 50, 50);
}

