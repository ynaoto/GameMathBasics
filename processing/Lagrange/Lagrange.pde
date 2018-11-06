float[] tt = { 0, 0.25, 0.5, 0.75, 1 };
//float[] tt = { 0.0, 0.1, 0.2, 0.3, 0.4,
//               0.5, 0.6, 0.7, 0.8, 0.9, 1.0 };

float L(int n, int i, float t) {
  float a = 1, b = 1;
  for (int j = 0; j <= n; j++) {
    if (j == i) continue;
    a *= t - tt[j];
    b *= tt[i] - tt[j];
  }
  return a/b;
}

void setup() {
  //size(300, 300);
  size(500, 500);
  colorMode(HSB);
  init_handles(tt.length);
}

void draw() {
  fill(0, 0, 255, 10);
  rect(0, 0, width, height);
  int n = handles.size();
  float dt = 0.01;
  //float dt = 0.005;
  for (float t = 0; t <= 1; t += dt) {
    float x = 0, y = 0;
    for (int i = 0; i < n; i++) {
      Handle h = handles.get(i);
      float a = L(n-1, i, t);
      x += a*h.x;
      y += a*h.y;
    }
    fill(map(t, 0, 1, 0, 255), 255, 255);
    ellipse(x, y, 10, 10);
  }
  draw_handles();
}