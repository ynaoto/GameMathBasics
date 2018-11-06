void setup() {
  size(500, 500);
}

float easeIn(float x) {
  return x*x;
}

float easeOut(float x) {
  x -= 1;
  return 1 - x*x;
}

float easeInOut(float x) {
  if (x < 0.5) {
   return easeIn(2*x)/2;
  }
  return easeOut(2*(x - 0.5))/2 + 0.5;
}

float BezierBlend(float t)
{
    return t*t*(3.0 - 2.0*t);
}

float easeBack_f(float x) {
  return -x*x*x + 4.0*x;
}

float easeBack(float x){
  float x0 = -1.5;
  float y0 = easeBack_f(x0);
  float x1 = 1.5;
  float y1 = easeBack_f(x1);
  float y = easeBack_f(map(x, 0, 1, x0, x1));
  return map(y, y0, y1, 0, 1);
}

float f(float x) {
  //return x;
  return easeIn(x);
  //return easeBack(x);
}

float s = 0.00;

void draw() {
  //background(255);
  fill(255, 10);
  rect(0, 0, width, height);
  
  int x1 = 100, y1 = 200;
  int w1 = 50, h1 = 50;
  int x2 = 400, y2 = 200;
  int w2 = 50, h2 = 50;
  
  fill(255, 0, 0);
  rect(x1, y1, w1, h1);
  fill(0, 255, 0);
  rect(x2, y2, w2, h2);

  s += 0.01;
  if (1 <= s) {
    s = 0;
  }
  float t = f(s);
  
  float miny = -0.5;
  float maxy = 1.5;
  int px = (int)map(s, 0, 1, 0, width); 
  int py = (int)map(t, miny, maxy, height, 0); 
  line(px, map(0, miny, maxy, height, 0), px, py);
  float ly;
  ly = map(1, miny, maxy, height, 0);
  line(0, ly, width, ly);
  ly = map(0, miny, maxy, height, 0);
  line(0, ly, width, ly);
  
  float x = (1 - t)*x1 + t*x2;
  float y = (1 - t)*y1 + t*y2;
  float w = (1 - t)*w1 + t*w2;
  float h = (1 - t)*h1 + t*h2;
  fill(0, 0, 255, 100);
  rect(x, y, w, h);
}