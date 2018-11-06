float tx, ty, tr;

void setup() {
  size(600, 600);
}

void turn(float r) {
  tr += r;
}

void move(float d) {
  /*
  float x = d*cos(tr) + tx;
  float y = d*sin(tr) + ty;
  line(tx, ty, x, y);
  tx = x;
  ty = y;
  */
  line(0, 0, 0, d);
  translate(0, d);
}

float rth = -PI/4;
float lth = PI/4;

void tree(float d) {
  if (d < 3) {
    return;
  }
  /*
  move(d);
  turn(rth);
  tree(0.7*d);
  turn(-rth);
  turn(lth);
  tree(0.7*d);
  turn(-lth);
  move(-d);
  */
  move(d);
  rotate(rth);
  tree(0.7*d);
  rotate(-rth);
  rotate(lth);
  tree(0.8*d);
  rotate(-lth);
  move(-d);
}

void draw() {
  background(255);
  /*
  tx = width/2;
  ty = height;
  tr = -PI/2;
  */
  translate(width/2, height);
  rotate(-PI);

  rth = map(mouseX, 0, width, PI/4, -PI/4);
  lth = map(mouseY, 0, height, -PI/4, PI/4);
  
  tree(100);
}

