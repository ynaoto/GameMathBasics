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
  init_handles(3);
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
    
    Entity nearest = null;
    float mind = 0;
    for (int j = 0; j < n; j++) {
      if (j == i) continue;
      Entity b = entities.get(j);
      float d = dist(a.x, a.y, b.x, b.y);
      if (nearest == null || d < mind) {
        nearest = b;
        mind = d;
      }
    }
    a.vx = 0.7*(nearest.x - a.x)/mind; 
    a.vy = 0.7*(nearest.y - a.y)/mind;
    
    for (Handle h : handles) {
      float dah = dist(a.x, a.y, h.x, h.y);
      a.vx += 20*(h.x - a.x)/sq(dah);
      a.vy += 20*(h.y - a.y)/sq(dah);
    }
    
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

