Camera cam;
ArrayList<Poly> stars;

void setup()
{
  size(640, 640);
  background(0);
  cam = new Camera();
  cam.d = 1;

  stars = new ArrayList<Poly>();
  int n = 6;
  for (int i = 0; i < 500; i++) {
    Poly p = new Poly(n);
    float r = 5;
    float x = random(-500, 500);
    float y = random(-500, 500);
    float z = random(1, 1000);
    for (int j = 0; j < p.v.length; j++) {
      p.v[j].x = r * cos(j * 2*PI/n) + x;
      p.v[j].y = r * sin(j * 2*PI/n) + y;
      p.v[j].z = z;
    }
    Point3D c = p.center();
    p.move(-c.x, -c.y, -c.z);
    p.rot(random(0, 2*PI), random(0, 2*PI), random(0, 2*PI));
    p.move(c.x, c.y, c.z);
    stars.add(p);
  }
}

void draw()
{
  background(0);
  cam.d = 1000.0 * mouseX / width;
  int n = stars.size();
  for (int i = 0; i < n; i++) {
    Poly p = stars.get(i);
    p.move(0, 0, -1);
    if (p.v[0].z < 0) {
      p.move(0, 0, 1000);
    }
    Point3D c = p.center();
    p.move(-c.x, -c.y, -c.z);
    p.rot(PI/100, PI/100, PI/100);
    p.move(c.x, c.y, c.z);
    boolean tooNear = false;
    for (int j = 0; j < p.v.length; j++) {
      if (p.v[j].z < 0) {
        tooNear = true;
        break;
      }
    }
    if (!tooNear) {
      p.draw(cam);
    }
  }
  fill(255);
  text("cam.d: " + cam.d, 10, 30);
}
