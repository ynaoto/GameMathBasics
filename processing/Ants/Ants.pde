class Entity {
  float x, y;
  float vx, vy;
  Entity() {
    x = random(width);
    y = random(height);
    vx = random(-1, 1);
    vy = random(-1, 1);
  }
  void update() {
    x += vx;
    y += vy;
  }
  void draw() {
    ellipse(x, y, 3, 3);
  }
}

ArrayList<Entity> entities = new ArrayList<Entity>();

void setup() {
  size(300, 300);
  colorMode(HSB);
  init_handles(1);
  for (int i = 0; i < 1000; i++) {
    entities.add(new Entity());
  }
}

void draw() {
//  fill(0, 0, 255, 10);
//  rect(0, 0, width, height);
  background(255);
  int n = entities.size();
  for (int i = 0; i < n; i++) {
    Entity a = entities.get(i);
    float tx, ty;
    if (i == 0) {
      Handle h = handles.get(0);
      tx = h.x;
      ty = h.y;
    } else {
      Entity last = entities.get(i-1);
      tx = last.x;
      ty = last.y;
    }
    float d = dist(a.x, a.y, tx, ty);
    a.vx = 0.7*(tx - a.x)/d; 
    a.vy = 0.7*(ty - a.y)/d;
    for (int j = 0; j < n; j++) {
      if (j == i) continue;
      Entity b = entities.get(j);
      float dab = dist(a.x, a.y, b.x, b.y);
      if (dab < 5) {
        float dvx = 0.2*(a.x - b.x)/dab;
        float dvy = 0.2*(a.y - b.y)/dab;
        a.vx += dvx;
        a.vy += dvy;
      }
    } 
  }
  for (Entity a : entities) {
    a.update();
    a.x += random(-1, 1);
    a.y += random(-1, 1);
    a.draw();
  }
  draw_handles();
}

