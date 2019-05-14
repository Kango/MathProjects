
float x1 = 400;
float y1 = 400;

float fillValX = 2.9;  
float fillValY =-411;   //  height/2.0;
float CameraAngleAdd = 1; // 0.1; 

float x=1;
float y=1; 
float dx = 1;
float dy = 1;
float Old_dx=-1;
float Old_dy=-1;

void setup() { 
  size(1500, 900, P3D);
  background(100);
  smooth();
  noFill();
  stroke(256, 0, 0);
} // setup

void draw() { 
  background(0);
  lights(); 

  x=0; 
  dx = mouseX - x1;
  dy = mouseY - y1;

  translate(340, 42, 0); // translate(458, 428, 1320); 

  while (x<500) {
    y = dx * sin(x / 50); 
    line (y+x+110, y+440, x+dy, 
      530-y, x+210, 3*y-dy);      
    x += 2.9 ;
  } // while

  Old_dx=dx;
  Old_dy=dy;
} // draw
//
