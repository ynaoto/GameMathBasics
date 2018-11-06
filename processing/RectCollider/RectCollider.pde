float x, y, w, h;

void setup() {
  size(500, 500);
  x = y = 250;
  w = h = 100;
}

void draw() {
  background(255);
  if (x < mouseX && mouseX < x + w
  && y < mouseY && mouseY < y + h) {
    fill(255, 0, 0);
  } else {
    fill(0);
  }
  rect(x, y, w, h);
}

