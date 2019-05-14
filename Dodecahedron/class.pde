


// ==============================================

class ThreeD {

  // This class shows different solids to draw in 3D.

  // This class is not about one item (Car) but more a 
  // collection of different commands for the realm of 3D. 

  // consts

  final color RED     = color (255, 0, 0);
  final color GREEN   = color (0, 255, 0);
  final color BLUE    = color (0, 0, 255);

  final color WHITE   = color (255);
  final color BLACK   = color (0);
  final color GRAY    = color (111);

  final color YELLOW  = color (255, 255, 0);
  final color YELLOWWARM  = color (255, 245, 49); 
  final color VIOLET  = color (143, 0, 255);
  final color INDIGO  = color (111, 0, 255);
  final color MAGENTA = color (255, 0, 255);
  final color PINK    = color (255, 192, 203); 

  final color ORANGE    = color (255, 165, 0);

  // vars 

  boolean crosshair; 

  int iPentagonCounter=1; 

  // funcs 

  // step 1: 
  // reference section "2D Primitives" now in 3D ----------------------
  // read the ref there, they are just changed a bit to be 3D

  void pointPV(PVector pos) {
    // version with PVector parameter. 
    // calls another method in the same class. 
    // See there for description. 
    point(pos.x, pos.y, pos.z);
  }

  void pointPvStr(PVector pos, String str) {
    // version with PVector parameter. 
    // calls another method in the same class. 
    // See there for description. 
    point(pos.x, pos.y, pos.z);
    //  pointSphere(pos.x, pos.y, pos.z);
    text(str, pos.x+6, pos.y+6, pos.z);
  }

  void pointSpherePV(PVector pv) {
    // PVector
    pointSphere(pv.x, pv.y, pv.z);
  }

  void pointSphere(float x, float y, float z) {
    // point as a sphere, fixed size 5, 
    // fixed noStroke, no fill color, you 
    // must set the fill color before using 
    // this method. 
    noStroke();
    pushMatrix();
    translate(x, y, z);
    sphere(3);
    popMatrix();
  }

  void line3D(float x1, float y1, float z1, 
    float x2, float y2, float z2, 
    float weight, color colorLine)
    // drawLine was programmed by James Carruthers
    // see <a href="http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/0#9" 
    // target="_blank" rel="nofollow">http://processing.org/discourse/yabb2/YaBB.pl?num=1262458611/0#9</a>
  {
    PVector p1 = new PVector(x1, y1, z1);
    PVector p2 = new PVector(x2, y2, z2);
    PVector v1 = new PVector(x2-x1, y2-y1, z2-z1);
    float rho = sqrt(pow(v1.x, 2)+pow(v1.y, 2)+pow(v1.z, 2));
    float phi = acos(v1.z/rho);
    float the = atan2(v1.y, v1.x);
    v1.mult(0.5);
    pushMatrix();
    translate(x1, y1, z1);
    translate(v1.x, v1.y, v1.z);
    rotateZ(the);
    rotateY(phi);
    noStroke();
    fill(colorLine);
    box(weight, weight, p1.dist(p2));
    popMatrix();
  } // method

  void triangle(float x1, float y1, float z1, 
    float x2, float y2, float z2, 
    float x3, float y3, float z3) {
    beginShape();
    vertex(x1, y1, z1);
    vertex(x2, y2, z2);
    vertex(x3, y3, z3);
    endShape(CLOSE);
  }

  void quad(
    float x1, float y1, float z1, 
    float x2, float y2, float z2, 
    float x3, float y3, float z3, 
    float x4, float y4, float z4) {
    beginShape();
    vertex(x1, y1, z1);
    vertex(x2, y2, z2);
    vertex(x3, y3, z3);
    vertex(x4, y4, z4);
    endShape(CLOSE);
  }

  void quadArray(PVector[] a1) {
    if (a1==null) 
      return;
    if (a1.length==0) 
      return;
    beginShape();
    for (PVector pv : a1) 
      vertex(pv.x, pv.y, pv.z);      
    // vertex(a1[0].x, a1[0].y, a1[0].z);
    endShape(CLOSE);
  }

  void rect(
    float x1, float y1, float z1, 
    float w, float h) {
    beginShape();
    vertex(x1, y1, z1);
    vertex(x1+w, y1, z1);
    vertex(x1+w, y1+h, z1);
    vertex(x1, y1+h, z1);
    endShape(CLOSE);
  }

  // step 2: 
  // reference section "3D Primitives" now in enhanced version ----------------------

  void box3D (float x, float y, float z, 
    float sizeBox, 
    color col ) {
    // noStroke();
    fill(col);
    pushMatrix();
    translate(x, y, z);
    box(sizeBox);
    popMatrix();
  }

  void box3DWithSize (float x, float y, float z, 
    float sizex, float sizey, float sizez, 
    color col ) {
    // noStroke();
    fill(col);
    pushMatrix();
    translate(x, y-sizey/2, z);
    box(sizex, sizey, sizez);
    popMatrix();
  }

  void sphere3D (float x, float y, float z, 
    float sizeBox, 
    color col ) {
    // noStroke();
    fill(col);
    pushMatrix();
    translate(x, y, z);
    sphere(sizeBox);
    popMatrix();
  }

  // step 3: 
  // Platonic solids ----------------------
  // http://en.wikipedia.org/wiki/Platonic_solid 

  // also cube / box is a Platonic solid - see above

  void tetrahedron(float x1, float y1, float z1, 
    float size1 ) {

    // see http://en.wikipedia.org/wiki/Tetrahedron#Formulas_for_a_regular_tetrahedron
    // see http://de.wikipedia.org/wiki/Datei:Tetraeder_animation_with_cube.gif 

    // Tetrahedron: (1,1,1), (1,−1,−1), (−1,1,−1), (−1,−1,1)

    PVector v1 = new PVector(1, 1, 1); 
    PVector v2 =  new PVector(1, -1, -1);
    PVector v3 =  new PVector (-1, 1, -1);
    PVector v4 =  new PVector  (-1, -1, 1);

    float f=27; 
    v1.mult(f);
    v2.mult(f);
    v3.mult(f);
    v4.mult(f);

    //   pushMatrix(); 
    //scale (3);

    stroke(255, 2, 2); 
    noFill(); 

    fill(YELLOW);
    makeShape(v1, v2, v3);
    fill(RED);
    makeShape(v1, v2, v4);
    fill(GREEN);
    makeShape(v3, v2, v4);
    fill(GRAY);
    makeShape(v1, v3, v4);

    boolean showHelp = false; 
    if (showHelp) {
      pointPvStr(v1, "1");
      pointPvStr(v2, "2");
      pointPvStr(v3, "3");
      pointPvStr(v4, "4");
    }

    //popMatrix();
  }

  void tetrahedronOLD21(float x1, float y1, float z1, 
    float size1 ) {

    // see http://en.wikipedia.org/wiki/Tetrahedron#Formulas_for_a_regular_tetrahedron
    // see http://de.wikipedia.org/wiki/Datei:Tetraeder_animation_with_cube.gif 

    PVector v1 = new PVector ( sqrt(8/9), 0, -1/3 ); 
    PVector v2 =  new PVector( -sqrt(2/9), sqrt(2/3), -1/3 );
    PVector v3 =  new PVector ( -sqrt(2/9), -sqrt(2/3), -1/3 );
    PVector v4 =  new PVector ( 0, 0, 1 );

    float f=17; 
    v1.mult(f);
    v2.mult(f);
    v3.mult(f);
    v4.mult(f);

    pushMatrix(); 

    scale (3);

    stroke(255, 2, 2); 
    noFill(); 

    // makeShape(v1, v2, v3); 
    //makeShape(v1, v2, v4);
    //makeShape(v3, v2, v4);
    makeShape(v1, v4, v2);

    popMatrix();
  }

  void tetrahedron22(float x1, float y1, float z1, 
    float size1 ) {

    // tetrahedron
    //    A(1,1,–1), C(–1,–1,–1), F(–1,1,1) und H(1,–1,1).
    // see http://en.wikipedia.org/wiki/Tetrahedron#Formulas_for_a_regular_tetrahedron
    // see http://de.wikipedia.org/wiki/Datei:Tetraeder_animation_with_cube.gif 

    pushMatrix(); 
    scale (size1);

    stroke(255, 2, 2); 
    noFill(); 

    // fill(GREEN);
    beginShape();
    vertex(1, 1, -1);
    vertex(-1, -1, -1);
    vertex(-1, 1, 1) ;
    endShape();

    // fill(BLUE);
    beginShape();
    vertex(1, -1, 1);
    vertex(-1, -1, -1);
    vertex(-1, 1, 1) ;
    endShape();

    // fill(PINK);
    beginShape();
    vertex(1, -1, 1);
    vertex(-1, -1, -1);
    vertex(1, 1, -1);
    endShape();

    // fill(YELLOW);
    beginShape();
    vertex(1, 1, -1);
    vertex(1, -1, 1);
    vertex(-1, 1, 1) ;
    endShape();
    // 
    popMatrix();
  }

  void tetrahedronOLD(float x1, float y1, float z1, float size1 ) {

    //    A(1,1,–1), C(–1,–1,–1), F(–1,1,1) und H(1,–1,1).

    // fill(BLUE);

    beginShape();
    // the given corner
    vertex(x1, y1, z1);
    // derive 3 other corners 
    PVector helpLeft = new PVector (x1-size1/2, y1, z1+size1/2);
    PVector helpRight = new PVector (x1+size1/2, y1, z1+size1/2); 
    vertex(helpLeft.x, helpLeft.y, helpLeft.z);

    vertex(helpRight.x, helpRight.y, helpRight.z);

    //    vertexPVector(helpRight);
    // vertex(x1+size1/2, y1, z1+size1/2); 
    vertex(x1, y1-size1, z1);
    endShape(CLOSE);
  }

  void octahedron() {
    // (eight faces)
    // see http://en.wikipedia.org/wiki/Octahedron

    /*
     ( ±1, 0, 0 );
     ( 0, ±1, 0 );
     ( 0, 0, ±1 ). 
     */

    //Cartesian coordinates

    //An octahedron with edge length √2 can be placed with its center at the origin and its vertices on the coordinate axes; the Cartesian coordinates of the vertices are then

    //    ( ±1, 0, 0 );
    //    ( 0, ±1, 0 );
    //    ( 0, 0, ±1 ).

    PVector [] listsA = new PVector[6];

    listsA [0] = new PVector  (1, 0, 0);
    listsA [1] = new PVector  (0, 1, 0);
    listsA [2] = new PVector  (0, 0, 1);

    listsA [3] = new PVector  (-1, 0, 0);
    listsA [4] = new PVector  (0, -1, 0);
    listsA [5] = new PVector  (0, 0, -1);

    for (int i = 0; i < listsA.length; i++) {
      listsA [i] .mult( 27 );
    }

    stroke(WHITE); 

    if (!keyPressed) {
      fill(RED);
    }
    makeShape( listsA [0], listsA [1], listsA [2] );   
    makeShape( listsA [1], listsA [2], listsA [3] );
    makeShape( listsA [1], listsA [0], listsA [5] );
    makeShape( listsA [1], listsA [3], listsA [5] );


    // top half (replacing 1 with 4)
    if (!keyPressed) {
      fill(YELLOW);
    }
    makeShape( listsA [0], listsA [4], listsA [2] );   
    makeShape( listsA [4], listsA [2], listsA [3] );
    makeShape( listsA [4], listsA [0], listsA [5] );
    makeShape( listsA [4], listsA [3], listsA [5] );


    //  scale(15);

    for (int i = 0; i < listsA.length; i++) {
      // listsA[i] = 

      listsA[i].mult(5); 

      fill(WHITE);
      pointPvStr(listsA[i], str(i));
    }
  } // method 

  // -------------------------------------------------------------------------

  void dodecahedron() {
    /*
     regular dodecahedron = composed of twelve regular pentagonal faces, three meeting at each vertex.
     
     A regular dodecahedron or pentagonal dodecahedron is a dodecahedron that is regular, which is composed of twelve regular pentagonal faces, three meeting at each vertex. 
     It is one of the five Platonic solids. It has 12 faces, 20 vertices, 30 edges, and 160 diagonals (60 face diagonals, 100 space diagonals).[1] It is represented by the Schläfli symbol {5,3}. 
     
     */

    // size 
    float f1 = 19; // 19 is a good factor  

    float goldenRatio = (1 + sqrt(5)) / 2 ; // ~ 1.618;
    //print (goldenRatio);
    //println (" ~ 1.618");

    // The orange vertices lie at (±1, ±1, ±1) and form a cube (dotted lines).
    PVector [] orange = new PVector[8];
    orange [0] = new PVector  (1, 1, 1);  // 0 times - 
    orange [1] = new PVector  (-1, -1, -1); // 3 times - 

    orange [2] = new PVector  (-1, 1, 1);  // 1 time - 
    orange [3] = new PVector  (1, -1, 1);  // 1 time -
    orange [4] = new PVector  (1, 1, -1);  // 1 time -

    orange [5] = new PVector  (-1, -1, 1);// 2 time -
    orange [6] = new PVector  (1, -1, -1);// 2 time -
    orange [7] = new PVector  (-1, 1, -1);// 2 time -

    for (int i = 0; i < orange.length; i++) {
      orange[i].mult(f1); 
      if (showOrange) {
        fill(ORANGE);
        pointPvStr(orange[i], str(i));
      }
    }

    if (showOrange) {
      stroke(ORANGE);
      // //2536 
      linePV (orange [1], orange [5]);
      linePV (orange [5], orange [3]);
      linePV (orange [3], orange [6]);
      linePV (orange [6], orange [1]);

      //7204
      linePV (orange [7], orange [2]);
      linePV (orange [2], orange [0]);
      linePV (orange [0], orange [4]);
      linePV (orange [4], orange [7]);

      // 17 and 25
      linePV (orange [1], orange [7]);
      linePV (orange [2], orange [5]);

      // 30 and 64
      linePV (orange [3], orange [0]);
      linePV (orange [6], orange [4]);
    }

    // --------------------------------

    // The green vertices lie at (0, ±ϕ, ±1/ϕ) and form a rectangle on the yz-plane.
    PVector [] green = new PVector[4];
    green [0] = new PVector  (0, -goldenRatio, -1/goldenRatio); // 2 times -
    green [1] = new PVector  (0, goldenRatio, 1/goldenRatio);  // 0 tmes - 
    green [2] = new PVector  (0, -goldenRatio, 1/goldenRatio);  // 1 time - [minus and then +]
    green [3] = new PVector  (0, goldenRatio, -1/goldenRatio);  // 1 time - [+ and then minus] 
    for (int i = 0; i < green.length; i++) {
      green[i].mult(f1); 
      if (showGreen) {
        fill(GREEN);
        pointPvStr(green[i], str(i));
      }
    }
    if (showGreen) {
      PVector[] pvGreenArrayForFunctionQuadArray = 
        {  green [1], green [2], green [0], green [3] }; 
      stroke(GREEN); 
      quadArray(pvGreenArrayForFunctionQuadArray); //
    }// if

    // --------------------------------

    // The blue vertices lie at (±1/ϕ, 0, ±ϕ) and form a rectangle on the xz-plane. 
    PVector [] blue = new PVector[4];
    blue [0] = new PVector  (-1/goldenRatio, 0, -goldenRatio); // 2 times - 
    blue [1] = new PVector  ( 1/goldenRatio, 0, goldenRatio);  // 0 tmes -
    blue [2] = new PVector  ( 1/goldenRatio, 0, -goldenRatio); // 1 time -
    blue [3] = new PVector  (-1/goldenRatio, 0, goldenRatio);  // 1 time - 
    for (int i = 0; i < blue.length; i++) {
      blue[i].mult(f1); 
      if (showBlue) {
        fill(BLUE);
        pointPvStr(blue[i], str(i));
      }
    }
    if (showBlue) {
      PVector[] pvArrayBlueForFunctionQuadArray = 
        {  blue [1], blue [2], blue [0], blue [3] }; 
      stroke(BLUE); 
      quadArray(pvArrayBlueForFunctionQuadArray);
    }

    // -----------------------

    //The pink vertices lie at (±ϕ, ±1/ϕ, 0) and form a rectangle on the xy-plane.
    //The distance between adjacent vertices is 2/ϕ, and the distance from the origin to any vertex is √3.
    //ϕ = (1 + √5) / 2 is the golden ratio. 
    PVector [] pink = new PVector[4];
    pink [0] = new PVector  ( -goldenRatio, -1/ goldenRatio, 0); // 2 times -
    pink [1] = new PVector  (  goldenRatio, 1/ goldenRatio, 0);  // 0 tmes - 
    pink [2] = new PVector  (  goldenRatio, -1/ goldenRatio, 0); // 1 time - 
    pink [3] = new PVector  ( -goldenRatio, 1/ goldenRatio, 0);  // 1 time - 
    for (int i = 0; i < pink.length; i++) {
      pink[i].mult(f1);
      if (showPink) {
        fill(PINK);
        pointPvStr(pink[i], str(i));
      }
    }
    if (showPink) {
      PVector[] pvArrayPinkForFunctionQuadArray = 
        {  pink [1], pink [2], pink [0], pink [3] }; 
      stroke(PINK); 
      quadArray(pvArrayPinkForFunctionQuadArray);
    }

    // ----------------------------------------

    // fill(RED, 110);
    fill(RED);
    stroke(WHITE);
    makeShape5 ( blue[3], blue[1], 
      orange[0], 
      green [1], 
      orange[2]);

    makeShape5 (  blue[1], 
      orange[0], 
      pink[1], pink[2], 
      orange[3]);

    makeShape5 ( orange[0], 
      green [1], green [3], 
      orange[4], 
      pink[1] );

    makeShape5( orange[2], 
      pink[3], 
      orange[7], 
      green[3], green[1]);

    makeShape5( green[3], 
      orange[7], 
      blue[0], blue[2], 
      orange[4]);

    makeShape5( pink[1], 
      orange[4], 
      blue[2], 
      orange[6], 
      pink[2]);

    makeShape5( pink[0], //penta6.png 
      pink[3], 
      orange[7], 
      blue[0], 
      orange[1]);

    makeShape5( blue[3], //penta7.png
      orange[2], 
      pink[3], pink[0], 
      orange[5]);

    makeShape5( orange[1], // penta8
      blue[0], blue[2], 
      orange[6], 
      green[0] ); 

    fill(GREEN); 
    makeShape5( orange[5], // penta9
      pink[0], 
      orange[1], 
      green[0], green[2] );    

    // noFill(); 
    strokeWeight(4); 
    makeShape5( orange[3], // penta 10
      green[2], green[0], 
      orange[6], 
      pink[2]);
    strokeWeight(1); // back to default  

    fill(YELLOW); 
    makeShape5( blue[1], blue[3], // penta 11
      orange[5], 
      green[2], 
      orange[3] ); 

    // to test a new pentagon 
    //fill(YELLOW);
    //PVector [] c1 = {
    //  // vertices here 
    //};
    //quadArray(c1);

    // noLoop();
  }//method 

  // ------------------------------

  void linePV ( PVector pv1, PVector pv2) {
    line (pv1.x, pv1.y, pv1.z, 
      pv2.x, pv2.y, pv2.z);
  } 

  void makeShape( PVector p1, PVector p2, PVector p3) {

    beginShape();    
    vertexPVector(p1);
    vertexPVector(p2);
    vertexPVector(p3);
    endShape( CLOSE );
  }

  void makeShape5( PVector p1, PVector p2, PVector p3, PVector p4, PVector p5) {

    /*
    // too compensate optically for the different length of iPentagonCounter (it's either 0..9 or 10/11) we use either "  : " (one space more) or " : " (one space sign less)
     // to get all : underneath each other
     if (iPentagonCounter<=9) 
     print("Pentagon #"+iPentagonCounter+"  : ");
     else
     print("Pentagon #"+iPentagonCounter+" : ");
     
     print(p1);
     print(p2);
     print(p3);
     print(p4);
     print(p5);
     println(""); 
     iPentagonCounter++;
     */


    if (showAsStandard) { 
      beginShape();    
      vertexPVector(p1);
      vertexPVector(p2);
      vertexPVector(p3);
      vertexPVector(p4);
      vertexPVector(p5);
      endShape( CLOSE );
    } else {
      noFill(); 
      stroke(GRAY); 
      strokeWeight(4);
      // show shape 
      beginShape();    
      vertexPVector(p1);
      vertexPVector(p2);
      vertexPVector(p3);
      vertexPVector(p4);
      vertexPVector(p5);
      endShape( CLOSE );

      // show corners 
      fill(RED); 
      pointSpherePV(p1);
      pointSpherePV(p2);
      pointSpherePV(p3);
      pointSpherePV(p4);
      pointSpherePV(p5);

      strokeWeight(1); // back to default
    }//else
  }//method 

  //void makeShapeX( PVector[] p1) {
  //  //yy
  //  beginShape();    
  //  vertexPVector(p1);
  //  vertexPVector(p2);
  //  vertexPVector(p3);
  //  vertexPVector(p4);
  //  vertexPVector(p5);
  //  endShape( CLOSE );
  //}

  // 
  // step 4: 
  // coordinate system and related ----------------------

  // by ofey 

  void coorWalls() {

    // draw 3 walls in 3D which mark a coordinate systems. 
    // coordinate system wall
    // by ofey 
    //
    fill(BLUE);//blue left side
    beginShape();
    vertex(0, 0, 0);
    vertex(0, 0, -400);
    vertex(0, 400, -400);
    vertex(0, 400, 0);
    endShape(CLOSE);

    fill(YELLOW);//yellow bottom
    beginShape();
    vertex(0, 400, 0);
    vertex(0, 400, -400);
    vertex(400, 400, -400);
    vertex(400, 400, 0);
    endShape(CLOSE);

    fill(GREEN);//green back
    beginShape();
    vertex(0, 0, -400);
    vertex(400, 0, -400);
    vertex(400, 400, -400);
    vertex(0, 400, -400);
    endShape(CLOSE);
  }

  void ShowCoordinates () {
    // Show Coordinates x, y and z as lines 
    //
    // X
    stroke (255, 0, 0);
    line (0, 0, 0, 100, 0, 0 ) ;
    sphere3D (100, 0, 0, 13, color (255, 0, 0) );
    text ("X", 120, 60, 0);

    // Y
    stroke    (0, 255, 0);
    line (0, 0, 0, 0, 100, 0 ) ;    
    // fill(0, 255, 0);
    sphere3D(0, 100, 0, 13, GREEN);    
    text ("Y", 0, 180, 0);

    // Z
    stroke (0, 0, 255);
    line (0, 0, 0, 0, 0, -300 ) ; 
    // fill(0, 0, 255);
    sphere3D (0, 0, -300, 33, BLUE);    
    text ("-Z", 30, 50, -300);
  } // function 

  void show3DCursor( float theX, float theY, float theZ) {

    // show 3D cursor
    //
    if (crosshair) {
      // 3D crosshair
      final int len = 15;

      stroke(244, 2, 2); // red  
      line (theX, theY, theZ-len, theX, theY, theZ+len);
      stroke(0, 0, 255);
      line (theX, theY-len, theZ, theX, theY+len, theZ);
      stroke(2, 244, 2);
      line (theX-len, theY, theZ, theX+len, theY, theZ);

      pushMatrix();
      translate(theX, theY, theZ+len);
      fill(244, 2, 2);
      noStroke();
      sphere(1);
      popMatrix();
    } else
    {
      // sphere
      pushMatrix();
      translate(theX, theY, theZ);
      fill(WHITE);
      noStroke();
      sphere(10);
      popMatrix();
    } // else
  } // func


  // step 5: 
  // HUD funcs  ----------------------
  // Head-up-Display 
  // see http://de.wikipedia.org/wiki/Head-up-Display

  void showTextInHUD(String str1) {
    // A small 2D HUD for text in the
    // upper left corner. 
    // This func may only be called a the very end of draw() afaik.
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    textMode(MODEL);
    if (str1!=null)
      text(str1, 20, 20);
    hint(ENABLE_DEPTH_TEST);
  } // func 

  void showTextInHUD(String str1, float x, float y) {
    // A small 2D HUD for text at
    // free pos.
    // This func may only be called a the very end of draw() afaik.
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    textMode(MODEL);
    if (str1!=null)
      text(str1, x, y);
    hint(ENABLE_DEPTH_TEST);
  } // func 

  // step 6 :
  // floor (later walls (but see coordinate system wall above), sky sphere...) --------------------------------

  void CheckeredFloor() {

    noStroke();

    for (int i = 0; i < 40; i = i+1) {
      for (int j = 0; j < 40; j = j+1) {

        // % is modulo, meaning rest of division
        if (i%2 == 0) {
          if (j%2 == 0) {
            fill (255, 0, 0);
          } else
          {
            fill ( 103 );
          }
        } else {
          if (j%2 == 0) {
            fill ( 103 );
          } else
          {
            fill (255, 0, 0);
          }
        } // if

        pushMatrix();

        translate ( 40*i-500, 360, 40*j-640 );
        box (40, 7, 40);

        popMatrix();
      } // for
    } // for
  } // function


  // step 7: 
  // minor help functions ----------------------
  //
  // vertex ---
  //
  void vertexPVector ( PVector pos ) {
    vertex(pos.x, pos.y, pos.z);
  }

  // colors ---
  // 
  void fillAndStroke( color f, color s ) {
    // set both colors at once (but different) 
    fill(f);
    stroke(s);
  }

  void fillAndStroke( color c ) {
    // set both at once (same color) 
    fill(c);
    stroke(c);
  }

  void fillAndNoStroke(color f) {
    // set fill color and switch stroke off
    fill(f);
    noStroke();
  }

  void strokeAndNoFill(color s) {
    // set stroke color and switch fill off
    noFill();
    stroke(s);
  }

  // crosshair ---
  void toogleCrosshair() {
    crosshair = !crosshair;
  }

  void crosshairOn() {
    crosshair=true;
  }

  void crosshairOff() {
    crosshair=false;
  }

  boolean crosshairState() {
    return crosshair;
  }

  //
} // class 
//
