// sounds from http://www.nano-graph.com/sound/b_digital1.html
import ddf.minim.*;
Minim minim;

class Rect {
  float x, y, w, h;
  color c;
  AudioSample audio;
  Rect(float x, float y, float w, float h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  void draw() {
    rectMode(CENTER);
    fill(c);
    rect(x, y, w, h);
  }
  boolean collide(Rect o) {
    float dx = abs(x - o.x);
    float dy = abs(y - o.y);
    return (dx <= (w + o.w)/2) && (dy <= (h + o.h)/2);
  }
}

class Mover extends Rect {
  Mover(float x, float y) {
    super(x, y, 50, 50, color(255));
  }
  void update() {
    if (keyPressed && key == CODED) {
      switch (keyCode) {
        case RIGHT: x++; break;
        case LEFT:  x--; break;
        case DOWN:  y++; break;
        case UP:    y--; break;
        default:
          // do nothing
      }
    }
  }
}

ArrayList<Rect> walls;
Mover mover;

void setup() {
  size(300, 300);
  minim = new Minim(this);
  
  walls = new ArrayList<Rect>();
  float w = 40;
  float cx = width/2;
  float cy = height/2;
  Rect wall;
  // 上 赤
  wall = new Rect(cx, w/2, width, w, #ff0000);
  wall.audio = minim.loadSample("densi01.mp3");
  walls.add(wall);
  // 右 黄 
  wall = new Rect(width - w/2, cy, w, height, #ffff00);
  wall.audio = minim.loadSample("densi02.mp3");
  walls.add(wall);
  // 下 緑 
  wall = new Rect(cx, height - w/2, width, w, #00ff00);
  wall.audio = minim.loadSample("densi03.mp3");
  walls.add(wall);
  // 左 青 
  wall = new Rect(w/2, cy, w, height, #0000ff);
  wall.audio = minim.loadSample("densi04.mp3");
  walls.add(wall);
  // 中央 紫 
  wall = new Rect(cx, cy, w, w, #ff00ff);
  wall.audio = minim.loadSample("densi05.mp3");
  walls.add(wall);

  mover = new Mover(width/2, height/2);
}

Rect lastCollide = null;

void draw() {
  background(0);
  mover.update();
  Rect collide = null;
  for (Rect w : walls) {
    w.draw();
    if (mover.collide(w)) {
      collide = w;
    }
  }
  if (collide != null) {
    mover.c = collide.c;
    if (collide != lastCollide) {
      collide.audio.trigger();
    }
  }
  lastCollide = collide;
  
  mover.draw();
}

