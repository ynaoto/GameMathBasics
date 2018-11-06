int frac(int n) {
  if (n == 0) return 1;
  return n*frac(n-1);
}

float bin(int n, int i) {
  return (float)frac(n)/(frac(i)*frac(n-i));
}

float B(int n, int i, float t) {
  return bin(n, i)*pow(t, i)*pow(1-t, n-i);
}

void setup() {
  size(300, 300);
  colorMode(HSB);
  init_handles(5);
}

void draw() {
  fill(0, 0, 255, 10);
  rect(0, 0, width, height);
  int n = handles.size();
  for (float t = 0; t <= 1; t += 0.01) {
    float x = 0, y = 0;
    for (int i = 0; i < n; i++) {
      Handle h = handles.get(i);
      float b = B(n-1, i, t);
      x += b*h.x;
      y += b*h.y;
    }
    fill(map(t, 0, 1, 0, 255), 255, 255);
    ellipse(x, y, 10, 10);
  }
  draw_handles();
}

