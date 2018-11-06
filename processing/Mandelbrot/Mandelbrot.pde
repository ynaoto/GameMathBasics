PVector p0start = new PVector(-2.5, -1);
PVector p1start = new PVector(1, 1);

// http://ja.wikipedia.org/wiki/数学的な美
PVector p0end = new PVector(0.278587, -0.012560);
PVector p1end = new PVector(0.285413, -0.007440);

int max_iteration = 300;
float t;

void setup() {
  size(700, 400);
  colorMode(HSB, max_iteration, 1, 1);
  t = 1;
  loadPixels();
}

void draw() {
  for (int py = 0; py < height; py++) {
    for (int px = 0; px < width; px++) {
      PVector p0 = PVector.lerp(p0start, p0end, 1-t);
      PVector p1 = PVector.lerp(p1start, p1end, 1-t);
      float x0 = map(px, 0, width, p0.x, p1.x);
      float y0 = map(py, height, 0, p0.y, p1.y);
      float x = 0, y = 0;
      int itr;
      for (itr = 0; itr < max_iteration; itr++) {
        float x2 = x*x, y2 = y*y;
        if (4 < x2 + y2) {
          break;
        }
        float xy = x*y;
        x = x2 - y2 + x0;
        y = 2*xy + y0;
      }
      pixels[py*width + px] = color(itr, 1, 1);
    }
  }
  updatePixels();
  t *= 0.9;
}

