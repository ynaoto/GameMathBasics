class Enemy {
  float x, y;
  float vx, vy;
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    vx = random(-10, 10);
    vy = random(-10, 10);
  }
  void draw() {
    ellipse(x, y, 10, 10);
    
    x += vx;
    if (x < 0) {
      x = -x;
      vx *= -1;
    }
    if (width < x) {
      x = width - (x - width);
      vx *= -1;
    }
    
    y += vy;
    if (y < 0) {
      y = -y;
      vy *= -1;
    }
    if (height < y) {
      y = height - (y - height);
      vy *= -1;
    }
  }
}

Enemy[] enemies = new Enemy[100];

void setup() {
  size(480, 640);
  for (int i = 0; i < enemies.length; i++) {
    enemies[i] = new Enemy(random(width), random(height));
  }
}

void draw() {
  background(0);
  for (Enemy e : enemies) {
    e.draw();
  }
}

