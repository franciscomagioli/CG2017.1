color black = color(0,0,0);
float angulo_12 = TWO_PI/12;
float angulo_60 = TWO_PI/60;

void setup(){
  size(400,400);
  frameRate(1);
}


void draw(){
  background(0);
  clock();
}

void clock(){
 //base clock
 ellipseMode(CENTER);
 fill(black);
 stroke(80);
 strokeWeight(5);
 ellipse(width/2,height/2,300,300);
 
 //time markers
 strokeWeight(4);
 //pontos medios
 float cx = width/2;
 float cy = height/2;
 for( int i = 0; i<12; i++){
   float r = width/3.5;
   float angMarkers = angulo_12*i;
   float posX = r* cos(angMarkers)+cx;
   float posY = r* sin(angMarkers)+cy;
   float r2 = 0;
   if(i%3==0) r2 = width/4.2;
   if(i%3!=0) r2 = width/3.8;
   float posX2 = r2* cos(angMarkers)+cx;
   float posY2 = r2* sin(angMarkers)+cy;
   line(posX,posY,posX2,posY2);
 }
 
 //pointers
 //second
 strokeWeight(1);
 float rSec = width/3.5;
 float aSeg = (angulo_60*second())+(3*PI/2.0);
 float pxSecond = rSec *cos(aSeg);
 float pySecond = rSec * sin(aSeg);
 line(cx,cy,cx+pxSecond,cy+pySecond);
 
 //Minutes
 strokeWeight(2);
 float rMin = width/5;
 float aMin = (angulo_60*minute())+(3*PI/2.0);
 float pxMin = rMin *cos(aMin);
 float pyMin = rMin * sin(aMin);
 line(cx,cy,cx+pxMin,cy+pyMin);
 
 //Hour
 strokeWeight(3);
 float rHour = width/6.5;
 float aHour = (angulo_12*hour()%12)+(3*PI/2.0);
 //angulo andado a cada minuto pelo ponteiro de hora
 float aMinForHour = TWO_PI/720*minute();
 float aHourWMinutes = aHour+aMinForHour;
 float pxHour = rHour * cos(aHourWMinutes);
 float pyHour = rHour * sin(aHourWMinutes);
 line(cx,cy,cx+pxHour,cy+pyHour);
  
}