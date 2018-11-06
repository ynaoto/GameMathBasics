ArrayList<PVector> ps = new ArrayList<PVector>();

void setup() {
  size(500, 500);
  colorMode(HSB);
  strokeWeight(5);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  
  int n = ps.size();
  for (int i = 0; i < n; i++) {
    PVector p = ps.get(i);
    stroke(256*i/n, 255, 255);
    point(p.x, p.y);
  }
  
  stroke(0);
  
  float th = 10.0*mouseX/width;
  float r1 = 100;
  float x1 = r1*cos(th);
  float y1 = r1*sin(th);
  line(0, 0, x1, y1);
  
  float ph = 10.0*mouseY/width;
  float r2 = 100;
  float x2 = x1 + r2*cos(ph);
  float y2 = y1 + r2*sin(ph);
  line(x1, y1, x2, y2);

  fill(0);
  textSize(30);
  text("th = " + th, -width/2 + 10, -height/2 + 30);
  text("ph = " + ph, -width/2 + 10, -height/2 + 60);
  
  ps.add(new PVector(x2, y2));
  if (300 < ps.size()) {
    ps.remove(0);
  }
}

