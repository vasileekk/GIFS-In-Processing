
float circleR = 25f;
float moveR = 50f;
float spinR = 50f;
float speed = .01f;

color[] colorset = {
    #8265FF,
    #7D71FF,
    #717DFF,
    #6482FF,
    #557DFF,
    #4971FF,
    #4565FF,
    #4565FF,
    #4955FF,
    #5549FF,
    #6545FF,
    #7149FF,
    #7D55FF
  };

ArrayList<Circle> s = new ArrayList<Circle>();

void setup() {
  size(800, 600);
  println(colorset.length);
  for (int i = 0; i < colorset.length; i++) {
    int posx = width/2 + int(cos(-PI/4 + i%13*2*PI/13) * moveR);
    int posy = height/2 + int(sin(-PI/4 + i%13*2*PI/13) * moveR);
    float angle = -PI+PI/4 + i%13*2*PI/13;
    float size = i%13*4*PI/3/13;

    float spinO = i%13*PI/13;
    Circle t = new Circle(posx, posy, angle, size, spinO, colorset[i]);
    s.add(t);
  }
}

void draw() {
  clear();
  background(0);
  for (int i = 0; i < s.size(); i++) {
    s.get(i).func();
  }
}

class Circle {
  int x = 0, y = 0;
  float movea = 0, a = 0;
  float sz = 0;
  float spin = 0;
  color cl;
  Circle(int x, int y, float angle, float size, float spin, color s) {
    movea = angle;
    sz = size;
    cl = s;
    this.spin = spin;
    this.x = x;
    this.y = y;
  }

  void func() {
    stroke(cl);
    fill(cl);
    for (int i = 0; i < 6; i++) {
      float posx = x + cos(movea)*moveR + cos(PI/12+(PI/3)*i+a) * (spinR - spinR * (circleDis(spin)/4));
      float posy = y + sin(movea)*moveR + sin(PI/12+(PI/3)*i+a) * (spinR - spinR * (circleDis(spin)/4));
      float size = circleR * (circleSz(sz)/3.125);
      ellipse(posx, posy, size, size);
    }
    movea+=speed;
    a+=speed;
    sz+=speed;
    spin+=speed;
  }
}

float circleDis(float p){
    return sin(3*p/2+3*PI/2)+1f;
}

float circleSz(float p){
  return cos(3*p/2f)+sin(3*p+HALF_PI)+1.125f;
}
