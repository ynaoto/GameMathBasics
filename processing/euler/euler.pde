Camera cam;
Light lit;
Cube cubes[];

class PAC
{
  float cx, cy, cz;
  color col;
  PAC(float cx, float cy, float cz, color col)
  {
    this.cx = cx; this.cy = cy; this.cz = cz;
    this.col = col;
  }
}

PAC pac[] = {
  new PAC(-200, -100, 200, color(0, 0, 255)),
  new PAC(-200,  100, 200, color(255, 0, 0)),
  new PAC(   0, -100, 200, color(0, 255, 0)),
  new PAC(   0,  100, 200, color(255, 0, 255)),
  new PAC( 200, -100, 200, color(0, 255, 255)),
  new PAC( 200,  100, 200, color(255, 255, 0)),
};

void setup()
{
  size(640, 640);
  background(0);

  cam = new Camera();
  cam.d = 500;

  lit = new Light();
  lit.x = 0; lit.y = 0; lit.z = 10;

  int n = pac.length;
  cubes = new Cube[n];
  for (int i = 0; i < n; i++) {
    Cube p = new Cube(100, pac[i].col);
    p.move(pac[i].cx, pac[i].cy, pac[i].cz);
    cubes[i] = p; 
  }
}

void draw()
{
  background(0);
  
  lit.x = 100.0 * ((width/2) - mouseX) / width;
  lit.y = 100.0 * ((height/2) - mouseY) / height;

  float theta = PI/100;

  for (int i = 0; i < pac.length; i++) {
    Cube p = cubes[i];
    p.move(-pac[i].cx, -pac[i].cy, -pac[i].cz);
    switch (i) {
    case 0: p.rotx(theta); p.roty(theta); p.rotz(theta); break;
    case 1: p.rotx(theta); p.rotz(theta); p.roty(theta); break;
    case 2: p.roty(theta); p.rotx(theta); p.rotz(theta); break;
    case 3: p.roty(theta); p.rotz(theta); p.rotx(theta); break;
    case 4: p.rotz(theta); p.rotx(theta); p.roty(theta); break;
    case 5: p.rotz(theta); p.roty(theta); p.rotx(theta); break;
    }
    p.move(pac[i].cx, pac[i].cy, pac[i].cz);
    p.draw(cam, lit);  
  }

  fill(255);
  text("cam.d: " + cam.d, 10, 30);
  text("lit: " + lit.x + ", " + lit.y + ", " + lit.z, 10, 50);
}
