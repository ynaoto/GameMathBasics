class Bullet {
  float x, y;
  float vx, vy;
}

float cx, cy, r;
ArrayList<Bullet> bullets;

void setup() {
  size(300, 300);
  cx = width/2;
  cy = height/2;
  r = 120;
  bullets = new ArrayList<Bullet>();
}

void draw() {
  background(255);
  float x = mouseX;
  float y = mouseY;
  float dx = x - cx;
  float dy = y - cy;
  float d = sqrt(dx*dx+dy*dy);
  float r1 = 30;
  fill(0);
  //text(d, 10, 30);
  //text(r-d, 10, 50);
  noFill();
  stroke(0);
  ellipse(cx, cy, 2*r, 2*r);
  //line(cx, cy, x, y);
  //ellipse(x, y, 2*r1, 2*r1);
  if (r < d + r1) {
    float a = (r-r1)/d;
    x = cx + a*dx;
    y = cy + a*dy;
    //stroke(255, 0, 0);
  }
  ellipse(x, y, 2*r1, 2*r1);
  
  if (mousePressed && 0 < d) {
    Bullet b = new Bullet();
    b.x = cx; b.y = cy;
    b.vx = (x - cx) / 10;
    b.vy = (y - cy) / 10;
    bullets.add(b);
  }
  
  int n = bullets.size();
  for (int i = n - 1; 0 <= i; i--) {
    Bullet b = bullets.get(i);
    if (0 < b.x && b.x < width && 0 < b.y && b.y < height) {
      ellipse(b.x, b.y, 5, 5);
      b.x += b.vx; b.y += b.vy;
    } else {
      bullets.remove(b);
    }
  }
}
