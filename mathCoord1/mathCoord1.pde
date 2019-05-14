


//consts
color RED  = color(255, 0, 0); 
color BLUE = color(0, 0, 255); 

// grid of rectangles
int x = 0, y = 0, 
  w = 25, h = w, 
  offset = 0;

int grid = 20, 
  many = grid*grid;

float f_start_x = -10, 
  f_stop_x = 10;
int steps = 100;
float dx = (f_stop_x - f_start_x )/float(steps);

boolean diagPrintlnFlag = true;

// -----------------------------------------------------------------------

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  draw_grid();
  draw_f1(RED);
  draw_f2(BLUE);
}

// -----------------------------------------------------------------------
// TWO FUNCTIONS

void draw_f1(color col1) {
  // function 
  pushMatrix();
  translate(width/2, height/2);

  float X, Y, 
    f_start_x = -10, 
    f_stop_x = 10;
  float dx = (f_stop_x - f_start_x )/float(steps);

  float xToDraw, yToDraw;
  float xToDrawPrevious=0, yToDrawPrevious=0; 

  for ( int i = 0; i < steps; i++) {
    X = f_start_x + dx * i;


    // ***********************************************************************
    // The function to plot
    Y = 2*X + 1;  // change this line
    //Y = 2.0 * X*X -8;   // 2.0*X +1.0
    // ***********************************************************************

    xToDraw = getXtoDraw(X); 
    yToDraw = getYtoDraw(Y); 

    if ( i == 0 ) {                         // need a dummy init for first line
      xToDrawPrevious=xToDraw; 
      yToDrawPrevious=yToDraw;
    }
    if ( diagPrintlnFlag ) {
      println("i "+i+" X "+nf(X, 1, 1)+" Y "+nf(Y, 1, 1));
    }
    stroke(col1);
    fill(col1);
    line(xToDrawPrevious, yToDrawPrevious, xToDraw, yToDraw) ;    
    //ellipse(X*w, -Y*w, 2, 2);

    // remember for next line
    xToDrawPrevious=xToDraw; 
    yToDrawPrevious=yToDraw;
  }//for 

  // print list only one time
  diagPrintlnFlag= false;                            
  popMatrix();
}

void draw_f2(color col1) {
  // function 
  pushMatrix();
  translate(width/2, height/2);

  int steps = 100;
  float X, Y;  


  float xToDraw, yToDraw;
  float xToDrawPrevious=0, yToDrawPrevious=0; 

  for ( int i = 0; i < steps; i++) {
    X = f_start_x + dx * i;

    // ***********************************************************************
    // The function to plot
    Y =  - X + 4;    // change this line
    //Y = 2.0 * X*X -8;   // 2.0*X +1.0  
    // ***********************************************************************

    xToDraw = getXtoDraw(X); 
    yToDraw = getYtoDraw(Y); 

    if ( i == 0 ) {                         // need a dummy init for first line
      xToDrawPrevious=xToDraw; 
      yToDrawPrevious=yToDraw;
    }
    if ( diagPrintlnFlag ) {
      println("i "+i+" X "+nf(X, 1, 1)+" Y "+nf(Y, 1, 1));
    }
    stroke(col1);
    fill(col1);
    line(xToDrawPrevious, yToDrawPrevious, xToDraw, yToDraw) ;    
    //ellipse(X*w, -Y*w, 2, 2);

    // remember for next line
    xToDrawPrevious=xToDraw; 
    yToDrawPrevious=yToDraw;
  }//for 

  // print list only one time
  diagPrintlnFlag= false;                            
  popMatrix();
}

// ------------------------------------------------------------
// coordinate function

void draw_grid() {

  stroke(0);
  for (int i = 0; i < many; i++) {
    noFill();
    rect(x+(i%grid)*(w+offset), y+(floor(i/grid))*(h+offset), 
      w, h);   // or any other shape/text on that position
  }

  // small lines with numbers ||||||||||| : for x axis 
  pushMatrix();
  translate(width/2, height/2);
  strokeWeight(3);
  textSize(15); 
  textAlign(CENTER);
  fill(0); // BLACK 
  stroke(0); // BLACK
  for (int i = -grid/2; i < grid/2; i++) {
    float dx = 1;
    float X =  dx * i;
    if (X==0 || X==-10) 
      continue;  // skip those numbers 
    float xToDraw = getXtoDraw(X); 
    float yToDraw = getYtoDraw(0); 
    line(xToDraw, yToDraw, xToDraw, yToDraw+11);
    text(i, 
      xToDraw-1, yToDraw+29-1);
  }//for 
  textAlign(LEFT);
  strokeWeight(1);
  popMatrix(); 

  // small lines with numbers : for y axis 
  pushMatrix();
  translate(width/2, height/2);
  stroke(0); // BLACK
  fill(0);  // BLACK
  textSize(15); 
  textAlign(CENTER);
  strokeWeight(3);
  for (int i = -grid/2; i < grid/2; i++) {
    float dx = 1;
    float Y =  dx * i;
    if (Y==0 || Y==9 || Y==-1) 
      continue;  // skip these numbers 
    float xToDraw = getXtoDraw(0); 
    float yToDraw = getYtoDraw(Y); 
    line(xToDraw, yToDraw, xToDraw+11, yToDraw);
    text(i, 
      xToDraw+24, yToDraw);
  }//for 
  textAlign(LEFT);
  strokeWeight(1);
  popMatrix(); 

  // show arrows and texts X and Y 
  decoration(); 

  // show center point
  pushMatrix();
  translate(width/2, height/2);
  // fill(200, 200, 0);
  fill(255, 0, 0);
  ellipse(0, 0, 5, 5);       // show center point
  popMatrix();
}

void decoration () {
  stroke(0); 
  strokeWeight(3); 
  // line |
  line ( width/2, 0, width/2, height); 

  // line -
  line ( 0, height/2, width, height/2);


  // texts X and its arrow ---
  fill(0); 
  textSize(24);
  text ( "X", 
    width-17, height/2+31); 

  pushMatrix();
  noFill();
  strokeWeight(3.0);
  strokeJoin(MITER);
  beginShape();

  float f = 3.0; 
  translate(width-f*7, height/2);  

  vertex(3.5*f, -3.0*f);
  vertex(6.5*f, 0.0*f);
  vertex(3.5*f, 3.0*f);
  endShape();
  strokeWeight(1); 
  popMatrix();

  // texts Y and its arrow --- 
  fill(0); 
  textSize(24);
  text ( "Y", 
    width/2+10, 22); 

  pushMatrix();
  noFill();
  strokeWeight(3.0);
  strokeJoin(MITER);
  beginShape();
  translate(width/2, 22);  
  f = 3.0; 
  vertex( -3.0*f, -3.5*f);
  vertex( 0.0*f, - 6.5 * f);
  vertex( 3.0*f, - 3.5 * f);
  endShape();
  strokeWeight(1); 
  popMatrix();

  strokeWeight(1);
}

// ------------------------------------------------------------
// HELPER FUNCTIONS 

float getXtoDraw(float xin_) {
  return xin_*w;
} 

float getYtoDraw(float yin_) {
  // in processing draw y negativ!
  return -yin_*w;
}
// 
