void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  strokeWeight(3);

  float x1 = 100.0, y1 = 50.0;
  float x2 = 300.0, y2 = 100.0;
  float x3 = 200.0, y3 = 200.0;

  stroke(255, 0, 0); line(x1, y1, x2, y2);
  stroke(0, 255, 0); line(x1, y1, x3, y3);

  fill(0);
  textSize(32);

  float prod = (x2 - x1)*(x3 - x1) + (y2 - y1)*(y3 - y1);
  text(prod, 16, 48);
  
  float l2 = sqrt((x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1)); 
  float l3 = sqrt((x3 - x1)*(x3 - x1) + (y3 - y1)*(y3 - y1));
  float c = prod/(l2*l3);
  float th = 180*acos(c)/PI;
  text(th, 200, 48);
}