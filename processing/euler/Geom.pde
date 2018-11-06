class Geom
{
  Poly surfaces[];

  void move(float dx, float dy, float dz)
  {
    for (int i = 0; i < surfaces.length; i++) {
      Poly p = surfaces[i];
      p.move(dx, dy, dz);
    }
  }

  void rotx(float rx)
  {
    for (int i = 0; i < surfaces.length; i++) {
      Poly p = surfaces[i];
      p.rotx(rx);
    }
  }

  void roty(float ry)
  {
    for (int i = 0; i < surfaces.length; i++) {
      Poly p = surfaces[i];
      p.roty(ry);
    }
  }

  void rotz(float rz)
  {
    for (int i = 0; i < surfaces.length; i++) {
      Poly p = surfaces[i];
      p.rotz(rz);
    }
  }
  
  void draw(Camera cam, Light lit)
  {
    for (int i = 0; i < surfaces.length; i++) {
      Poly p = surfaces[i];
      p.draw(cam, lit);
    }
  }
}

class Cube extends Geom
{
  Cube(int sz, color c)
  {
    surfaces = new Square[6];
    Poly p;
  
    surfaces[0] = p = new Square(sz, c);
    p.roty(-0*PI/2);
    p.move(0, 0, -sz/2);
  
    surfaces[1] = p = new Square(sz, c);
    p.roty(-1*PI/2);
    p.move(sz/2, 0, 0);
  
    surfaces[2] = p = new Square(sz, c);
    p.roty(-2*PI/2);
    p.move(0, 0, sz/2);
    
    surfaces[3] = p = new Square(sz, c);
    p.roty(-3*PI/2);
    p.move(-sz/2, 0, 0);
    
    surfaces[4] = p = new Square(sz, c);
    p.rotx(-1*PI/2);
    p.move(0, sz/2, 0);
    
    surfaces[5] = p = new Square(sz, c);
    p.rotx(1*PI/2);
    p.move(0, -sz/2, 0);
  }
}

