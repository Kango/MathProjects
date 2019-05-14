

float factor = 5.0; 

void setup() {
  size(700, 700); 

  float max = 100.0;// initial range max 
  float result; 

  for (float n = 0; n <= max; n++) {
    println(n);

    // normal map()
    result = map(n, 0, max, 0, 100) ; 
    output(n, result, color(2, 2, 255)); // BLUE 

    // map Squared
    result = mapSquared(n, 0, max, 0, 100);
    output(n, result, color(255, 2, 2)); // RED 

    // map Cubed
    result = mapCubed(n, 0, max, 0, 100);
    output(n, result, color(2, 255, 2));//GREEN 

    // map New I (an U-like parabole)
    result = mapNew(n, 0, max, 0, 100);
    output(n, result, color(2, 255, 255));//

    // map New II (an inverse U-like parabole)
    result = mapNew2(n, 0, max, 0, 100);
    output(n, result, color(255, 2, 255));// 
    println("");
  } // for 

  // Coord --- 
  coordSystem();
}

void draw() {
  //
}

void output(float n, float resultLocal, color colLocal) {
  fill(colLocal); //COLOR 
  ellipse(n*factor+10, height-20-factor*resultLocal, 5, 5); 
  print("\t " +  resultLocal);
}

void coordSystem() {
  // Coord --- 
  float n=0; 
  stroke(255); 

  line (n*factor+10, height-20-0, 
    width-66, height-20-0 );
  fill(255); 
  text("x", width-66+6, height-20-0+4);

  line (n*factor+10, height-20-0, 
    n*factor+10, 66);
  fill(255); 
  text("y", n*factor+10-2, 66-6);

  // vertical center line |
  stroke(155); 
  n=100.0;
  float xValue=n*factor+10;
  xValue=xValue/2; 
  line (xValue, height-12, 
    xValue, 155);
}

float mapSquared(float value, float start1, float stop1, float start2, float stop2) {
  float inT = map(value, start1, stop1, 0, 1);
  float outT = inT * inT;
  return map(outT, 0, 1, start2, stop2);
}

float mapCubed(float value, float start1, float stop1, float start2, float stop2) {
  float inT = map(value, start1, stop1, 0, 1);
  float outT = inT * inT * inT;
  return map(outT, 0, 1, start2, stop2);
}

float mapNew(float value, float start1, float stop1, float start2, float stop2) {
  float inT = map(value, start1, stop1, -1, 1);
  float outT = inT * inT;
  return map(outT, 0, 1, start2, stop2);
}

float mapNew2(float value, float start1, float stop1, float start2, float stop2) {
  float inT = map(value, start1, stop1, -1, 1);
  float outT = inT * inT;
  return stop2- map(outT, 0, 1, start2, stop2);
}
// 