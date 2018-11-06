int level = 0;

void setup() {
  size(600, 600, P3D);
  colorMode(HSB);
  noStroke();
}

float rth = -PI/4;
float lth = PI/4;

void tree(float d) {
  if (d < 15) {
    return;
  }
  float hue = map(level, 0, 15, 0, 255);
  fill(hue % 256, 100, 255);
  translate(0, d/2, 0);
  level++;
  float w = 12/level;
  box(w, d, w);
  
  translate(0, d/2, 0);

  pushMatrix();
  rotateZ(rth);
  rotateX(30*PI/180);
  tree(0.7*d);
  popMatrix();
  
  pushMatrix();
  rotateZ(rth);
  rotateX(-30*PI/180);
  tree(0.8*d);
  popMatrix();

  pushMatrix();
  rotateZ(lth);
  rotateX(30*PI/180);
  tree(0.8*d);
  popMatrix();

  pushMatrix();
  rotateZ(lth);
  rotateX(-30*PI/180);
  tree(0.7*d);
  popMatrix();
  
  translate(0, -d, 0);
  
  level--;
}

float rx = 0;
float ry = 0;

void draw() {
  background(255);
  translate(width/2, height-100);
  rotate(-PI);
  lights();
  beginCamera();
  camera(0, 0, 300, 0, 100, 0, 0, -1, 0);
  rotateX(rx);
  rotateY(ry);
  endCamera();
  lth += 0.01*random(-1, 1);
  rth += 0.01*random(-1, 1);
  tree(100);
}

boolean rotating = false;

void mouseMoved() {
  if (rotating) {
    rx += PI*(mouseY - pmouseY)/360;
    ry -= PI*(mouseX - pmouseX)/360;
  }
  rotating = true;
}

void mouseDragged() {
  rth = map(mouseX, 0, width-1, PI/4, -PI/4);
  lth = map(mouseY, 0, height-1, -PI/4, PI/4);
}


