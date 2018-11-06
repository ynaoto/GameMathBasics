float[] a;
float th;

void walk(int x, int y) {
  int idx = y*width + x;
  pixels[idx] = color(map(a[idx], th, 1, 0, 30), 1, 1);
  a[idx] = -1;
  if (0 < x) { // left
    idx = y*width + x - 1;
    if (th < a[idx]) {
      walk(x-1, y);
    }
  }
  if (x < width-1) { // right
    idx = y*width + x + 1;
    if (th < a[idx]) {
      walk(x+1, y);
    }
  }
  if (0 < y) { // up
    idx = (y - 1)*width + x;
    if (th < a[idx]) {
      walk(x, y-1);
    }
  }
  if (y < height-1) { // down
    idx = (y + 1)*width + x;
    if (th < a[idx]) {
      walk(x, y+1);
    }
  }
}

float x0, x, y0, y, r0, r;
float vy, ay;

void reset() {
  x = x0;
  y = y0;
  r = r0;
  vy = 0;
  ay = 0;
}

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 1, 1);
  frameRate(20);
  background(0);
  a = new float[width*height];
  th = 0.47;
  x0 = width/2;
  y0 = 2*height/3;
  r0 = 5;
  reset();
}

void draw() {
  fill(0, 0, 0, 30);
  noStroke();
  rect(0, 0, width, height);
//  background(0);

  x = 5*sin(10*r) + x0;
  
  strokeWeight(3);
  stroke(50, 1, 1);
  line(x0, 0, x, y0);

  if (ay == 0) {
    r += 0.01;
  }
  
  noStroke();
  fill(10, 1, 1);
  ellipse(x, y, 2*r, 2*r);

  if (10 < random(0, r)) {
    ay = 3;
  }
  
  loadPixels();
  if (y < height) {  
    for (int i = 0; i < width*height; i++) {
      a[i] = random(0, 1);
    }
    walk((int)x, (int)y);
  }
  updatePixels();
//  filter(BLUR);

  if (y < height + 100) {
    vy += ay;
    y += vy;
  }
}

void mousePressed() {
  reset();
}
