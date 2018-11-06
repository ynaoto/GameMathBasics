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

ArrayList<Handle> handles = new ArrayList<Handle>();

void setup() {
  size(300, 300);
  smooth();
  colorMode(HSB);
  int n = 20;
  for (int i = 0; i < n; i++) {
    float x = random(width);
    float y = random(height);
    color c = color(map(i, 0, n, 0, 256), 255, 255);
    handles.add(new Handle(x, y, c));
  }
}

void arrow(float x0, float y0, float x1, float y1) {
  line(x0, y0, x1, y1);
  float th = atan2(y1-y0, x1-x0);
  float d = 15;
  float ph = PI/10;
  float px, py;
  px = d*cos(PI+th+ph);
  py = d*sin(PI+th+ph);
  line(x1, y1, x1+px, y1+py);
  px = d*cos(PI+th-ph);
  py = d*sin(PI+th-ph);
  line(x1, y1, x1+px, y1+py);
}

void draw() {
  background(255);
  stroke(0);
  float x0 = handles.get(0).x, y0 = handles.get(0).y;
  float xsum = x0, ysum = y0;
  int n = handles.size();
  Handle lastH = null;
  for (int i = 0; i < n; i++) {
    Handle h = handles.get(i);
    h.draw();
    if (lastH != null) {
      arrow(lastH.x, lastH.y, h.x, h.y);
      xsum += h.x - lastH.x;
      ysum += h.y - lastH.y;
    }
    lastH = h;
  }
  pushStyle();
  stroke(0, 255, 255);
  strokeWeight(3);
  arrow(x0, y0, xsum, ysum);
  popStyle();
}

Handle dragging = null;
float dragStartX, dragStartY;
float dragOriginX, dragOriginY;

void mouseMoved() {
  for (Handle h : handles) {
    h.selected = h.hit(mouseX, mouseY);
  }
}

void mousePressed() {
  for (Handle h : handles) {
    if (h.selected) {
      dragging = h;
      break;
    }
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
  dragging.x = dragOriginX + (mouseX - dragStartX);
  dragging.y = dragOriginY + (mouseY - dragStartY);
}

void mouseReleased() {
  dragging = null;
}
