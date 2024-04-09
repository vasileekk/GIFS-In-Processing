int s = 60;
float r = 250;

ArrayList<Pt> points = new ArrayList<Pt>();

int tick = 1;

void setup() {
  size(800, 620);
  for(int i = 0; i < s; i++){
    Pt t = new Pt((360f/float(s))*i+(360f/float(s))/2f, r, i%2!=0, i*3+1-int(i%2!=0)*6);
    points.add(t);
  }
  points.get(1).defMove = !points.get(1).defMove;
}

void draw(){
  clear();
  background(#F9B92F);
  strokeWeight(9);
  stroke(255);
  for(int i = 0; i < s; i++){
    point(width/2+r*sin(radians((360f/float(s))*i)), height/2-r*cos(radians((360f/float(s))*i)));
  }
  strokeWeight(16);
  stroke(0);
  for(int i = 0; i < points.size(); i++){
    points.get(i).update();
  }
  if(tick==421-66){
    points.get(1).push(points.get(1).defMove);
  }
  else if(tick>=421-60){
    points.get(s-2).push(!points.get(s-2).defMove);
    tick=0;
  }
  tick++;   //<>//
}

class Pt{
 float a, angle;
 float d;
 
 int pushTick;
 
 // 0 - outside, 1  - inside
 boolean defMove;
 boolean movement = false;
 boolean peaked = false;
 boolean isMoving = false;
 float speed = 0.5f;
 Pt(float A, float R, boolean move, int t){
  a = angle = A; 
  d = R;
  defMove = move;
  movement = move;
  pushTick = t;
 }
 
 void draw(){
  point(width/2+d*sin(radians(angle)), height/2-d*cos(radians(angle))); 
 }
 
 void update(){
   if(tick==pushTick){
     push(defMove);
   }
   else if(tick==pushTick+211-36){
     push(!defMove);
   }
   
   if(isMoving){
     //out
     if(!movement){
       
       if(peaked){
         
         if(angle >= a + (360f/float(s))*3){
           isMoving = false;
           peaked = false;
           a = angle;
         }
         else{
           angle+=speed;
           d-=speed*5;
         }
         
       }
       //
       else{
         d+=speed*5;
         angle+=speed;
         if(abs(angle-a) >= ((360f/float(s))*3)/2)peaked = true;
       }
     }
     //in
     else{
       if(peaked){
         if(angle <= a - (360f/float(s))*3){
           isMoving = false;
           peaked = false;
           a = angle;
         }
         else{
           angle-=speed;
           d+=speed*4;
         }
       }
       //
       else{
         d-=speed*4;
         angle-=speed;
         if(abs(angle-a) >= ((360f/float(s))*3)/2)peaked = true;
       }
     }
   }
   draw();
 }
 
 void push(boolean m){
   isMoving = true;
   movement = m;
 }
}
