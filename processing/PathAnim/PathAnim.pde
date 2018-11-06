PVector[] waypoints = {
  new PVector(-100, 0, 0),
  new PVector(0, 100, -100),
  new PVector(100, 0, 0),
  new PVector(100, 100, 0),
  new PVector(0, 0, 100),
  new PVector(0, -100, -100),
};

PVector linear(float t)
{
  int n = waypoints.length;
  float tn = t*(n - 1);
  int seg = (int)tn;
  float tt = tn - seg;
  PVector p1 = waypoints[seg];
  PVector p2 = waypoints[seg + 1];
//  return p = PVector.lerp(p1, p2, tt);
  return PVector.add(PVector.mult(p2, tt), PVector.mult(p1, 1-tt));
}

int fact(int n) {
  if (n == 0) {
    return 1;
  }
  return n*fact(n - 1);
}

float J(int n, int i, float t) {
  float c = fact(n)/(fact(n - i)*fact(i));
  return c*pow(t, i)*pow(1 - t, n - i);
}

PVector bezier(float t) {
  int n = waypoints.length;
  PVector p = new PVector(0, 0, 0);
  for (int i = 0; i < n; i++) {
    float j = J(n - 1, i, t);
    p.add(PVector.mult(waypoints[i], j));
  }
  return p;
}

float rx = 0;
float ry = 0;

void setup() {
  size(400, 400, P3D);
}

float t = 0;

void draw() {
  background(100);
  fill(255);
  text("t = " + t, 10, 16);
  
  pushMatrix();
  
  translate(width/2, height/2, 0);
  beginCamera();
  camera(0, 0, 300, 0, 0, 0, 0, 1, 0);
  rotateX(rx);
  rotateY(ry);
  ry += 0.001;
  endCamera();
  lights();

  int n = waypoints.length;
  for (int i = 0; i < n; i++) {
    PVector wp = waypoints[i];
    pushMatrix();
    translate(wp.x, wp.y, wp.z);
    fill(255);
    noStroke();
    sphere(10);
    popMatrix();
    if (i < n - 1) {
      PVector np = waypoints[i + 1];
//      line(wp.x, wp.y, wp.z, np.x, np.y, np.z);
      stroke(0, 255, 0);
      strokeWeight(2);
      fill(0, 0, 255);
      beginShape(TRIANGLES);
      vertex(wp.x, wp.y, wp.z-5);
      vertex(np.x, np.y, np.z);
      vertex(wp.x, wp.y, wp.z+5);
      endShape();
    } 
  }

  PVector p;
  noStroke();
  
  p = linear(t);
  pushMatrix();
  translate(p.x, p.y, p.z);
  fill(255, 0, 0, 100);
  sphere(20);
  popMatrix();
  
  p = bezier(t);
  pushMatrix();
  translate(p.x, p.y, p.z);
  fill(255, 255, 0, 100);
  sphere(20);
  popMatrix();

  popMatrix();
  
  t += 0.01;
  if (1 < t) {
    t = 0;
  }
}

void mouseDragged() {
  rx -= 0.01*(mouseY - pmouseY);
  ry += 0.01*(mouseX - pmouseX);
}


