float x, y;
  
void setup() {
  size(500, 500);
  x = width/2;
  y = height/2;
}

void draw() {
  background(255);
  float tx = mouseX;
  float ty = mouseY;
  ellipse(tx, ty, 30, 30);
  x += 0.1*(tx - x);
  y += 0.1*(ty - y);
  translate(x, y);
  float th = -atan2(x - tx, y - ty);
  rotate(th);
  //float th = atan2(y - ty, x - tx);
  //rotate(th - PI/2);
  //translate(-x, -y);
  //triangle(x, y - 10, x + 5, y + 10, x - 5, y + 10);
  triangle(0, -30, 20, 30, -20, 30);
}

