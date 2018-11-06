class M {
  float x, y;
  float m;
  float vx, vy;

  void update(M o)
  {
    float dx = o.x - x, dy = o.y - y;
    float d2 = dx*dx+dy*dy;
    float G = 0.05;
    float f = G * m * o.m / d2;
    float ax = f * dx, ay = f * dy;
    vx += ax; vy += ay;
  }

  void draw() {
    x += vx; y += vy;
    ellipse(x, y, m, m);
  }
}

ArrayList <M> suns;
ArrayList <M> planets;

void setup() {
  size(640, 640);
  
  suns = new ArrayList<M>();
  for (int i = 0; i < 2; i++) {
    M sun = new M();
    sun.x = (i+1)*width/3;
    sun.y = height/2;
    sun.m = 150;
    suns.add(sun);
  }
  suns.get(0).vx = 20;
  suns.get(0).vy = -20;
  suns.get(1).vx = -20;
  suns.get(1).vy = 20;
  
  planets = new ArrayList<M>();
  
  background(0);
}

void mousePressed() {
  M p = new M();
  p.x = mouseX;
  p.y = mouseY;
  p.vx = random(0, 1);
  p.vy = random(0, 1);
  p.m = random(5, 20);
  planets.add(p);
}

void draw() {
  pushStyle();
  fill(0, 1);
  rect(0, 0, width, height);
  fill(#FCA708, 50);
  suns.get(0).update(suns.get(1));
  suns.get(1).update(suns.get(0));
  for (int i = 0; i < suns.size(); i++) {
    suns.get(i).draw();
  }
  popStyle();
  for (int i = 0; i < planets.size(); i++) {
    for (int j = 0; j < suns.size(); j++) {
      planets.get(i).update(suns.get(j));
    }
    planets.get(i).draw();
  }
}

