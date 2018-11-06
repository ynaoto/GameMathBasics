float[] th = { 0, 0, 0 };
float[] dt = { 0.1, 0.2, 0.3 };

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  float x = width/2, y = height/2;
  float r = 100;

  for (int i = 0; i < 3; i++) {  
    translate(x, y);
    x = r*cos(PI*cos(th[i])/4);
    y = r*sin(PI*cos(th[i])/4);
    line(0, 0, x, y);
    th[i] += dt[i];
  }
}

