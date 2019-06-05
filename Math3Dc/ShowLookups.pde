

// ----------------------------------------------------------
// Show LookUps - different ways

void ShowLookupAsBoxes() {
  // not so nice
  colorMode(RGB, 400);
  noStroke();

  if ((MaxindexI <= 0) && (MaxindexJ <= 0)) { 
    ShowSpecialMessage("LookUp-Table not defined.");
  } else {
    for (int i = 0; i < MaxindexI; i = i+3) {
      for (int j = 0; j < MaxindexJ; j = j+3) {

        BoxParameters (MyResults[i][j].x, MyResults[i][j].y, MyResults[i][j].z, 
          3, 3, 3, 
          0, 0, 0, 
          color(2+abs(MyResults[i][j].x), 2+abs(MyResults[i][j].y), 2+abs(MyResults[i][j].z)) );
      } // j
    } //i
  } // else
} // ShowGraph1

void ShowLookupAsGrid() {
  // nice
  colorMode(RGB, 400);
  noStroke();
  if ((MaxindexI <= 0) && (MaxindexJ <= 0)) { 
    ShowSpecialMessage("LookUp-Table not defined.");
  } else {
    for (int i = 0; i < MaxindexI; i = i+1) {
      for (int j = 0; j < MaxindexJ; j = j+1) {
        fill (2+abs(MyResults[i][j].x), 2+abs(MyResults[i][j].y), 2+abs(MyResults[i][j].z));
        beginShape(QUAD); 
        vertex(MyResults[i][j].x, MyResults[i][j].y, MyResults[i][j].z);      
        vertex(MyResults[i+1][j].x, MyResults[i+1][j].y, MyResults[i+1][j].z);      
        vertex(MyResults[i+1][j+1].x, MyResults[i+1][j+1].y, MyResults[i+1][j+1].z);  
        vertex(MyResults[i][j+1].x, MyResults[i][j+1].y, MyResults[i][j+1].z);      
        endShape(CLOSE);
      } // j
    } //i
  } // else
} // ShowGraph2

void ShowLookupWithPovRaySpheres() {
  // With spheres in POV-Ray
  //colorMode(RGB,400);
  //noStroke();
  if (DoesPOVRayExist()) {
    if ((MaxindexI <= 0) && (MaxindexJ <= 0)) { 
      ShowSpecialMessage("LookUp-Table not defined.");
    } else {    
      ShowSpecialMessage("Can take a while..."); 
      String Buffer = ""; 
      String MyText = ""; 
      println ("Start preparing Povray Spheres");
      for (int i = 0; i < MaxindexI; i = i+3) {
        for (int j = 0; j < MaxindexJ; j = j+3) {
          // fill (2+abs(MyResults[i][j].x),2+abs(MyResults[i][j].y),2+abs(MyResults[i][j].z));

          Buffer = Buffer + 
            "MySphere (" + 
            ((MyResults[i][j].x) * .1 ) + ", " + 
            ((8 - MyResults[i][j].z) * .1 ) + ", " + 
            ( (8 - MyResults[i][j].y) * .1 + 1.2) +  
            ")" + "\n";
        } // j
      } //i

      println ("Now the files...");

      MyText = GetText("", "") + "\n // Commands here " + Buffer; 
      WriteToFile ( MyText ); 

      println ("Finished preparing Povray");
    } // else
  } // if DoesPOVRayExist
} // function 

void ShowLookupWithPovRayPoly() {
  // with polygons in PovRay
  // colorMode(RGB,400);
  // noStroke();

  if (DoesPOVRayExist()) {
    if ((MaxindexI <= 0) && (MaxindexJ <= 0)) { 
      ShowSpecialMessage("LookUp-Table not defined.");
    } else {
      ShowSpecialMessage("Can take a while (5 minutes or more)..."); 
      String Buffer = ""; 
      String MyText = ""; 
      println ("Start preparing Povray Polygons");
      for (int i = 0; i < MaxindexI; i = i+1) {
        for (int j = 0; j < MaxindexJ; j = j+1) {
          // fill (2+abs(MyResults[i][j].x),2+abs(MyResults[i][j].y),2+abs(MyResults[i][j].z));

          Buffer = Buffer + 
            "MyPoly (" + 
            MyResults[i][j].x*.1 + ", " + MyResults[i][j].y *.1+ ", " + MyResults[i][j].z*.1  + ", " + 
            MyResults[i+1][j].x*.1 + ", " + MyResults[i+1][j].y *.1+ ", " + MyResults[i+1][j].z*.1 + ", " + 
            MyResults[i+1][j+1].x*.1 + ", " + MyResults[i+1][j+1].y*.1 + ", " + MyResults[i+1][j+1].z*.1 + ", " + 
            MyResults[i][j+1].x *.1+ ", " + MyResults[i][j+1].y*.1 + ", " + MyResults[i][j+1].z *.1 + 
            ")" + "\n";
        } // j
      } //i

      println ("Now the files...");

      MyText = GetText("", "") + "\n // Commands here \n " + Buffer; 
      WriteToFile ( MyText ); 

      println ("Finished preparing Povray");
    } // else
  } //   if DoesPOVRayExist
} // function
//
