float rx = -PI/4;
float ry = 0;

void setup() {
  size(400, 400, P3D);
}

void drawRect() {
  beginShape();
  vertex(-100, -100, 0);
  vertex( 100, -100, 0);
  vertex( 100,  100, 0);
  vertex(-100,  100, 0);
  vertex(-100, -100, 0);
  endShape();
}

boolean stopped = false;

void draw() {
  background(100);

  translate(width/2, height/2, 0);
  
  beginCamera();
  camera(0, 0, 500, 0, 0, 0, 0, 1, 0);
  rotateX(rx);
  rotateY(ry);
  if (!stopped) {
    ry += 0.01;
  }
  endCamera();

  fill(255, 0, 0, 100);
  rotateY(PI/3);
  drawRect();

  fill(0, 255, 0, 100);
  rotateY(PI/3);
  drawRect();

  fill(0, 0, 255, 100);
  rotateY(PI/3);
  drawRect();
}

void mouseDragged() {
  rx += 0.01*(mouseY - pmouseY);
  ry -= 0.01*(mouseX - pmouseX);
}

void keyPressed() {
  stopped = !stopped;
}
