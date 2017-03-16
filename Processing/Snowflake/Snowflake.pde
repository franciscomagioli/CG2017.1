//Define maxIntKoch for the max number of interations in the fractal
int maxIntKoch = 3;

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

//positive parameter to "fix" which side the koch fractal will occur
void koch(float ax,float ay,float bx,float by,float n,boolean positive){
  if(n==maxIntKoch){
    line(ax,ay,bx,by);
  }
  else{
   float cx = 2*ax/3 + bx/3;
   float cy = 2*ay/3 + by/3;
   
   float dx = ax/3 + 2* bx/3;
   float dy = ay/3 + 2* by/3;
   
   float[] e;
   if(positive==true){
     e = roda(cx,cy,dx,dy,PI/3);
   }
   else{
     e = roda(cx,cy,dx,dy,-PI/3);
   }
   
   float ex = e[0];
   float ey = e[1];
   
   koch(ax,ay,cx,cy,n+1,positive);
   koch(cx,cy,ex,ey,n+1,positive);
   koch(ex,ey,dx,dy,n+1,positive);
   koch(dx,dy,bx,by,n+1,positive);
   
  } 
}

void setup(){
 size(600,600); 
 frameRate(1);
}

void draw(){
  
 background(255);
  
 float ax = 160;
 float ay = 300;
 float bx = width-160;
 float by = 300;
  
 float[] e = roda(ax,ay,bx,by,-PI/3);
 float ex = e[0];
 float ey = e[1];
  
 koch(ax,ay,bx,by,0,true);
 koch(bx,by,ex,ey,0,true);
 koch(ex,ey,ax,ay,0,true);
}