float cx, cy;
float x, y;
float vx, vy;

void setup() {
  size(500, 500);
  cx = x = width/2;
  cy = y = height/2;
  vx = vy = 0;
}

void draw() {
  background(0);
  ellipse(cx, cy, 400, 400);
  if (mousePressed) {
    x = mouseX;
    y = mouseY;
  } else {
    float k = 0.1;
    float d = 0.3;
    float m = 5;
    float fx = k*(cx - x) - d*vx;
    float fy = k*(cy - y) - d*vy;
    vx += fx/m;
    vy += fy/m;
    x += vx;
    y += vy;
  }
  //fill(#F2ABAB);
  ellipse(x, y, 70, 70);
}
