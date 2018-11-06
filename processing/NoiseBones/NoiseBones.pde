class L {
  float th, r;
  L(float th, float r) {
    this.th = th;
    this.r = r;
  }
  void draw() {
    float x = r*cos(th);
    float y = r*sin(th);
    for (float t = 0; t <= 1; t += 0.005) {
      float off;
      off = th/10;
      float ftx = map(noise(t, off), noise(0, off), noise(1, off), 0, 1)*x;
      off += 0.1;
      float fty = map(noise(t, off), noise(0, off), noise(1, off), 0, 1)*y;
      point(ftx, fty);
    }
  }
}
ArrayList<L> ls = new ArrayList<L>();

void setup() {
  size(500, 500, P2D);
  for (float th = 0; th <= 2*PI; th += 5*PI/180) {
    ls.add(new L(th, 150));
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  stroke(255, 30);
  strokeWeight(5);
  for (L l : ls) {
    l.draw();
    l.th += 0.01;
  }
}
