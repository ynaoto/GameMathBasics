float ray(PVector from, PVector to, PVector L) {
  /*
  x^2+y^2+z^2 = r^2
  (x, y, z) = from + t(to - from)
            = P + tQ
            = (Px + tQx, Py + tQy, Pz + tQz)
    Px^2+2tPxQx+(tQx)^2
  + Py^2+2tPyQy+(tQy)^2
  + Pz^2+2tPzQz+(tQz)^2 = r^2
  = (Qx^2+Qy^2+Qz^2)t^2
    + 2(PxQx+PyQy+PzQz)t
    + Px^2+Py^2+Pz^2
  = (|Q|^2)t^2 + 2(P・Q)t + |P|^2
  (|Q|^2)t^2 + 2(P・Q)t + (|P|^2-r^2) = 0
  t = (-b±sqrt(b^2-4ac))/2a
  */
  float r = 1;
  PVector P = from;
  PVector Q = PVector.sub(to, from);
  float a = Q.magSq();
  float b = 2*P.dot(Q);
  float c = P.magSq() - sq(r);
  float det = sq(b) - 4*a*c;
  if (det < 0) {
    return 0;
  }
  float d = sqrt(det);
  float t = min((-b+d)/(2*a), (-b-d)/(2*a));
  float x = P.x + t*Q.x;
  float y = P.y + t*Q.y;
  float z = P.z + t*Q.z;
  
  PVector N = new PVector(x, y, z);
  N.normalize();
  return L.dot(N);
}

void setup() {
  size(300, 300);
  background(0);
}

void drawPoint() {
  float px = random(width);
  float py = random(height);
  float x = map(px, 0, width, -1, 1);
  float y = map(py, 0, height, 1, -1);
  PVector from = new PVector(0, 0, -100);
  PVector to = new PVector(x, y, -10);
  PVector L = new PVector(map(mouseX, 0, width, -1, 1),
                          map(mouseY, 0, height, 1, -1),
                          -1);
  L.normalize();
  float b = ray(from, to, L);
  stroke(255*b);
  point(px, py);
}

void draw() {
  int start = millis();
  while (millis() - start < 15) {
    drawPoint();
  }
}