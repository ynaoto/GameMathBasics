class Point2D
{
  float x, y;

  Point2D sub(Point2D o)
  {
    Point2D p = new Point2D();
    p.x = x - o.x;
    p.y = y - o.y;
    return p;
  }

  float cross(Point2D o)
  {
    return x*o.y-y*o.x;
  }
}

class Point3D
{
  float x, y, z;

  Point3D sub(Point3D o)
  {
    Point3D p = new Point3D();
    p.x = x - o.x;
    p.y = y - o.y;
    p.z = z - o.z;
    return p;
  }

  float norm()
  {
    return sqrt(x*x+y*y+z*z);
  }

  Point3D normalize()
  {
    Point3D p = new Point3D();
    float d = norm();
    p.x = x / d;
    p.y = y / d;
    p.z = z / d;
    return p;
  }

  float prod(Point3D o)
  {
    return x * o.x + y * o.y + z * o.z;
  }

  Point3D cross(Point3D o)
  {
    Point3D p = new Point3D();
    p.x = y * o.z - z * o.y;
    p.y = z * o.x - x * o.z;
    p.z = x * o.y - y * o.x;
    return p;
  }
}

class Camera
{
  float d;
  Point2D proj(Point3D p)
  {
    Point2D q = new Point2D();
    q.x = d * p.x / (d + p.z);
    q.y = d * p.y / (d + p.z);
    return q;
  }
}

class Light extends Point3D
{
  float ambient = 80;
  color apply(Point3D nrm, color c)
  {
    float L = max(0, normalize().prod(nrm));
    float R = L * red(c) + ambient;
    float G = L * green(c) + ambient;
    float B = L * blue(c) + ambient;
    return color(R, G, B);
  }
}

class Poly
{
  float x, y, z;
  float r, theta, phi;
  Point3D v[];
  color c;
  private Point2D v2d[];
  
  Poly(int n, color c)
  {
    v = new Point3D[n];
    this.c = c;
    v2d = new Point2D[n];
    for (int i = 0; i < v.length; i++) {
      v[i] = new Point3D();
    }
  }
  
  void draw(Camera cam, Light lit)
  {
    for (int i = 0; i < v.length; i++) {
      v2d[i] = cam.proj(v[i]);
      v2d[i].x += width / 2;
      v2d[i].y += height / 2;
    }
    Point2D a2d = v2d[1].sub(v2d[0]);
    Point2D b2d = v2d[2].sub(v2d[1]);
    float cross = a2d.cross(b2d);
    if (0 < cross) {
      Point3D a3d = v[1].sub(v[0]);
      Point3D b3d = v[2].sub(v[1]);
      Point3D nrm = a3d.cross(b3d).normalize();
      fill(lit.apply(nrm, c));
      noStroke();
      beginShape();
      for (int i = 0; i < v2d.length; i++) {
        vertex(v2d[i].x, v2d[i].y);
      }
      endShape(CLOSE);
    } else {
      /*
      fill(255, 0, 0);
      noStroke();
      beginShape();
      for (int i = 0; i < v2d.length; i++) {
        vertex(v2d[i].x, v2d[i].y);
      }
      endShape(CLOSE);
      */
    }
  }

  Point3D center()
  {
    Point3D c = new Point3D();
    c.x = c.y = c.z = 0;
    for (int i = 0; i < v.length; i++) {
      c.x += v[i].x;
      c.y += v[i].y;
      c.z += v[i].z;
    }
    c.x /= v.length;
    c.y /= v.length;
    c.z /= v.length;
    return c;
  }
  
  void rotx(float rx)
  {
    for (int i = 0; i < v.length; i++) {
      float r = mag(v[i].z, v[i].y);
      float theta = atan2(v[i].y, v[i].z);
      v[i].z = r * cos(theta + rx);
      v[i].y = r * sin(theta + rx);
    }
  }

  void roty(float ry)
  {
    for (int i = 0; i < v.length; i++) {
      float r = mag(v[i].z, v[i].x);
      float theta = atan2(v[i].x, v[i].z);
      v[i].z = r * cos(theta + ry);
      v[i].x = r * sin(theta + ry);
    }
  }

  void rotz(float rz)
  {
    for (int i = 0; i < v.length; i++) {
      float r = mag(v[i].x, v[i].y);
      float theta = atan2(v[i].y, v[i].x);
      v[i].x = r * cos(theta + rz);
      v[i].y = r * sin(theta + rz);
    }
  }
  
  void move(float dx, float dy, float dz)
  {
    for (int i = 0; i < v.length; i++) {
      v[i].x += dx;
      v[i].y += dy;
      v[i].z += dz;
    }
  }
}

class Square extends Poly
{
  Square(int sz, color c)
  {
    super(4, c);
    v[0].x = sz/2;
    v[0].y = sz/2;
    v[1].x = -sz/2;
    v[1].y = sz/2;
    v[2].x = -sz/2;
    v[2].y = -sz/2;
    v[3].x = sz/2;
    v[3].y = -sz/2;
    v[0].z = v[1].z = v[2].z = v[3].z = 0;
  }
}

