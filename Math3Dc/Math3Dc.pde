



// function-Plotter 3D: 
//-------------------------------- 
// use n,p and F1
// use o, i for export to POV-Ray
// h,r camera 
// s - save as image
// 
//// use strg-e

final String PathToPOVRayExe = "C:\\Programme\\POV-Ray for Windows v3.62\\bin\\pvengine-sse2.exe"; 

// imports ---------------------------

// use camera : peasyCam 
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

// use opengl
// import processing.opengl.*;

import java.awt.*; 

// consts --------------------------

final int MaxFunctions = 13;

// vars -----------------------------

// cam
PeasyCam cam;

// Vectors: 
// Lookup
PVector[][] MyResults = new PVector [500][500]; 

// Max value for MyResults
int MaxindexI=0;
int MaxindexJ=0;

// number of Formula
int GraphNumber = 0; 

// z = result
float result = 1.0;

// Text for left corner
String DefineShowText=""; 

// when has special text been shown
int ShowSpecialMessageStartTime = 0; 
String SpecialText = ""; 

// some boolean Flags
boolean boolShowCoor = true;   // -x,-y,-z, x,y,z
boolean boolShowMovie = true;  // Rotation 
boolean boolHelpModus = false; 
boolean boolShowSpecialMessage = false; 
boolean wait1 = false; 
// Main functions ---------------------------- 


void setup() {

  // Init

  // size ( 900, 650, P3D ); 
  size ( 850, 650, P3D ); 
  cam = new PeasyCam(this, 100);
  background(117);

  // move
  cam.pan(100, 50);
  cam.setDistance(830);
  cam.setResetOnDoubleClick (true);   

  noStroke();
  fill(color(254, 0, 0));
  fill (254, 0, 0);

  PFont font;
  font = createFont("FFScala-32.vlw", 12); 
  textFont(font); 

  // FluidForms.setup(this);
} // setup 

void draw() {
  if (wait1) { 
    delay (2211); 
    wait1=false;
  }
  background(117);
  if (boolShowCoor) {
    ShowCoor();
  }
  if (boolShowMovie) {
    cam.rotateY(radians(-1));
  }
  if (boolShowSpecialMessage) {
    float mNow = millis();
    if  (ShowSpecialMessageStartTime + 5000 <= mNow) { 
      boolShowSpecialMessage=false;
    }
  }  

  if (wait1) { 
    delay (2211); 
    wait1=false;
  } else { 
    CallUpMathFunction () ;
  }
} // function 

void keyPressed() {

  if (boolHelpModus) {
    loop();
    boolHelpModus=false;
  } else 
  {

    if (key == CODED) {
      println (keyCode); 
      switch (keyCode) { 
      case 111: 
        // F1 
        background(117); 
        ShowText(HelpText() +  "\nPress any key...");
        boolHelpModus=true ; 
        noLoop(); 
        break; 
      case UP:
        cam.rotateX(radians(-1));
        break; 
      case DOWN:
        cam.rotateX(radians(1));
        break;       
      case LEFT:
        cam.rotateY(radians(1));
        break; 
      case RIGHT:
        cam.rotateY(radians(-1));
        break;       
      default: 
        // 
        break;
      } // switch
    } // if 

    else {

      // not key == CODED   
      switch(key) {
      case 'r':
        cam.reset(); 
        break;
      case 'h':
        // horizontal
        setCamHorizontal();
        break;       
      case 'q':
        boolShowCoor = ! boolShowCoor; 
        break; 
      case 'c':
        background (117);
        break;
      case 'm':
        boolShowMovie = ! boolShowMovie; 
        break; 
      case 'p':
        // cam.reset(444);
        GraphNumber = GraphNumber - 1;    
        if (GraphNumber<0) { 
          GraphNumber = 0;
        }
        break; 
      case 'n':
        // cam.reset(444);
        GraphNumber = GraphNumber + 1;
        if (GraphNumber>MaxFunctions) { 
          GraphNumber = MaxFunctions;
        }    
        break; 
      case 's':        
        // Opens file chooser	
        String savePath = "test22.png"; //  selectOutput( "Save as picture...");  
        if (savePath != null) 
        {	
          delay(10);
          saveFrame(savePath);
        } 
        break; 
      case 'i':
        ShowLookupWithPovRaySpheres(); 
        break;   
      case 'o':
        ShowLookupWithPovRayPoly(); 
        break;           
      default:
        break;
      } // switch
    } // if
  } // if 

  // for functions that rely on Lookup: init Lookup
  switch (GraphNumber) {
    // only when number is odd (and >=5)
  case 5:
    DefineShowText="Formula " + GraphNumber + ": \nz=x*x*y \nuse Previous and Next, F1 Help\ncan export to POV-Ray";
    InitGraph_ItimesItimesJ();
    break; 
  case 7:
    DefineShowText="Formula " + GraphNumber + ": \nSphere (distorted, looks good in OPENGL) \nuse Previous and Next, F1 Help\ncan export to POV-Ray";  
    InitGraph_Sphere(); 
    break; 
  case 9:
    DefineShowText="Formula " + GraphNumber + ": \nCrescent \nuse Previous and Next, F1 Help\ncan export to POV-Ray";
    InitGraph_Cresent(); 
    break; 
  case 6:
  case 8:
  case 10:
  case 12:
    break; 
  case 11:
    DefineShowText="Formula " + GraphNumber + ": \nSphere II t \nuse Previous and Next, F1 Help\ncan export to POV-Ray";  
    InitGraph_Sphere2();
    break ;  
  default: 
    MaxindexI=0;
    MaxindexJ=0;        
    break;
  }  // switch
} // keyPressed 

// functions related to draw etc. -------------------------------------------

void CallUpMathFunction () {

  switch(GraphNumber) {
  case 0:
    ShowText("Formula " + GraphNumber + ": \nz=1 \nuse Previous and Next, F1 Help");
    ShowGraph0();
    break; 
  case 1:
    ShowText("Formula " + GraphNumber + ": \nz=sin(x) \nuse Previous and Next, F1 Help");
    ShowGraph1();
    break;     
  case 2:
    ShowText("Formula " + GraphNumber + ": \ny=cos(x); z=sin(x) \nuse Previous and Next, F1 Help");    
    ShowGraph2();
    break;         
  case 3:
    ShowText("Formula " + GraphNumber + ": \nx=r*cos(i)*cos(j); y=r*sin(i)*sin(j); z=r*sin(i) \nuse Previous and Next, F1 Help");        
    ShowGraph3();
    break;  
  case 4:
    ShowText("Formula " + GraphNumber + ": \nz=sin(x) \nuse Previous and Next, F1 Help");
    ShowGraph4();
    break;      
  case 5:  // odd numbers 
  case 7:   
  case 9:
  case 11:  
    ShowText(DefineShowText);
    ShowLookupAsBoxes();  
    break; 
  case 6:    // even numbers & 11 
  case 8: 
  case 10: 
  case 12: 
    ShowText(DefineShowText);
    ShowLookupAsGrid();
    break; 
  default:
    // ShowGraph1();
    break;
  } // switch
}

// --------------------------------------------------------------------------
// direct functions without lookUp - evil...

void ShowGraph0() {

  for (int i = -80; i < 80; i = i+5) {
    int posX = i*4; 
    for (int j = -80; j < 80; j = j+5) {
      int posY = j*4; 
      result = 1.0; 
      BoxParameters ( posX, (100-result)-100, -posY-20, 
        3, 3, 3, 
        0, 0, 0, color(200, result, 0) );
    }
  }
}

void ShowGraph1() {

  for (int i = 0; i < 360; i = i+5) {
    int posX = i; 
    for (int j = -80; j < 80; j = j+5) {
      int posY = j*4; 
      result = 100* sin(radians(posX)); 
      BoxParameters ( posX, (100-result)-100, -posY-20, 
        3, 3, 3, 
        0, 0, 0, color(200, result, 0) );
    }
  }
}

void ShowGraph2() {

  for (int i = 0; i < 360; i = i+5) {
    int posX = i; 
    for (int j = -80; j < 80; j = j+5) {
      float posY = 100* cos(radians(posX));
      result = 100* sin(radians(posX)); 
      BoxParameters ( posX, (100-result)-100, -posY-20, 
        3, 3, 3, 
        0, 0, 0, color(200, result, 0) );
    }
  }
}

void ShowGraph3() {

  // see http://local.wasp.uwa.edu.au/~pbourke/geometry/sphere/

  float r1 = 100 ; 

  for (int i = 0; i < 360; i = i+10) {

    for (int j = -180; j < 180; j = j+10) {

      float x1 = 10 + r1* cos(i) *cos(j);
      float y1 = 10 + r1* sin(i) *sin(j);
      float z1 = 10 + r1* sin(i) ;
      BoxParameters ( x1, z1, y1, 
        3, 3, 3, 
        0, 0, 0, color(200, result, 0) );
    }
  }
}

void ShowGraph4() {

  for (int i = -180; i < 180; i = i+5) {
    int posX = i*4; 
    for (int j = -80; j < 80; j = j+5) {
      int posY = j*4; 
      result =100* sin(radians(i)); 
      BoxParameters ( posX, (100-result)-100, -posY-20, 
        3, 3, 3, 
        0, 0, 0, color(200, result, 0) );
    }
  }
}

// Other functions ---------------------------- 

void ShowCoor() { 

  stroke(222, 222, 222);

  // all smaller 0 ----------------------------
  line ( -100, 0, 0, 0, 0, 0 );
  text("-x", -100, 0, 0); 

  line ( 0, 100, 0, 0, 0, 0 );
  text("-z", 0, 100, 0); 

  line ( 0, 0, 100, 0, 0, 0 );
  text("-y", 0, 0, 100); 

  // all greater 0 ------------------------------
  line ( 0, 0, 0, 100, 0, 0 );
  text("x", 100, 0, 0); 

  line ( 0, 0, 0, 0, -100, 0 );
  text("z", 0, -100, 0); 

  line ( 0, 0, 0, 0, 0, -100 );    
  text("y", 0, 0, -100);
} // function 

void ShowText (String MyText) {
  cam.beginHUD();
  fill(254, 254, 254);
  textMode(SCREEN);
  if (boolShowSpecialMessage) {   
    text(SpecialText, 40, 45);
  } else {
    text(MyText, 40, 45);
  }
  textMode(MODEL);
  cam.endHUD();
} // function 

void BoxParameters ( float x, float y, float z, 
  float w, float h, float d, 
  float RotateX, float RotateY, float RotateZ, 
  color color1) {
  // Position and size and rotation of a box 
  stroke(0); 
  fill (color1);
  pushMatrix();
  translate ( x, y, z );
  rotateX ( radians(RotateX) );
  rotateY ( radians(RotateY) );
  rotateZ ( radians(RotateZ) );  
  box ( w, h, d );
  popMatrix();
} // function 

void setCamHorizontal() {

  // Brings Gamefield/cam in horizontal position 
  // without distorting the rotation around the x-axis.
  // Connected with letter 'h'.
  // Sometimes it does distort the rotation around the x-axis.

  float[] rotations = cam.getRotations(); // x, y, and z rotations required to face camera in model space  
  // camera.setRotations(double pitch, double yaw, double roll); // rotations are applied in that order
  // println( rotations[0] + " " +  rotations[1] + " " +  rotations[2] );
  // cam.rotateX(1);
  // Wert 1 nach hinten drehend, 2 nach links (Drehachse senkrecht), 3 Drehachse in den Schirm hinein ragend
  cam.setRotations( 0, rotations[1], 0 ); // rotations are applied in that order
} // function 

// ---------------------------------------------------------------

String HelpText () {

  String Buffer = ""; 

  //   Buffer

  Buffer = "=== HELP === " +  "\n " +  "\n"; 
  Buffer = Buffer + "3D-Function plotter. " +  ""; 
  Buffer = Buffer + "You reach this help via F1. " ;  
  Buffer = Buffer + "\nSome functions are calculated directly, others via lookup-table.  " ;    
  Buffer = Buffer + "\nThe latter are shown first via small boxes, then as a grid (not working properly with \nthe sphere, but looks cool with OPENGL if you zoom in the sphere).  \n\n\n" ;   
  Buffer = Buffer + " ------ Issues: ---------\n\n";
  Buffer = Buffer + "The shown formulas are not always correct, there are some adjustments of the scales and so on.\n" ;  
  Buffer = Buffer + "Also the coordinates are not always perfect.\n" ;  
  Buffer = Buffer + "There are issues with P3D (when camera is to close to the graph) \nand OPENGL (in some browsers). " ;  
  Buffer = Buffer + "\n\n"  ; 
  Buffer = Buffer + "\n"  ;   
  Buffer = Buffer + " ------ Navigating the functions: ---------";
  Buffer = Buffer + "\n\nUse P for Previous function and N for next function. " ;  
  // Buffer = Buffer + "\nCamera resets with p and n. " ;  
  Buffer = Buffer + "\nIf first or last function is reached, nothing happens. " ;        
  Buffer = Buffer + "\n " ;  
  Buffer = Buffer + "\n " ;  
  Buffer = Buffer + "\n " ;    
  Buffer = Buffer + " ------ Moving the view of the Graph: ---------";
  Buffer = Buffer + "\n " ;
  Buffer = Buffer + "\n" ;
  Buffer = Buffer + "Left-drag to rotate; \nmouse wheel, or right-drag up and down to zoom; \nmiddle-drag (cmd-left-drag on mac) to pan.  \n " ;  
  Buffer = Buffer + "Use Mouse-Double-Click or 'r' to reset view. " ;  
  Buffer = Buffer + "\n " ;
  Buffer = Buffer + "\n "  ; 
  Buffer = Buffer + "\n "  ; 
  Buffer = Buffer + " ------ Keys to use (not mentioned above): --------"  ; 
  Buffer = Buffer + "\n\n"  ; 
  Buffer = Buffer + "m - toggle camera animation (slow rotation)\n"  ; 
  Buffer = Buffer + "q - toggle coordinates \n"  ;   
  Buffer = Buffer + "Up and Down Cursor-Key - rotate\n"  ; 
  Buffer = Buffer + "Left and Right Cursor-Key - rotate \n"  ; 
  Buffer = Buffer + "h - turns the Graph horizontal; sometimes also rotating around the x-axis\n"; 
  Buffer = Buffer + "s - save as simple tiff-image-file\n"; 
  Buffer = Buffer + "i - save as POV-Ray with spheres\n";   
  Buffer = Buffer + "o - save as POV-Ray with surface\n";     
  Buffer = Buffer + "ESC - quit .\n"  ;   
  Buffer = Buffer + "\n "  ;
  Buffer = Buffer + ""  ; 
  Buffer = Buffer + "Thanks goes to Paul Bourke for his page: http://local.wasp.uwa.edu.au/~pbourke/geometry. \nUsed sphere and crescent from there. "  ;
  Buffer = Buffer + "Thanks goes to PeasyCam. "  ;

  return (Buffer);
} // function help 

// Misc ----------------------------------------------------------------------------------------------------------------------

void ShowSpecialMessage (String strText1) {
  boolShowSpecialMessage = true; 
  SpecialText = strText1; 
  ShowText(strText1);
  ShowSpecialMessageStartTime = millis();
}

//String AtTheEnd( String Word1, int LengthSubstring ) {
//
//  String Buffer = "";
//  Buffer = Word1.substring ( Word1.length() - LengthSubstring, Word1.length() ); 
//  return (Buffer);
//}

//void BoxParametersKoor ( float x,float y,float z, 
//float w, float h, float d,  
//float RotateX, float RotateY, float RotateZ ) {
//  // Position and size and rotation of a box 
//  stroke(222); 
//  noFill(); //  (0,254,1);
//  pushMatrix();
//  translate ( x,y,z );
//  rotateX ( radians(RotateX) );
//  rotateY ( radians(RotateY) );
//  rotateZ ( radians(RotateZ) );  
//  box ( w,h,d );
//  popMatrix();
//
//} // function 

//void printVector (PVector p1) {
//
//  println (p1.x + ", " + p1.y + ", " + p1.z ); 
//
//}
