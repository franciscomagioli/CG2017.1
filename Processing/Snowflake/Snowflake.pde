//Define maxIntKoch for the max number of interations in the fractal
int maxIntKoch = 5;

float[] roda(float px,float py,float qx,float qy,float theta){
  float p2x = px - qx;
  float p2y = py - qy;
  float p3x = p2x*cos(theta)+p2y*sin(theta);
  float p3y = p2y*cos(theta)-p2x*sin(theta);
  p3x += qx;
  p3y += qy;
  float[] result = {p3x,p3y};
  return result;
}

void koch(float ax,float ay,float bx,float by,float n){
  if(n==maxIntKoch){
    line(ax,ay,bx,by);
  }
  else{
   float cx = 2*ax/3 + bx/3;
   float cy = 2*ay/3 + by/3;
   
   float dx = ax/3 + 2* bx/3;
   float dy = ay/3 + 2* by/3;
   
   //problem
   float e[] = roda(cx,cy,dx,dy,PI/3);
   
   float ex = e[0];
   float ey = e[1];
   
   koch(ax,ay,cx,cy,n+1);
   koch(cx,cy,ex,ey,n+1);
   koch(ex,ey,dx,dy,n+1);
   koch(dx,dy,bx,by,n+1);
   
  } 
}

void setup(){
 size(640,400); 
 frameRate(1);
}

void draw(){
  
 background(255);
  
 float ax = 160;
 float ay = 350;
 float bx = width-160;
 float by = 350;
  
  //problem
 float[] e = roda(ax,ay,bx,by,-PI/3);
 float ex = e[0];
 float ey = e[1];
 
 //line(ax,ay,bx,by);
 //line(bx,by,ex,ey);
 //line(ax,ay,ex,ey);
 
 koch(ax,ay,bx,by,0);
 koch(bx,by,ex,ey,0);
 koch(ex,ey,bx,by,0);
}