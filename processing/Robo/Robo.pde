PImage faceTexture;

void setup() {
  size(400, 400, P3D);
  faceTexture = loadImage("bikkuri_me_tobideru_man.png");
  textureMode(NORMAL);
}

float ry = 0;
float armr = 0;
float va = 0.01;

void draw() {
  background(0);
  translate(width/2, height/2);
  beginCamera();
  camera(0, 0, -300, 0, 0, 0, 0, 1, 0);
  rotateY(ry);
  ry += 0.01;
  endCamera();
  lights();
  
  pushMatrix();
  scale(1, 2);
  box(50);
  beginShape(QUADS);
  texture(faceTexture);
  vertex(-25, -25, 25, 0.0, 0.0);
  vertex( 25, -25, 25, 1.0, 0.0);
  vertex( 25,  25, 25, 1.0, 1.0);
  vertex(-25,  25, 25, 0.0, 1.0);
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(0, -30, 0);
  rotateX(armr);
  translate(40, 30, 0);
  scale(1, 3);
  box(20);
  popMatrix();
  
  pushMatrix();
  translate(0, -30, 0);
  rotateX(-armr);
  translate(-40, 30, 0);
  scale(1, 3);
  box(20);
  popMatrix();
  
  armr += va;
  if (PI/4 < abs(armr)) {
    va *= -1;
  }
}
