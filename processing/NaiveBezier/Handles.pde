ArrayList<Handle> handles = new ArrayList<Handle>();

void init_handles(int n) {
  for (int i = 0; i < n; i++) {
    float x = random(width);
    float y = random(height);
    color c = color(map(i, 0, n-1, 0, 255), 255, 255);
    handles.add(new Handle(x, y, c));
  }
}

void draw_handles() {
  Handle lastH = null;
  int n = handles.size();
  for (int i = 0; i < n; i++) {
    Handle h = handles.get(i);
    h.draw();
    if (lastH != null) {
      line(lastH.x, lastH.y, h.x, h.y);
    }
    lastH = h;
  }
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

