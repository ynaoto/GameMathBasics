//import processing.opengl.*;

float rx = 0;
float ry = 0;
int stage = 0;
int cullMode;

void setup() {
  size(400, 400, P3D);
  cullMode = PJOGL.BACK;
}

void triangle(PVector v1, PVector v2, PVector v3) {
  //stroke(255, 0, 0);
  vertex(v1.x, v1.y, v1.z);
  vertex(v2.x, v2.y, v2.z);
  vertex(v3.x, v3.y, v3.z);
}

void triangle(PVector v1, PVector n1, 
              PVector v2, PVector n2, 
              PVector v3, PVector n3) {
  //stroke(0, 255, 0);
  normal(n1.x, n1.y, n1.z);
  vertex(v1.x, v1.y, v1.z);
  normal(n2.x, n2.y, n2.z);
  vertex(v2.x, v2.y, v2.z);
  normal(n3.x, n3.y, n3.z);
  vertex(v3.x, v3.y, v3.z);
}

void triangle() {
  PVector v1 = new PVector(   0, -100, 0);
  PVector v2 = new PVector( 100,  100, 0);
  PVector v3 = new PVector(-100,  100, 0);
  triangle(v1, v2, v3);
}

void quadrangle(PVector v1, PVector v2, PVector v3, PVector v4) {
  triangle(v1, v2, v3);
  triangle(v3, v4, v1);
}

void quadrangle(PVector v1, PVector n1,
                PVector v2, PVector n2,
                PVector v3, PVector n3,
                PVector v4, PVector n4) {
  triangle(v1, n1, v2, n2, v3, n3);
  triangle(v3, n3, v4, n4, v1, n1);
}

void quadrangle() {
  PVector v1 = new PVector(-100, -100, 0);
  PVector v2 = new PVector( 100, -100, 0);
  PVector v3 = new PVector( 100,  100, 0);
  PVector v4 = new PVector(-100,  100, 0);
  quadrangle(v1, v2, v3, v4);
}

void box() {
  PVector v1 = new PVector(-100, -100,  100);
  PVector v2 = new PVector( 100, -100,  100);
  PVector v3 = new PVector( 100,  100,  100);
  PVector v4 = new PVector(-100,  100,  100);
  PVector v5 = new PVector(-100, -100, -100);
  PVector v6 = new PVector( 100, -100, -100);
  PVector v7 = new PVector( 100,  100, -100);
  PVector v8 = new PVector(-100,  100, -100);
  quadrangle(v1, v2, v3, v4);
  quadrangle(v8, v7, v6, v5);
  quadrangle(v1, v4, v8, v5);
  quadrangle(v2, v6, v7, v3);
  quadrangle(v1, v5, v6, v2);
  quadrangle(v4, v3, v7, v8);
}

void ring() {
  for (int i = 0; i < 10; i++) {
    float th0 = i*2*PI/10;
    float th1 = (i + 1)*2*PI/10;
    PVector v1 = new PVector(100*cos(th0),  100, 100*sin(th0));
    PVector v2 = new PVector(100*cos(th1),  100, 100*sin(th1));
    PVector v3 = new PVector(100*cos(th1), -100, 100*sin(th1));
    PVector v4 = new PVector(100*cos(th0), -100, 100*sin(th0));
    quadrangle(v1, v2, v3, v4);
  }
}

void smooth_ring() {
  for (int i = 0; i < 10; i++) {
    float th0 = i*2*PI/10;
    float th1 = (i + 1)*2*PI/10;
    PVector v1 = new PVector(100*cos(th0),  100, 100*sin(th0));
    PVector v2 = new PVector(100*cos(th1),  100, 100*sin(th1));
    PVector v3 = new PVector(100*cos(th1), -100, 100*sin(th1));
    PVector v4 = new PVector(100*cos(th0), -100, 100*sin(th0));
    PVector n1 = new PVector(v1.x, 0, v1.z);
    n1.normalize();
    PVector n2 = new PVector(v2.x, 0, v2.z);
    n2.normalize();
    quadrangle(v1, n1, v2, n2, v3, n2, v4, n1);
  }
}

void sphere() {
  float R = 100;
  int n = 20;
  for (int i = 0; i < n; i++) {
    float th0 = i*PI/n - PI/2;
    float th1 = (i + 1)*PI/n - PI/2;
    for (int j = 0; j < n; j++) {
      float ph0 = j*2*PI/n;
      float ph1 = (j + 1)*2*PI/n;
      float r0 = R*cos(th0);
      float r1 = R*cos(th1);
      float y0 = R*sin(th0);
      float y1 = R*sin(th1);
      PVector v1 = new PVector(r0*cos(ph0), y0, r0*sin(ph0));
      PVector v2 = new PVector(r1*cos(ph0), y1, r1*sin(ph0));
      PVector v3 = new PVector(r1*cos(ph1), y1, r1*sin(ph1));
      PVector v4 = new PVector(r0*cos(ph1), y0, r0*sin(ph1));
      quadrangle(v1, v2, v3, v4);
    }
  }
}

void smooth_sphere() {
  float R = 100;
  int n = 20;
  for (int i = 0; i < n; i++) {
    float th0 = i*PI/n - PI/2;
    float th1 = (i + 1)*PI/n - PI/2;
    for (int j = 0; j < n; j++) {
      float ph0 = j*2*PI/n;
      float ph1 = (j + 1)*2*PI/n;
      float r0 = R*cos(th0);
      float r1 = R*cos(th1);
      float y0 = R*sin(th0);
      float y1 = R*sin(th1);
      PVector v1 = new PVector(r0*cos(ph0), y0, r0*sin(ph0));
      PVector v2 = new PVector(r1*cos(ph0), y1, r1*sin(ph0));
      PVector v3 = new PVector(r1*cos(ph1), y1, r1*sin(ph1));
      PVector v4 = new PVector(r0*cos(ph1), y0, r0*sin(ph1));
      PVector n1 = v1.normalize(null);
      PVector n2 = v2.normalize(null);
      PVector n3 = v3.normalize(null);
      PVector n4 = v4.normalize(null);
      quadrangle(v1, n1, v2, n2, v3, n3, v4, n4);
    }
  }
}

void torus() {
  float R = 100;
  float r = 50;
  for (int i = 0; i < 20; i++) {
    float th0 = i*2*PI/20;
    float th1 = (i + 1)*2*PI/20;
    for (int j = 0; j < 20; j++) {
      float ph0 = j*2*PI/20;
      float ph1 = (j + 1)*2*PI/20;
      PVector v1 = new PVector(R*cos(th0) + r*cos(ph0)*cos(th0), R*sin(th0) + r*cos(ph0)*sin(th0), r*sin(ph0));
      PVector v2 = new PVector(R*cos(th1) + r*cos(ph0)*cos(th1), R*sin(th1) + r*cos(ph0)*sin(th1), r*sin(ph0));
      PVector v3 = new PVector(R*cos(th1) + r*cos(ph1)*cos(th1), R*sin(th1) + r*cos(ph1)*sin(th1), r*sin(ph1));
      PVector v4 = new PVector(R*cos(th0) + r*cos(ph1)*cos(th0), R*sin(th0) + r*cos(ph1)*sin(th0), r*sin(ph1));
      quadrangle(v1, v2, v3, v4);
    }
  }
}

void draw() {
  background(100);
  fill(255);
  text(stage, 10, 16);
  text(cullMode == PJOGL.BACK ? "BACK" : "FRONT", 10, 32);

  noStroke();
  
  pushMatrix();

  translate(width/2, height/2);
  frustum(-1.0, 1.0, -1.0, 1.0, 1.7, 2000);
  beginCamera();
  camera(0, 0, 500, 0, 0, 0, 0, 1, 0);
  endCamera();
  lights();

  rotateX(rx);
  rotateY(ry);
  ry += 0.01;

  PJOGL pgl = (PJOGL)beginPGL();
  pgl.enable(PJOGL.CULL_FACE);
  pgl.cullFace(cullMode);
  //endPGL();

  beginShape(TRIANGLES);
  if (stage == 0) {
    triangle();
  } else if (stage == 1) {
    quadrangle();
  } else if (stage == 2) {
    box();    
  } else if (stage == 3) {
    ring();    
  } else if (stage == 4) {
    smooth_ring();    
  } else if (stage == 5) {
    sphere();    
  } else if (stage == 6) {
    smooth_sphere();    
  } else if (stage == 7) {
    torus();    
  }
  endShape();

  popMatrix();
}

void mouseDragged() {
  rx -= 0.1*(mouseY - pmouseY);
  ry += 0.1*(mouseX - pmouseX);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      stage++;
    } else if (keyCode == LEFT) {
      stage--;
    }
  } else if (key == 'c') {
    cullMode = cullMode == PJOGL.BACK ? PJOGL.FRONT : PJOGL.BACK;
  }
}