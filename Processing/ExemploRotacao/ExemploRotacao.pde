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

void setup(){
 size(640,400); 
 frameRate(1);
}

void draw(){
  
 background(255);
  
 float ax = 20;
 float ay = 200;
 float bx = 620;
 float by = 200;
  
 //por que cxOld = (1-1/3)*ax + (1/3)*bx;
 //é diferente de cx?
 float cx = 2*ax/3 + bx/3;
 float cy = 2*ay/3 + by/3;
 
 float dx = ax/3 + 2* bx/3;
 float dy = ay/3 + 2* by/3;
 
 float e[] = roda(cx,cy,dx,dy,-PI/3);
 
 float ex = e[0];
 float ey = e[1];
 
 line(ax,ay,cx,cy);
 line(cx,cy,ex,ey);
 line(ex,ey,dx,dy);
 line(dx,dy,bx,by);
 
 
}