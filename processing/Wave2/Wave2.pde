float[] th = { 0, 0, 0, 0, 0 };
float[] dt = { 0.1, 0.11, 0.12, 0.13, 0.14 };
color[] colors = { #ff0000, #00ff00, #0000ff, #ff0000, #00ff00 };

void setup() {
  size(500, 500);
  strokeWeight(3);
}

void draw() {
  background(255);
  translate(100, height/2);
  float r = 70;

  for (int i = 0; i < th.length; i++) {  
    rotate(PI*cos(th[i])/4);
    stroke(colors[i]);
    line(0, 0, r, 0);
    translate(r, 0);
    th[i] += dt[i];
  }
}

