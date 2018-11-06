void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  float th = PI/4;
  float x = mouseX - width/2;
  float y = mouseY - height/2;
  stroke(0);
  line(0, 0, x, y);
  
  stroke(0, 0, 255);
  pushMatrix();
  rotate(-th);
  line(0, 0, x, y);
  popMatrix();
  
  stroke(255, 0, 0);
  float x1 = x*cos(th) - y*sin(th);
  float y1 = x*sin(th) + y*cos(th);
  line(0, 0, x1, y1);
}