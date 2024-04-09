color defC = color(18, 200, 124);

void setup() {
  size(800, 600);
  noFill();
  stroke(defC);
}

float begin = HALF_PI-0.75f;
float end = HALF_PI-0.75f;
float p = HALF_PI;

boolean e = false;

void draw() {
  background(255);
  
  strokeWeight(constrain(23-int(begin>=5*PI)*((begin-5*PI)/(HALF_PI))*23-int(end<=PI)*((1-(end-(HALF_PI))/HALF_PI))*23, 0, 23));
  arc(320, 310, 210, 250, constrain(begin, HALF_PI+QUARTER_PI, 2*PI), constrain(end, HALF_PI+QUARTER_PI, 2*PI)); // HALF_PI+QUARTER_PI -> 2*PI
  arc(385, 310, 80, 100, constrain(begin-2*PI, 0, PI), constrain(end-2*PI, 0, PI)); // 2 PI -> 3 PI
  arc(450, 310, 210, 250, constrain(begin-2*PI, PI, 2*PI), constrain(end-2*PI, PI, 2*PI)); // 3 PI -> 4 PI
  arc(498, 309, 115, 240, constrain(begin-4*PI, 0, HALF_PI+QUARTER_PI), constrain(end-4*PI, 0, HALF_PI+QUARTER_PI)); // 4 PI -> 4 pi+HALF_PI+QUARTER_PI
  arc(652, 389, 390, 340, constrain(begin-4*PI+QUARTER_PI, PI, PI+QUARTER_PI*1.5), constrain(end-4*PI+QUARTER_PI, PI, PI+QUARTER_PI*1.5)); // 4 PI+HALF_PI+QUARTER_PI -> 5*PI+QUARTER_PI*0.5
  strokeWeight(constrain(40-int(begin>=5*PI)*((begin-5*PI)/(HALF_PI)*40)-int(p<=HALF_PI+QUARTER_PI)*((1-(p-(HALF_PI))/QUARTER_PI))*40, 0, 40));
  drawCircle();
  if (p < 5*PI+QUARTER_PI*0.9f) {
    p+=0.1f;
    if (2*PI < p && p < 3*PI){
      p+=.15f;
    }
    else if(4*PI < p && p < 4*PI+HALF_PI+QUARTER_PI){
      p+=0.05f;
    }
    else if (p >= 4*PI+HALF_PI+QUARTER_PI) {
      p-=0.07f;
    }
  }
  end+=.1f;
  if (2*PI < end && end < 3*PI) {
    end+=.15f;
  }
  else if(4*PI < end && end < 4*PI+HALF_PI+QUARTER_PI){
    end+=0.05f;
  }
  else if (end >= 4*PI+HALF_PI+QUARTER_PI) {
    end-=0.075f;
  }
  if (e) {
    begin+=0.2f;
    if (2*PI < begin && begin < 3*PI || 4*PI < begin && begin < 4*PI+HALF_PI+QUARTER_PI) {
      begin+=.2f;
    }
  }
  
  if (end > 5*PI+QUARTER_PI/3) {
    e = true;
  }
  if (begin > 5*PI+HALF_PI) {
    e = false;
    begin = HALF_PI-0.75f;
    end = HALF_PI-0.75f;
    p = HALF_PI;
  }
}

void drawCircle() {
  arc(320, 310, 210, 250, constrain(p-0.001f, HALF_PI, 2*PI), constrain(p, HALF_PI, 2*PI));
  arc(385, 310, 80, 100, constrain(p-0.001f-2*PI, 0, PI), constrain(p-2*PI, 0, PI));
  arc(450, 310, 210, 250, constrain(p-0.001f-2*PI, PI, 2*PI+QUARTER_PI), constrain(p-2*PI, PI, 2*PI));
  arc(498, 310, 115, 240, constrain(p-0.001f-4*PI, 0, HALF_PI+QUARTER_PI), constrain(p-4*PI, 0, HALF_PI+QUARTER_PI));
  arc(651, 387, 390, 340,constrain(p-0.001f-4*PI+QUARTER_PI, PI, PI+HALF_PI), constrain(p-4*PI+QUARTER_PI, PI, PI+HALF_PI));
}
