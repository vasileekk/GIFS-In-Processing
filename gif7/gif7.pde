void setup(){
  size(512, 512);
  fill(0);
  noStroke();
}

float R = 14f;
float p = 0;
float rStep = 20f;
float turn = 2*PI/12f;
void draw(){
  clear();
  background(255);
  for(int c = 1; c < 4; c++){
    float a = (p)+c*turn/2;
    for(int i = 0; i < 12; i++){
      ellipse(width/2+c*rStep*cos(i*turn-QUARTER_PI*sin(a-HALF_PI)), height/2+c*rStep*sin(i*turn-QUARTER_PI*sin(a-HALF_PI)), R+R*sin(2*p+c*turn)/2, R+R*sin(2*p+c*turn)/2);
    }    
  }
  for(int c = 4; c < 12; c++){
    float a = (p)+c*turn;
    for(int i = 0; i < 12; i++){
      ellipse(width/2+c*rStep*cos(i*turn-QUARTER_PI*sin(a-PI)), height/2+c*rStep*sin(i*turn-QUARTER_PI*sin(a-PI)), R+R*sin(2*p+c*turn)/2, R+R*sin(2*p+c*turn)/2);
    }    
  }
  ellipse(width/2, height/2, R+R*sin(2*p)/2, R+R*sin(2*p)/2);
  p+=0.025f;
}
