
// much better: shapes 3D library by quarks.


// Platonic solids
// Regular dodecahedron

import peasy.*;
PeasyCam camera;

ThreeD threeD = new ThreeD(); 

PFont fontSmall;
PFont fontBig;

int tetrahedronY    = 0;
int tetrahedronAddY = 1;

// float a; 

boolean showPink = false; // 0
boolean showOrange = false; // 1
boolean showBlue = false; // 2
boolean showGreen = false; // 3

boolean showAsStandard=true; // space bar toggles 

// ----------------------------------------------

void setup() {
  size(900, 800, P3D);
  fontSmall=createFont("ARIAL", 12);
  fontBig=createFont("ARIAL", 32);

  textFont(fontSmall);
  textMode(SHAPE);  

  // cam
  //  camera = new PeasyCam(this, 25, 25, -25, 100);
  camera = new PeasyCam(this, 100);
}

void draw() {
  background(0);
  lights();
  avoidClipping() ;

  threeD.dodecahedron();

  camera.beginHUD();
  fill(threeD.WHITE); 
  text("0..3 show/hide help points (a cube and three planes) \nspace bar to change layout", 
    22, height-33);
  camera.endHUD();
  //
} // func 
//
