int flag = 0;
int mousex1,mousey1,mousex2,mousey2;

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
  size(600,600);
  background(0);
}

void draw(){
  if(flag==2){
    float[] e = roda(mousex1,mousey1,mousex2,mousey2,-PI/3);
    float ex = e[0];
    float ey = e[1];
    stroke(255);
    line(mousex1,mousey1,mousex2,mousey2);
    line(mousex2,mousey2,ex,ey);
    line(ex,ey,mousex1,mousey1);
    flag=3;
  }
  //not working idk why
  //if(flag==3){
  // flag=0;
  // background(0);
  //}
  
}

void mouseClicked(){
  if (flag==0){
    mousex1 = mouseX;
    mousey1 = mouseY;
    flag = 1;
    print(mousex1);
  }
  else if(flag==1){
    mousex2 = mouseX;
    mousey2 = mouseY;
    flag = 2;
    print(mousex2);
  }
}