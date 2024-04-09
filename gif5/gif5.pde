int r = 200;
int fr = 800;

PImage blue = createImage(r, r, ARGB), green = createImage(r, r, ARGB), red = createImage(r, r, ARGB);
PImage back = createImage(fr, fr, ARGB);

void setup() {
  size(800, 600);
  frameRate(120);
  blue.loadPixels();
  for (int i = 0; i < blue.pixels.length; i++) {
    if(sq(i/r-r/2)+sq(i%r-r/2)<sq(r/2)){
      blue.pixels[i] = color(0, 0, 255, 255);
    }
    else {
      blue.pixels[i] = color(0, 0, 0, 0);
    }
  }
  blue.updatePixels();
  
  back.loadPixels();
  for (int i = 0; i < back.pixels.length; i++) {
    back.pixels[i] = color(255, 255, 255, 100-255*((sq(i/fr-fr/2)+sq(i%fr-fr/2))/sq(fr/2)));
  }
  back.updatePixels();
}

float a = 0;
float d = 0;
float diff = 0f;
int max = 50;
boolean maxed = false;

void draw(){
  background(#181D20);
  update();
  image(back, width/2-fr/2+sin(a)*d, height/2-fr/2-cos(a)*d);
  image(blue, width/2-r/2+sin(a+diff)*d, height/2-r/2-cos(a+diff)*d);

  image(red, width/2-r/2+sin(a-diff)*d, height/2-r/2-cos(a-diff)*d);
  
  image(green, width/2-r/2+sin(a)*d, height/2-r/2-cos(a)*d);
  
  if(d>max&&!maxed){
    maxed = true;
  }
  float speed;
  if(maxed){
    speed = 0.6f+int(d<15)*((d%15)/15)*0.5f;
    d-=speed;
    a+=(4*PI/3)/(max/speed);
    diff-=(PI/3)/(max/speed);
    if(a>4*PI){
      a = 0;
      d = 0;
      diff = 0f;
      maxed = false;
    }
  }
  else{
    speed = 0.75f+int(d<20)*((d%20)/20)*1.0f-int(d>35)*((d%35)/15)*0.25f;
    d+=speed;
    a+=(4*PI-4*PI/3)/(max/speed);
    diff+=(2*PI/3)/(max/speed);
  }
}

boolean inCircle(float x1, float y1){
 return sq(x1)+sq(y1)<sq(r/2);
}

void update(){
  
  red.loadPixels();
  int x = 0, y = 0;
  for (int i = 0; i < red.pixels.length; i++) {
    x = i/r-r/2;
    y = i%r-r/2;
    if(sq(x)+sq(y)<sq(r/2)){
      if(inCircle(sin(a+diff+HALF_PI)*d-sin(a-diff+HALF_PI)*d+x, cos(a+diff+HALF_PI)*d-cos(a-diff+HALF_PI)*d+y)){
        red.pixels[i] = color(255, 0, 255, 255);
      }
      else{
        red.pixels[i] = color(255, 0, 0, 255);
      }
    }
    else {
      red.pixels[i] = color(0, 0, 0, 0);
    }
  }
  red.updatePixels();
  green.loadPixels();
  for (int i = 0; i < green.pixels.length; i++) {
    x = i/r-r/2;
    y = i%r-r/2;
    if(sq(i/r-r/2)+sq(i%r-r/2)<sq(r/2)){
      if(inCircle(sin(a+diff+HALF_PI)*d-sin(a+HALF_PI)*d+x, cos(a+diff+HALF_PI)*d-cos(a+HALF_PI)*d+y)){
        if(inCircle(sin(a-diff+HALF_PI)*d-sin(a+HALF_PI)*d+x, cos(a-diff+HALF_PI)*d-cos(a+HALF_PI)*d+y)){
          green.pixels[i] = color(255, 255, 255, 255);
        }
        else{
          green.pixels[i] = color(0, 255, 255, 255);
        }
      }
      else if(inCircle(sin(a-diff+HALF_PI)*d-sin(a+HALF_PI)*d+x, cos(a-diff+HALF_PI)*d-cos(a+HALF_PI)*d+y)){
        green.pixels[i] = color(255, 255, 0, 255);
      }
      else{
        green.pixels[i] = color(0, 255, 0, 255);
      }
    }
    else {
      green.pixels[i] = color(0, 0, 0, 0);
    }
  }
  green.updatePixels();
}
