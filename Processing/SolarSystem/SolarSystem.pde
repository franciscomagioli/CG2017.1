color yellow = color(255,255,0);
color blue = color(0,191,255);
color gray = color(192,192,192);
int i=0;


void setup(){
  size(500,500);
  frameRate(30);
}

void draw(){
  background(0);
  ellipseMode(CENTER);
  noStroke();
  //sun
  fill(yellow);
  ellipse(width/2,height/2,100,100);
  
  //earth trajectory
  noStroke();
  float ang= TWO_PI/600;
  float cx = width/2;
  int cy=height/2;
  float r=width/3;
  float t = ang*i;
  float x = r* cos(t) + cx;
  float y = r* sin(t) + cy;
  fill(blue);
  ellipse(x,y,60,60);
  
  // moon trajectory
  fill(gray);
  float angMoon = TWO_PI/100;
  float t2 = angMoon*i;
  float r2 =width/9;
  float xx = r2 * cos(t2) + x;
  float yy = r2 * sin(t2) + y;
  ellipse(xx,yy,20,20);
  
  i++;
}