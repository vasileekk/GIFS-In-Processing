ArrayList<Line> lines = new ArrayList<Line>();

color c1 = color(251, 188, 0);
color c2 = color(241, 21, 55);
color c3 = color(60, 184, 172);

void setup() {
  size(300, 300);
  frameRate(40);
  noFill();
  strokeWeight(4);
  Line buff;
  //yellow
  for (int i = 0; i < 5; i++) {
    buff = new Line(50+15*i, -PI/6f, c1, PI/float(14-i));
    lines.add(buff);
  }
  //blue
  for (int i = 0; i < 5; i++) {
    buff = new Line(50+15*i, PI/6f, c3, PI/float(14-i));
    lines.add(buff);
  }
  //red
  for (int i = 0; i < 5; i++) {
    buff = new Line(50+15*i, HALF_PI, c2, PI/float(14-i));
    lines.add(buff);
  }
}


void draw() {
  clear();
  background(25);
  for (int i = 0; i < lines.size(); i ++) {
    lines.get(i).update();
    lines.get(i).draw();
  }
  if(lines.get(lines.size()-1).angle == TWO_PI){
    for (int i = 0; i < lines.size(); i ++) {
      lines.get(i).angle = 0;
  }
  }
}

public class Line {
  float start;
  float angle = 0;
  float speed = 0;
  float acceleration = 0.02f;
  float r;
  color c;
  float l;

  Line(float rad, float angle, color c, float l) {
    start = angle;
    r = rad;
    this.c = c;
    this.l = l;
  }

  void update() {
    if (angle <= PI) {
      speed += acceleration * (25f / r);
      //speed += acceleration;
    } else {
      speed -= acceleration * (25f / r);
      //speed -= acceleration;

      if (speed < 0) {
        speed = 0;
        angle = TWO_PI;
      }
    }
    angle += speed;
    if (angle >= 2 * PI) {
      angle = TWO_PI;
    }
  }

  void draw() {
    stroke(c);
    arc(width/2, height/2, r+abs(speed)*r, r+abs(speed)*r, start + angle - l + l*abs(speed/0.25f), start + angle + l - l*abs(speed/0.25f));
    arc(width/2, height/2, r+abs(speed)*r, r+abs(speed)*r, start + angle - l + l*abs(speed/0.25f) + PI, start + angle + l - l*abs(speed/0.25f) + PI);
  }
}
