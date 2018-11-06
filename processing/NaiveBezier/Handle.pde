class Handle {
  float x, y;
  color c;
  float r;
  boolean selected;
  Handle (float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
    r = 10;
  }
  void draw() {
    pushStyle();
    color col = c;
    if (selected) {
      col = color((hue(c)+128) % 256, 255, 255);
    }
    fill(col);
    ellipse(x, y, 2*r, 2*r);
    popStyle();
  }
  boolean hit(float px, float py) {
    return dist(x, y, px, py) < r;
  }
}

