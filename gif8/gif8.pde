int r = 10;
int step = 60;

color c1 = color(254, 25, 254), c2 = color(137, 255, 185), c3 = color(254, 254, 25);

ArrayList<cir> sq1 = new ArrayList<cir>(), sq2 = new ArrayList<cir>(), sq3 = new ArrayList<cir>();

int tick = 0;
void setup() {
  size(540, 405);
  imageMode(CENTER);
  frameRate(45);
  for (int i = 0; i < 9; i++) {
    sq1.add(new cir(c1, width/2-step+step*(i%3), height/2-step+step*(i/3)));
    sq2.add(new cir(c2, width/2-step+step*(i%3), height/2-step+step*(i/3)));
    sq3.add(new cir(c3, width/2-step+step*(i%3), height/2-step+step*(i/3)));
  }
  noStroke();
}

void draw() {
  background(#191919);
  if (tick<30) {
    move1(sq1, -1);
    move1(sq2, 0);
    move1(sq3, 1);
  } else if (tick>=46 && tick < 76) {
    move2(sq1, -1);
    move2(sq2, 0);
    move2(sq3, 1);
  } else if (tick>=91 && tick<122) {
    move3(sq1, -1);
    move3(sq2, 0);
    move3(sq3, 1);
  } else if (tick>=122) {
    for (int i = 0; i < 9; i++) {
      sq1.get(i).x = width/2-step+step*(i%3);
      sq1.get(i).y = height/2-step+step*(i/3);

      sq2.get(i).x = width/2-step+step*(i%3);
      sq2.get(i).y = height/2-step+step*(i/3);

      sq3.get(i).x = width/2-step+step*(i%3);
      sq3.get(i).y = height/2-step+step*(i/3);
    }
  }
  check();
  for (int i = 0; i < 9; i++) {
    sq1.get(i).draw();
    sq2.get(i).draw();
    sq3.get(i).draw();
  }
  tick++;
  if (tick>150)tick = 0;
}

class cir {
  color col;
  float x = 0, y = 0;
  boolean white = false;
  cir(color c, float x, float y) {
    col = c;
    this.x = x;
    this.y = y;
  }
  void draw() {
    if (white) {
      fill(255);
    } else {
      fill(col);
    }
    ellipse(x, y, r, r);
  }
}

void move1(ArrayList<cir> sq, int dir) {
  sq.get(4).y=sq.get(4).y + dir*1.5f;
  //<
  float d = (3*PI/4)/30;
  sq.get(0).x = sq.get(4).x + cos(-3*PI/4+ d *(tick+1))*sqrt(2*sq(step));
  sq.get(0).y = sq.get(4).y + sin(-3*PI/4+ d *(tick+1))*sqrt(2*sq(step));

  sq.get(2).x = sq.get(4).x + cos(-QUARTER_PI+ d *(tick+1))*sqrt(2*sq(step-tick-1));
  sq.get(2).y = sq.get(4).y + sin(-QUARTER_PI+ d *(tick+1))*sqrt(2*sq(step-tick-1));

  sq.get(6).x = sq.get(4).x + cos(3*PI/4+ d *(tick+1))*sqrt(2*sq(step-tick-1));
  sq.get(6).y = sq.get(4).y + sin(3*PI/4+ d *(tick+1))*sqrt(2*sq(step-tick-1));

  sq.get(8).x = sq.get(4).x + cos(QUARTER_PI+ d *(tick+1))*sqrt(2*sq(step));
  sq.get(8).y = sq.get(4).y + sin(QUARTER_PI+ d *(tick+1))*sqrt(2*sq(step));
  //
  sq.get(1).x = sq.get(4).x + cos(-HALF_PI+ d *(tick+1))*sqrt(sq(step));
  sq.get(1).y = sq.get(4).y + sin(-HALF_PI+ d *(tick+1))*sqrt(sq(step))/2;

  sq.get(7).x = sq.get(4).x + cos(HALF_PI+ d *(tick+1))*sqrt(sq(step));
  sq.get(7).y = sq.get(4).y + sin(HALF_PI+ d *(tick+1))*sqrt(sq(step))/2;

  sq.get(3).x = sq.get(4).x + cos(-PI+ d *(tick+1))*sqrt(sq(step));
  sq.get(3).y = sq.get(4).y + sin(-PI+ d *(tick+1))*sqrt(sq(step))/2;

  sq.get(5).x = sq.get(4).x + cos(d *(tick+1))*sqrt(sq(step));
  sq.get(5).y = sq.get(4).y + sin(d *(tick+1))*sqrt(sq(step))/2;
}

void move2(ArrayList<cir> sq, int dir) {
  int t = tick - 45;
  sq.get(4).x=width/2+dir*sin((t/30f)*PI)*step;

  //<
  float d = (3*QUARTER_PI)/14f;
  if (t>16) {
    t=16-t%15;
  }
  if (tick==75) {
    t=0;
  }
  sq.get(0).x = sq.get(4).x + cos(d *(t))*sqrt(2*sq(step));
  sq.get(0).y = sq.get(4).y + sin(d *(t))*sqrt(2*sq(step))/2;

  sq.get(2).x = sq.get(4).x + cos(HALF_PI+ d *(t/2f))*sqrt(2*sq(step));
  sq.get(2).y = sq.get(4).y + sin(HALF_PI+ d *(t/2f))*sqrt(2*sq(step))/2;

  sq.get(6).x = sq.get(4).x + cos(-HALF_PI+ d *(t/2f))*sqrt(2*sq(step));
  sq.get(6).y = sq.get(4).y + sin(-HALF_PI+ d *(t/2f))*sqrt(2*sq(step))/2;

  sq.get(8).x = sq.get(4).x + cos(-PI+ d *(t))*sqrt(2*sq(step));
  sq.get(8).y = sq.get(4).y + sin(-PI+ d *(t))*sqrt(2*sq(step))/2;
  ////
  sq.get(1).x = sq.get(4).x + cos(QUARTER_PI+ d *(t/1.25f))*sqrt(sq(step+t*1.75f));
  sq.get(1).y = sq.get(4).y + sin(QUARTER_PI+ d *(t/1.25f))*sqrt(sq(step+t*1.75f))/2;

  sq.get(7).x = sq.get(4).x + cos(-3*QUARTER_PI+ d *(t/1.25f))*sqrt(sq(step+t*1.75f));
  sq.get(7).y = sq.get(4).y + sin(-3*QUARTER_PI+ d *(t/1.25f))*sqrt(sq(step+t*1.75f))/2;

  sq.get(3).x = sq.get(4).x + cos(-QUARTER_PI+ d *(t/1.25f))*sqrt(sq(step-t*3f));
  sq.get(3).y = sq.get(4).y + sin(-QUARTER_PI+ d *(t/1.25f))*sqrt(sq(step-t*3f))/2;

  sq.get(5).x = sq.get(4).x + cos(3*QUARTER_PI+ d *(t/1.25f))*sqrt(sq(step-t*3f));
  sq.get(5).y = sq.get(4).y + sin(3*QUARTER_PI+ d *(t/1.25f))*sqrt(sq(step-t*3f))/2;
}

void move3(ArrayList<cir> sq, int dir) {
  int t = tick-90;
  if (tick<110) {
    float d = PI/18f;
    sq.get(4).x = width/2 + abs(dir)*cos(dir*HALF_PI-d *(t))*step;
    sq.get(4).y = height/2 + abs(dir)*sin(dir*HALF_PI-d *(t))*step;

    sq.get(0).x = sq.get(4).x + cos(- d *(t))*step;
    sq.get(0).y = sq.get(4).y + sin(- d *(t))*step;

    sq.get(2).x = sq.get(4).x + cos(HALF_PI - d *(t))*step;
    sq.get(2).y = sq.get(4).y  + sin(HALF_PI - d *(t))*step/2;

    sq.get(6).x = sq.get(4).x + cos(-HALF_PI - d *(t))*step;
    sq.get(6).y = sq.get(4).y + sin(-HALF_PI - d *(t))*step/2;

    sq.get(8).x = sq.get(4).x + cos(-PI - d *(t))*step;
    sq.get(8).y = sq.get(4).y  + sin(-PI - d *(t))*step;
    //////
    sq.get(1).x = sq.get(4).x + cos(QUARTER_PI- d *(t))*sqrt(sq(step+t));
    sq.get(1).y = sq.get(4).y + sin(QUARTER_PI- d *(t))*sqrt(sq(step+t))/2;

    sq.get(7).x = sq.get(4).x + cos(-3*QUARTER_PI- d *(t))*sqrt(sq(step+t));
    sq.get(7).y = sq.get(4).y + sin(-3*QUARTER_PI- d *(t))*sqrt(sq(step+t))/2;

    sq.get(3).x = sq.get(4).x + cos(-QUARTER_PI- d *(t))*sqrt(sq(step-abs(15-t)*1.5f));
    sq.get(3).y = sq.get(4).y + sin(-QUARTER_PI- d *(t))*sqrt(sq(step-abs(15-t)*1.5f))/2;

    sq.get(5).x = sq.get(4).x + cos(3*QUARTER_PI- d *(t))*sqrt(sq(step-abs(15-t)*1.5f));
    sq.get(5).y = sq.get(4).y + sin(3*QUARTER_PI- d *(t))*sqrt(sq(step-abs(15-t)*1.5f))/2;
  } else {
    float d = 15-(tick-110);
    for (int i = 0; i< 9; i++) {
      float dx = width/2-step+step*(i%3), dy = height/2-step+step*(i/3);
      sq.get(i).x-=2*(sq.get(i).x-dx)/d;
      sq.get(i).y-=2*(sq.get(i).y-dy)/d;
    }
  }
}

boolean inC(float x1, float y1, float x2, float y2) {
  return dist(x1, y1, x2, y2)<(r/2);
}

void check() {
  for (int i = 0; i < 9; i++) {
    boolean set = false;
    for (int j = 0; j < 9; j++) {
      if (inC(sq1.get(i).x, sq1.get(i).y, sq2.get(j).x, sq2.get(j).y)) {
        set = true;
      }
    }
    for (int j = 0; j < 9; j++) {
      if (inC(sq1.get(i).x, sq1.get(i).y, sq3.get(j).x, sq3.get(j).y)) {
        set = true;
      }
    }
    sq1.get(i).white = set;
  }
  
  for (int i = 0; i < 9; i++) {
    boolean set = false;
    for (int j = 0; j < 9; j++) {
      if (inC(sq2.get(i).x, sq2.get(i).y, sq1.get(j).x, sq1.get(j).y)) {
        set = true;
      }
    }
    for (int j = 0; j < 9; j++) {
      if (inC(sq2.get(i).x, sq2.get(i).y, sq3.get(j).x, sq3.get(j).y)) {
        set = true;
      }
    }
    sq2.get(i).white = set;
  }
  
  for (int i = 0; i < 9; i++) {
    boolean set = false;
    for (int j = 0; j < 9; j++) {
      if (inC(sq3.get(i).x, sq3.get(i).y, sq2.get(j).x, sq2.get(j).y)) {
        set = true;
      }
    }
    for (int j = 0; j < 9; j++) {
      if (inC(sq3.get(i).x, sq3.get(i).y, sq1.get(j).x, sq1.get(j).y)) {
        set = true;
      }
    }
    sq3.get(i).white = set;
  }
}
