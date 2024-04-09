color back = color(28);
color a1 = color(37, 235, 235), a2 = color(235, 28, 28);
color conn = color(47, 47, 47);
color grey1 = color(73);

int speed = 20;
int mradius = 100;
int ballR = 25;
int space = 40;

ArrayList<Ch> lines = new ArrayList<Ch>();

void setup() {
  size(540, 810);
  for(int i = 0; i<12; i++){
    Ch t = new Ch(int(height/2-space*6+space*i), mradius-i%11*speed-int(i/11)*speed);
    lines.add(t);
  }
  strokeWeight(6);
  strokeCap(SQUARE);
  frameRate(8);
  textSize(16);
}

void draw(){
  clear();
  background(0);
  fill(back);
  rect(18, 18, width-36, height-36);
  for(int i = 0; i<12; i++){
    lines.get(i).process();
    }
  fill(grey1);
  text("DNA", 470, 750);
}

class Ch{
  int y;
  int r;
  Ch(int sety, int rad){
    y = sety;
    r = rad;
  }
  
  void process(){
    if(abs(r)==mradius)r =- mradius;
    int offset = int(float(ballR)/4f-(abs(r)/float(mradius))*float(ballR)/4f);

    noStroke();
    fill(lerpColor(a2, grey1, 0.5));
    arc(width/2-r-offset/2, y, ballR, ballR, HALF_PI, PI+HALF_PI);

    fill(lerpColor(a1, grey1, 0.5));
    arc(width/2-r+offset/2, y, ballR, ballR, -HALF_PI, HALF_PI);

    fill(color(73f+float(222-73)*(1f-(float(ballR)/4f-offset)/(float(ballR)/4f))));
    ellipse(width/2-r, y, ballR-offset, ballR);

    stroke(conn);
    line(width/2-r+(int(r>0)+int(r>0)-1)*(float(ballR)/8f-offset), y, width/2+r+(int(r>0)+int(r>0)-1)*(float(ballR)/8f-offset), y);
    
    noStroke();
    fill(a1);
    arc(width/2+r-offset/2, y, ballR, ballR, HALF_PI, PI+HALF_PI);

    fill(a2);
    arc(width/2+r+offset/2, y, ballR, ballR, -HALF_PI, HALF_PI);
    
    fill(color(73f+float(255-73)*(1f-(float(ballR)/4f-offset)/(float(ballR)/4f))));
    ellipse(width/2+r, y, ballR-offset, ballR);

    r += speed;
  }
}
