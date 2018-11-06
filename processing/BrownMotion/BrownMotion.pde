class Ball {
  float x, y, r;
  color c;
  float vx, vy;
  Ball() {
    x = random(width);
    y = random(height);
    r = 10;
    c = color(random(256), 255, 255);
    vx = random(-3, 3);
    vy = random(-3, 3);
  }
  void move() {
    x += vx;
    if (width - r < x) {
      x = (width - r) - (x - (width - r));
      vx *= -1;
    } else if (x < r) {
      x = r + r - x;
      vx *= -1;
    }
    y += vy;
    if (height - r < y) {
      y = (height - r) - (y - (height - r));
      vy *= -1;
    } else if (y < r) {
      y = r + r - y;
      vy *= -1;
    }
  }
  void draw() {
    fill(c);
    ellipse(x, y, 2*r, 2*r);
  }
}

ArrayList<Ball> balls;

void setup() {
  size(500, 500);
  balls = new ArrayList<Ball>();
  colorMode(HSB);
  for (int i = 0; i < 100; i++) {
    Ball ball = new Ball();
    balls.add(ball);
  }
}

void draw() {
  background(255);
  for (Ball ball : balls) {
    ball.move();
    for (Ball ball2 : balls) {
      if (ball2 == ball) {
        continue;
      }
      float d = dist(ball.x, ball.y, ball2.x, ball2.y);
      if (d < ball.r + ball2.r) {
        float th = atan2(ball2.y - ball.y, ball2.x - ball.x);
        float n = dist(0, 0, ball.vx, ball.vy);
        ball.vx = -n * cos(th);
        ball.vy = -n * sin(th);
      }
    }
    ball.draw();
  }
}
