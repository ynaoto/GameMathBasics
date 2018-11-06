class P {
  float x, y;
  P(float x, float y) {
    this.x = x;
    this.y = y;
  }
}
ArrayList<P> ps = new ArrayList<P>();

void setup() {
  size(500, 500, P2D);
  for (int y = 0; y <= height; y += 3) {
    for (int x = 0; x <= width; x += 3) {
      ps.add(new P(x, y));
    }
  }
}

float z = 0;

void draw() {
  background(0);
  stroke(255, 50);
  strokeWeight(5);
  for (P p : ps) {
    point(p.x, p.y);
    float n0 = noise(0, 0, z);
    float n1 = noise(1, 1, z);
    float n = map(noise(p.x/width, p.y/height, z), n0, n1, 0, 2*PI);
    float vx = 1*cos(n) - 0*sin(n);
    float vy = 1*sin(n) + 0*cos(n);
    p.x += vx;
    p.y += vy;
    if (p.x < 0 || width < p.x || p.y < 0 || height < p.y) {
      p.x = random(width);
      p.y = random(height);
    }
  }
  z += 0.001;
}
