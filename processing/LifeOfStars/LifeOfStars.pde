class P {
  float th;
  float x, y;
  float r;
  P(float x, float y) {
    this.x = x;
    this.y = y;
    th = random(2*PI);
    r = 3;
  }
  void draw() {
    ellipse(x, y, r, r);
    float n0 = noise(0, 0, th);
    float n1 = noise(1, 1, th);
    float n = map(noise(x/width, y/height, th), n0, n1, 0, 2*PI);
    th += n;
    x += cos(th);
    y += sin(th);
    if (50 < r) {
      r = 3;
    } else if (3 < r) {
      r *= 0.9;
    }
  }
}
ArrayList<P> ps = new ArrayList<P>();

void setup() {
  size(500, 500, P2D);
  for (float y = 0; y < height; y += 30) {
    for (float x = 0; x < width; x += 30) {
      ps.add(new P(x, y));
    }
  }
}

void draw() {
  //background(0);
  noStroke();
  fill(0, 10);
  rect(0, 0, width, height);
  
  fill(255, 10);
  for (P p : ps) {
    p.draw();
  }
  for (P p : ps) {
    for (P q : ps) {
      if (p == q) {
        continue;
      }
      if (dist(p.x, p.y, q.x, q.y) < p.r + q.r) {
        p.r *= 1.1;
        continue;
      }
    }
  }
}