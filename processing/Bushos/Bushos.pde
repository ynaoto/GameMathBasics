class Busho {
  String name;
  int income;
  Busho(String name) {
    this.name = name;
    income = (int)random(10, 1000000);
  }
  void print() {
    println("name: " + name + "; income = " + income);
  }
  void update() {
    int d = (int)random(-10000, 10000);
    if (100 < income + d) {
      income += d;
    }
  }
}

Busho[] bushos = new Busho[3];

void setup() {
  bushos[0] = new Busho("Nobunaga");
  bushos[1] = new Busho("Ieyasu");
  bushos[2] = new Busho("Hideyoshi");
  for (Busho b : bushos) {
    b.print();
  }
  size(500, 500);
  ellipseMode(CORNER);
  textAlign(CENTER, CENTER);
  textSize(24);
}

void draw() {
  background(0);
  int total = 0;
  for (Busho b : bushos) {
    total += b.income;
  }
  int x = 0;
  for (Busho b : bushos) {
    float r = width*b.income/total;
    fill(255);
    ellipse(x, 250 - r/2, r, r);
    fill(0);
    text(b.name, x + r/2, 250);
    x += r;
    b.update();
  }
}