float f(float x) {
  //return -2*x*x + 0.5;
  return -2*x*x*x + 1*x*x + 0.2;
  //return cos(5*x);
}

int mx(float x) {
  return (int)map(x, -1, 1, 0, width);
}

int my(float y) {
  return (int)map(y, -1, 1, 0, height);
}

void drawAxis() {
  background(255);
  stroke(0);
  line(mx(-1), my(0), mx(1), my(0));
  line(mx(0), my(1), mx(0), my(-1));
  float lastGy = 0;
  for (int gx = 0; gx < width; gx++) {
    float x = map(gx, 0, width, -1, 1);
    float y = f(x);
    int gy = my(y);
    if (0 < gx) {
      line(gx - 1, lastGy, gx, gy);
    }
    lastGy = gy;
  }
}

void setup() {
  size(500, 500);
  colorMode(HSB);
  drawAxis();
  frameRate(5);
}

boolean start = false;
boolean inProgress = false;
float x;
int itr;

float newton() {
  float y = f(x);
  line(mx(x), my(0), mx(x), my(y));
  float e = 0.000001;
  float a = (f(x + e) - y)/e;
  float b = y - a*x;
  float x2 = -b/a;
  line(mx(x), my(y), mx(x2), my(0));
  return x2;
}

void draw() {
  if (start) {
    drawAxis();
    stroke(0, 255, 255);
    x = map(mouseX, 0, width, -1, 1);
    itr = 0;
    start = false;
    inProgress = true;
  }
  if (inProgress) {
    x = newton();
    if (10 < itr++) {
      inProgress = false;
    }
  }
}

void mousePressed() {
  start = true;
}