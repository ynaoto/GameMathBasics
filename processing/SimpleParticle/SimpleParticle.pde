class P {
  float x, y, r;
  float vx, vy;
  int age;
  P(float x, float y) {
    this.x = x;
    this.y = y;
    r = 3;
    vx = random(-2, 2);
    vy = random(-10, -5);
    age = 0;
  }
  void draw() {
    float h = map(age, 0, 255, 0, 255);
    float a = map(age, 0, 255, 255, 0);
    fill(h, 255, 255, a);
    ellipse(x, y, 2*r, 2*r);
  }
  boolean update() {
    x += vx;
    y += vy;
    vy += 0.1;
    age++;
    return y < height;
  }
}

ArrayList<P> particles;

void setup() {
  size(600, 600);
  particles = new ArrayList<P>();
  colorMode(HSB);
}

void draw() {
  background(0);
  ArrayList<P> ps = new ArrayList<P>();
  for (P p: particles) {
    p.draw();
    if (p.update()) {
      ps.add(p);
    }
  }
  for (int i = 0; i < 10; i++) {
    //ps.add(new P(width/2, height));
    ps.add(new P(mouseX, mouseY));
  }
  particles = ps;
  fill(0, 0, 255);
  text(particles.size(), 16, 16);
}