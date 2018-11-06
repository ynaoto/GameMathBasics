float y, vy, ay;

void setup() {
  size(500, 500);
  y = width/2;
  vy = 0;
  ay = 0.1;
}

void draw() {
  background(255);
  line(0, 250, width, 250);
  ellipse(250, y, 50, 50);
  y += vy;
  if (height < y) {
    float d = y - height;
    y = height - d;
    vy *= -1;
  }
  vy += ay;
}

