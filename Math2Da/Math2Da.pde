


float result = 0;
float resultScreen = 0; 

void setup() {
  size(420, 340);
  background(153);
  PFont myFont = createFont("FFScala", 12);
  textFont(myFont);
} // function 

void draw() {
  background(153);
  
  ShowCoor(); 
  function1(); 
  function2();
} // function 

void ShowCoor() {
  stroke (0, 254, 254);
  fill (0, 254, 254);  
  strokeWeight(4);   // Thicker
  line(0, height, 0, 0);
  text ("x", width-10, height-10);
  line(0, height, width, height);
  text ("y", 10, 10);
  strokeWeight(1);   // thin
} // function 

void function1() {
  boolean firstTime=true; 
  float oldResultX =0;
  float oldResultY =0;
  stroke (222, 0, 0);
  for (int i = 0; i < 340; i = i+1) {
    // line(30, i, 80, i);
    result = 3*i*i + 5 ; 
    resultScreen = height - result * 0.001;
    point ( i, resultScreen ) ; 
    if (firstTime) {
      oldResultX=i; 
      oldResultY=resultScreen;
      firstTime=false;
    } // if 
    line (oldResultX, oldResultY, i, resultScreen);
    oldResultX=i; 
    oldResultY=resultScreen;
  } // for
  fill (222, 0, 0);
  text ("y=3*x*x+5", 220, 115);
  // println ("done 1.");
} // function 

void function2() {
  boolean firstTime=true; 
  float oldResultX =0;
  float oldResultY =0;
  stroke (0, 254, 0);
  for (int i = 0; i < 340; i = i+1) {
    // line(30, i, 80, i);
    result = 3*i*i*i + 5 ; 
    resultScreen = height -  result * 0.001;
    point ( i, resultScreen ) ; 
    if (firstTime) {
      oldResultX=i; 
      oldResultY=resultScreen;
      firstTime=false;
    }
    line (oldResultX, oldResultY, i, resultScreen);
    oldResultX=i; 
    oldResultY=resultScreen;
  } // for 
  fill (0, 254, 0);
  text ("y=3*x*x*x+5", 50, 15);    
  // println ("done 2.");
} // function 
