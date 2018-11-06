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
      col = color((hue(c)+128) % 256, 255, 255, alpha(c));
    }
    fill(col);
    ellipse(x, y, 2*r, 2*r);
    popStyle();
  }
  boolean hit(float px, float py) {
    return dist(x, y, px, py) < r;
  }
}

float x0, y0, x1, y1;
Handle h;

void setup() {
  size(300, 300);
  colorMode(HSB);
  x0 = 10; y0 = 10;
  x1 = 290; y1 = 290;
  h = new Handle(x1, y1, color(100, 255, 255, 20));
}

void draw() {
  background(0, 0, 255);
  
  line(x0, y0, x1, y1);
  float th = atan2(y1-y0, x1-x0);
  float d = 30;
  float ph = PI/6;
  float px, py;
  px = d*cos(PI+th+ph);
  py = d*sin(PI+th+ph);
  line(x1, y1, x1+px, y1+py);
  px = d*cos(PI+th-ph);
  py = d*sin(PI+th-ph);
  line(x1, y1, x1+px, y1+py);

  h.draw();
}

Handle dragging = null;
float dragStartX, dragStartY;
float dragOriginX, dragOriginY;

void mouseMoved() {
  h.selected = h.hit(mouseX, mouseY);
}

void mousePressed() {
  if (h.selected) {
    dragging = h;
  }
  if (dragging != null) {
    dragStartX = mouseX;
    dragStartY = mouseY;
    dragOriginX = dragging.x;
    dragOriginY = dragging.y;
  }
}

void mouseDragged() {
  if (dragging == null) {
    return;
  }
  x1 = dragging.x = dragOriginX + (mouseX - dragStartX);
  y1 = dragging.y = dragOriginY + (mouseY - dragStartY);
}

void mouseReleased() {
  dragging = null;
}
