// dripping sound from http://soundbible.com/tags-dripping.html
// drip image from http://www.pngall.com/drops-png/download/17768 
import ddf.minim.*;

Minim minim;
AudioSample dropSound;

PImage drip;

abstract class Object {
  float x, y;
  abstract void update();
  abstract void draw();
}

class Drip extends Object {
  float vx, vy;
  float ax, ay;
  Drip(float x, float y) {
    this.x = x;
    this.y = y;
    vx = vy = 0;
    ax = 0;
    ay = 0.1;
  }
  void update() {
    vx += ax;
    vy += ay;
    x += vx;
    y += vy;
  }
  void draw() {
    float a = 0.05;
    float w = a*drip.width;
    float h = a*drip.height;
    image(drip, x, y, w, h);
  }
}

class Ripple extends Object {
  float size;
  color c;
  Ripple(float x, float y) {
    this.x = x;
    this.y = y;
    size = 0;
    c = color(random(255), 255, 255);
  }
  void update() {
    size += 1;
  }
  void draw() {
    fill(c, 100);
    for (float a = 0.1; a <= 1; a += 0.3) {
      ellipse(x, y, a*size, a*size/2);
    }
  }
}

ArrayList<Object> objects;

void setup() {
  size(600, 600);
  drip = loadImage("Drops-PNG-File.png");
  objects = new ArrayList<Object>();
  
  minim = new Minim(this);
  dropSound = minim.loadSample("Water Drop-SoundBible.com-2039669379.mp3");
  
  colorMode(HSB);
  imageMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(0);
  int n = objects.size();
  for (int i = n - 1; 0 <= i; i--) {
    Object o = objects.get(i);
    o.update();
    o.draw();
    if (o instanceof Drip && height < o.y + random(200)) {
      dropSound.trigger();
      objects.set(i, new Ripple(o.x, o.y));
    } else if (o instanceof Ripple && 50 < ((Ripple)o).size) {
      objects.remove(i);
    }
  }
  if (0.95 < random(1)) {
    Object o = new Drip(random(width), -30);
    objects.add(o);
  }
}
