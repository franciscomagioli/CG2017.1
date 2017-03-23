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

float a = 1;
float b = 1;
float c = 1;

void setup(){
 size(600,600);
 axes();
}

void draw(){
 rootsAndMinMaxPoint();
}

void axes(){
  line(0,width/2,height,width/2);
  line(height/2,0,height/2,width);
}

void parabola(){
  //x=-3
  //xf=3
  //dx=0.01
  //while(x<xf){
    //y=f(x);
    //vertex(x,y);
    //x+=dx;
//  }
//  //endShape();
}

void rootsAndMinMaxPoint(){
  float xMinMax = -b/(2*a);
  float delta = pow(b,2) - 4*a*c;
  float yMinMax = - delta/(4*a);
  ellipseMode(CENTER);
  fill(13);
  noStroke();
  ellipse(xMinMax, yMinMax, 5, 5); 
}

//
float matemagicaToPixel(float num){

}