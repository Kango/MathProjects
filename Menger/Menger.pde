

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/8326*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// Menger's Sponge
// http://www.angelfire.com/art2/stw/

// imports ================================================

/** PeasyCam **/
import peasy.*;

// VARS  ==================================================
PVector P1; 
PeasyCam cam; 
float angle=0.3; 
boolean bPaint=false; 
boolean bFill=true; 
int depthMAX=3; 

// ====================================================================================

void setup() {  
  size( 1800, 900, P3D );

  cam = new PeasyCam(this, 900);
  cam.setMinimumDistance(40);
  cam.setMaximumDistance(6550);

  P1 = new PVector(-110, -110, -50);
} // func 

void draw () { 
  background (22);
  lights();

  noStroke();
  // print("Working...");
  DrawMyBox ( P1, 400, 0 ); 
  //println("...done.");
} // func 

void keyPressed () {
  switch(key) {
  case ' ':
    bFill=!bFill;
    break;
  case '+':
    depthMAX++;
    println(depthMAX);    
    break; 
  case '-':
    depthMAX--;
    if (depthMAX<=1) {
      depthMAX=1;
    }
    println(depthMAX);
    break; 
  default:
    //
    break;
  }
}

void DrawMyBox (PVector P1, float size1, int depth1) {

  float size13=size1/3;

  for (int x = 0; x < 3; x = x+1) {
    for (int y = 0; y < 3; y = y+1) {
      for (int z = 0; z < 3; z = z+1) {

        if (depth1==depthMAX) {
          if (bFill) { 
            //fill(2,2,230);
            //fill ((y+2)*50,(z+2)*50,(x+2)*50);
            fill (Z*3, (y+2)*50, (x+1)*8);
          } else {
            stroke(200, 200, 200);
            noFill();
          }
          pushMatrix();
          translate(P1.x+x*size13, P1.y+y*size13, P1.z+z*size13); 
          if ((x==1)&&(y==1)) {
            noFill();
          } else if ((z==1)&&(x==1)) {
            noFill();
          } else if ((z==1)&&(y==1)) {
            noFill();
          }               
          box(size13);
          popMatrix();
        } else {

          bPaint=true;   
          if ((x==1)&&(y==1)) {
            bPaint=false;
          } else if ((z==1)&&(x==1)) {
            bPaint=false;
          } else if ((z==1)&&(y==1)) {
            bPaint=false;
          }               
          if (bPaint) {
            PVector P_New1 = new PVector(P1.x+x*size13, P1.y+y*size13, P1.z+z*size13);
            DrawMyBox ( P_New1, size13, depth1+1 );
          }
        }
      }
    }
  }
} // 
