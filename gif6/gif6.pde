int ps = 60;
float R = 150;
ArrayList<P> points = new ArrayList<P>();

void setup(){
  size(500, 500);
  float off = 11*PI/9;
  for(int i = 0; i < ps; i++){
    points.add(new P(width/2 + sin(i*2*PI/ps)*R, height/2 + cos(i*2*PI/ps)*R, width/2 + sin(i*2*PI/ps+off)*R, height/2+ cos(i*2*PI/ps+off)*R, random(2f, 4f) )); 
  }
  strokeWeight(3.5);
  stroke(0);
}

void draw(){
  clear();
  background(255);
  for(int i = 0; i < ps; i++){
    points.get(i).update(); 
  }
  
  int f = 0;
  for(int i = 0; i < ps; i++){
    if(!points.get(i).f)f++;
  }
  if(f==0){
    for(int i = 0; i < ps; i++){
      points.get(i).push(); 
    }
  }
}

class P{
  float x, y;
  float x1, y1;
  float x2, y2;
  float sx, sy;
  boolean back = false;
  boolean f = false;
  P(float x11, float y11, float x22, float y22, float s){
    x1 = x11; y1 = y11;
    x2 = x22; y2 = y22;
    
    x = x1; y = y1;

    sx = abs(x2-x1)/dis(0, 0, x1-x2, y1-y2)*s;
    sy = abs(y2-y1)/dis(0, 0, x1-x2, y1-y2)*s;
  }
  
  void update(){
    point(x, y);
    move();
    point(x, y);
    move();
    point(x, y);
  }
  void move(){
    if(back){
      if(dis(x, y, x2, y2)<dis(x1, y1, x2, y2) && !f){
        x+=(x1-x)/abs(x1-x)*sx;
        y+=(y1-y)/abs(y1-y)*sy;
      }
      else{
        x = x1;
        y = y1;
        f = true;
      }
    }
    else{
      if(dis(x, y, x1, y1)<dis(x1, y1, x2, y2) && !f){
        x+=(x2-x)/abs(x2-x)*sx;
        y+=(y2-y)/abs(y2-y)*sy;
      }
      else{
        x = x2;
        y = y2;
        f = true;
      }
    }
  }
  void push(){
    back=!back;
    f = false;
  }
}

float dis(float x1, float y1, float x2, float y2){
  return sqrt(sq(x2-x1)+sq(y2-y1));
}
