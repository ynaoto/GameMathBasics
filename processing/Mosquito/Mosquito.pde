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
    for (Handle h : handles) {
      float d = dist(x, y, h.x, h.y);
      float d2 = sq(d);
      float a = 5;
      float ax = a*(h.x - x)/d2;
      float ay = a*(h.y - y)/d2;
      vx += ax;
      vy += ay;
    }
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
  for (int i = 0; i < 500; i++) {
    entities.add(new Entity());
  }
}

void draw() {
  fill(0, 0, 255, 10);
  rect(0, 0, width, height);
  for (Entity a : entities) {
    a.update();
    a.draw();
  }
  draw_handles();
}

