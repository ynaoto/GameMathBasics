float x, y;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  ellipse(mouseX, mouseY, 50, 50);
  x += 0.1*(mouseX - x);
  y += 0.1*(mouseY - y);
  ellipse(x, y, 50, 50);
}

