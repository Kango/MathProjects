
// -----------------------------------------------------------------
// Inits of LookUps (MyResults) - that's the way to do it

void InitGraph_Sphere() { 

  // see http://local.wasp.uwa.edu.au/~pbourke/geometry/sphere/

  int indexI=0;
  int indexJ=0;
  float r1 = 100 ; 

  for (int i = 0; i < 360; i = i+10) {
    indexJ=0;
    for (int j = -180; j < 180; j = j+10) {

      float x1 = 10 + r1* cos(i) *cos(j);
      float y1 = 10 + r1* cos(i) *sin(j);
      float z1 = 10 + r1* sin(i) ;
      MyResults[indexI][indexJ] = new PVector(x1, y1, z1);
      indexJ = indexJ + 1;
    }
    indexI=indexI+1;
  }
  MaxindexJ = indexJ-1; 
  MaxindexI = indexI-1;
} // function

void InitGraph_ItimesItimesJ() {

  int indexI=0;
  int indexJ=0;

  for (int i = -80; i < 80; i = i+1) {
    float posX = i*4.0; 
    indexJ=0; 
    for (int j = -80; j < 80; j = j+1) {
      float posY = j*4.0; 
      result = .001*i*i*j;            
      MyResults[indexI][indexJ] = new PVector(posX, (100-result)-100, -posY-20);
      indexJ = indexJ + 1;
    } // j 
    indexI=indexI+1;
  } //i
  MaxindexJ = indexJ-1; 
  MaxindexI = indexI-1;
} // function

void InitGraph_Cresent() {

  // see http://local.wasp.uwa.edu.au/~pbourke/geometry/cresent/

  //x = (2 + sin(2 pi u) sin(2 pi v)) sin(3 pi v) 
  //y = (2 + sin(2 pi u) sin(2 pi v)) cos(3 pi v) 
  //
  //z = cos(2 pi u) sin(2 pi v) + 4 v - 2 
  //
  //with 0 <= u <= 1, 0 <= v <= 1 

  float r1 = 100 ; 
  float u= 0;
  float x1, y1, z1;
  int indexI=0; 
  int indexJ = 0;

  for (int i = 0; i < 101; i = i+1) {
    float v=0;
    indexJ = 0; 
    for (int j = 0; j < 101; j = j+1) {

      x1 = (2 + sin(2 *PI *u) * sin(2 *PI *v)) *sin(3 *PI *v) ;
      y1 = (2 + sin(2 *PI *u) * sin(2 *PI *v)) *cos(3 *PI *v); 
      z1 = cos(2 *PI *u) *sin(2 *PI *v) + 4 *v - 2 ;

      MyResults[indexI][indexJ] = new PVector(100*x1, 100*y1, 100*z1);

      v = v + 0.03; // .01
      indexJ=indexJ+1;
    }
    u = u + 0.03; // .01 
    indexI=indexI+1;
  }
  MaxindexJ = indexJ - 1; 
  MaxindexI = indexI - 1;
}


void InitGraph_Sphere2() {


  // see http://local.wasp.uwa.edu.au/~pbourke/geometry/cresent/

  // float r1 = 100 ; 
  // float u= 0;
  float x1=-1.0;
  float x=-1.0;
  float y=0.0;  
  float z=0.0;

  int indexI = 0; 
  int indexJ = 0;
  float result =0.0;

  background(0);
  float r  = 2 ; 
  for (float x2 = -100; x2 < 300; x2=x2+1 ) {
    //x1=x1+0.001; 
    x=x2/100; 
    println(x1);
    y=-1.0;
    for (float y2 = -100; y2 < 300; y2=y2+1 ) {
      //indexJ = 0; 
      //y=y+0.001; 
      y=y2/100;
      z=-1.0;
      for (float z2 = -100; z2 < 300; z2=z2+1 ) {
        //z=z+0.001; 
        z=z2/100;
        // x1*x1 + y1*y1 + z1*z1 - r*r; 
        result = 25*(x*x*x*(y+z)+y*y*y*(x+z)+z*z*z*(x+y)) + 50 *(x*x*y*y + x*x*z*z + y*y*z*z) ;
        result =      result -   125 * (x*x*y*z + y*y*x*z + z*z*x*y);
        result =      result        + 60 *x*y*z ;
        result=result-4*x*y+4*x*z+4*y*z;

        if ( (result  > -0.2)  &&  (result < 0.2) ) {
          //      x1 = (2 + sin(2 *PI *u) * sin(2 *PI *v)) *sin(3 *PI *v) ;
          //      y1 = (2 + sin(2 *PI *u) * sin(2 *PI *v)) *cos(3 *PI *v); 
          //      z1 = cos(2 *PI *u) *sin(2 *PI *v) + 4 *v - 2 ;

          MyResults[indexI][indexJ] = new PVector(30*x, 30*y, 30*z); //  100*x,100*y,100*z);
          // pushMatrix();
          // translate ( 10*x1,10*y1,10*z1); 
          // rotateY(0.5);
          // box(9);
          // popMatrix();
          //indexJ=indexJ+1; 
          indexI=indexI+1; 
          if (indexI>=498) {
            indexI=0; 
            if (indexJ<498) {
              indexJ ++;
            } else {
              break;
            }
          } // if
        } // if
      }
      //indexI=indexI+1;
    }
  }
  MaxindexJ = indexJ - 1; 
  MaxindexI = indexI - 1; 
  // delay (1212); 
  // wait1 = true;
}
