int a = 44;
int r = 160;
float defL = 95;
int speed = 1;
ArrayList<Ln> lines = new ArrayList<Ln>();

void setup(){
  float d = 360f/float(a);
  for(int i = 0; i < a; i++){
    boolean inc = false;
    float setL = defL;
    float diff = defL/float(a)*4;
    if(i%2==0){
      if(i < a/2){
        setL=diff*i/2;
        inc = true;
      }
      else{
        setL = defL - diff*(i/2-a/4);
      }
    }
    else{
      if(i < a/2){
         setL = diff*(a/4-i/2);
      }
      else{
        setL = diff*(i/2-a/4);
        inc = true;
      }
    }
    
    Ln t = new Ln(int(height/2 - r * cos(radians(d*i))), int(width/2 + r * sin(radians(d*i))), d * i, setL, inc);
    lines.add(t);
  }
  frameRate(90);
  
  stroke(255);
  strokeWeight(7);
  strokeCap(SQUARE);
}

void settings() {
  size(600, 600); 
}

void draw(){
  clear();
  background(0);
  
  for(int i = 0; i < lines.size(); i++){
    lines.get(i).draw(); 
  }
}

class Ln{
  int x, y;
  float angle;
  int l;
  boolean inc;
  Ln(int xs, int ys, float angles, float ls, boolean increasing){
    x = xs;
    y = ys;
    angle = angles;
    l = int(ls);
    inc = increasing;
  }
  void draw(){
    if(l>=defL){
     inc = !inc;
     l-=2*speed;
    }
    else if(l<=0){
      inc = !inc;
      l+=speed;
    }
    //float mod = .25f;
    if(inc){
      //l+=speed-(int(l>(defL-defL/4f)))*mod+(int(l<defL/4f))*mod;
      l+=speed;
    }
    else{
      //l-=speed-(int(l<defL/4f))*mod+(int(l>(defL-defL/4f)))*mod;
      l-=speed;
    }
    line(x-l*cos(radians(angle)), y+l*sin(radians(angle)), x+l*cos(radians(angle)), y-l*sin(radians(angle)));
  } 
}
