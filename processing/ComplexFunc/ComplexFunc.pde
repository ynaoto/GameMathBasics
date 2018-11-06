class Complex {
  private float r, i;
  Complex(float r, float i) {
    this.r = r;
    this.i = i;
  }
  Complex plus(Complex a) {
    return new Complex(r + a.r, i + a.i);
  }
  Complex plus(float a) {
    return plus(new Complex(a, 0));
  }
  Complex mul(Complex a) {
    return new Complex(r*a.r - i*a.i, r*a.i + i*a.r);
  }
  Complex mul(float a) {
    return mul(new Complex(a, 0));
  }
  Complex inv() {
    float d = r*r + i*i;
    return new Complex(r/d, -i/d);
  }
}

float cameraRX = PI/4, cameraRY = PI/4;

void setup() {
  size(500, 500, P3D);
}

void mouseDragged() {
  cameraRX += 0.1*(mouseY - pmouseY);
  cameraRY += 0.1*(mouseX - pmouseX);
}

void draw() {
  background(200);
  //ortho();
  //camera();
  //hint(DISABLE_DEPTH_TEST);
  //fill(0, 0, 0, 10);
  //rect(0, 0, width, height);
  //hint(ENABLE_DEPTH_TEST);

  lights();

  beginCamera();
  camera();
  float cameraZ = 5000;
  perspective(PI/3, 1.0, cameraZ/10.0, cameraZ*10.0);
  translate(width/2, height/2, -cameraZ);
  rotateX(cameraRX);
  rotateY(cameraRY);
  endCamera();

  noStroke();
  fill(255);
  box(100);

  float scale = width;
  scale(scale, -scale, scale);
  strokeWeight(1.5/scale);

  stroke(255, 0, 0);
  line(-1, 0, 0, 1, 0, 0);
  stroke(0, 255, 0);
  line(0, -1, 0, 0, 1, 0);
  stroke(0, 0, 255);
  line(0, 0, -1, 0, 0, 1);

  pushStyle();
  colorMode(HSB, 360, 1, 1);

  float[] as = new float[10];
  float r = frameCount/20.0;
  for (int i = 0; i < as.length; i++) {
    as[i] = cos(r + i*2*PI/as.length);
  }

  strokeWeight(10/scale);
  for (int i = 0; i < 360; i++) {
    float th = i*2*PI/360;
    Complex x = new Complex(cos(th), sin(th));
    stroke(i, 1, 1);
    point(x.r, x.i, 0);
    Complex y = new Complex(0, 0);
    Complex xx = x;
    for (int j = 0; j < as.length; j++) {
      y = y.plus(xx.mul(as[j]));
      xx = xx.mul(x);
    }
    point(y.r, 0, y.i);
  }

  popStyle();
}