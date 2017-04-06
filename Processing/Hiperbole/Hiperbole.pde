//desenhar hiperbole
//ax²+bx+c=0;
//f' = 2ax -b =0
// x = -b/2a -> magic
// y = - delta/4a

//needs to draw
//x, y axes
//hyperbole
//roots and max/min point

//tem que "transformar" os pontos matemagicos para a telinha
//width/2 e height/2 = (0,0)

float a = -1;
float b = 1;
float c = 4;

//steps for curve cration
float dx = 0.1;

//números para representar na tela
float minX = -6;
float maxX = 6;
float minY = -6;
float maxY = 6;

float delta = pow(b,2) - 4*a*c;

float tempMinX = minX;

void setup(){
 size(600,600);
}

void draw(){
 axes();
 parabola();
 roots();
 minMaxPoint();
}

void axes(){
  line(0,width/2,height,width/2);
  line(height/2,0,height/2,width);
}

void parabola(){
  beginShape();
  while(tempMinX<maxX){
    float y=a*pow(tempMinX,2)+ (b*tempMinX) + c;
    float[] xy= matemagicaToPixel(tempMinX,y);
    float newx = xy[0];
    float newy = xy[1];
    print("before: "+tempMinX+" " +y + "\n");
    print("after: "+ xy[0]+" " +xy[1] + "\n");
    vertex(newx,newy);
    tempMinX+=dx;
  }
  endShape();
}

//calculates Min or Max Point
void minMaxPoint(){
  float xMinMax = -b/(2*a);
  float yMinMax = - delta/(4*a);
  ellipseMode(CENTER);
  fill(22);
  float[] xy= matemagicaToPixel(xMinMax,yMinMax);
  float newx = xy[0];
  float newy = xy[1];
  ellipse(newx, newy, 5, 5); 
}

//Calculate roots
void roots(){
  float x1 = (-b + sqrt(delta))/(2*a);
  float x2 = (-b - sqrt(delta))/(2*a);
  float newX1 = matemagicaToPixelX(x1);
  float newX2 = matemagicaToPixelX(x2);
  ellipseMode(CENTER);
  fill(22);
  ellipse(newX1, height/2, 5, 5); 
  ellipse(newX2, height/2, 5, 5); 
}

//transform math representation to screen representation
float[] matemagicaToPixel(float numX, float numY){
  float newX,newY;
  newX = width/2 + width*numX/(maxX-minX);
  newY = height/2 - height*numY/(maxY-minY);
  float[] result = {newX,newY};
  return result;
}

//transform math representation to screen representation
float matemagicaToPixelX(float numX){
  float newX;
  newX = width/2 + width*numX/(maxX-minX);
  return newX;
}