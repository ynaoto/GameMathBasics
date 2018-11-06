float[] x, y;
//float hue = 0;

void setup() {
  size(500, 500);
  x = new float[100];
  y = new float[100];
  //colorMode(HSB);
}

void draw() {
  background(255);
  //fill(hue, 255, 255);
  //hue = (hue + 1) % 256;
  int n = x.length;
  x[0] = mouseX;
  y[0] = mouseY;
  ellipse(x[0], y[0], 50, 50);
  for (int i = 1; i < n; i++) {
    x[i] += 0.1*(x[i-1] - x[i]);
    //x[i] += 0.9*(x[i-1] - x[i]);
    //x[i] += random(0,1)*(x[i-1] - x[i]);
    y[i] += 0.1*(y[i-1] - y[i]);
    ellipse(x[i], y[i], 50, 50);
  }
}

