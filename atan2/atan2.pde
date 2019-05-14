
// https : // forum.processing.org/two/discussion/10474/find-angle-between-2-points

PVector centerPoint; // the fixed red point 

void setup() {
  size(1200, 600);
  centerPoint = new PVector(width/2, height/2);
}

void draw() {  
  background(0);

  // draw a simple cross at centerPoint 
  crossAtPV(centerPoint); 

  // show centerPoint in red 
  ellipsePV(centerPoint); 

  // get angle 
  PVector mousePV = new PVector(mouseX, mouseY); 
  float angle = angleBetweenPV_PV(centerPoint, mousePV);

  // show the found angle
  fill(255, 0, 0); // red
  triangleMy(angle);
  fill(255); // white  
  text("Angle in radians: "+angle
    +"\nAngle in degrees: "
    +degrees(angle), 23, 23);
}

// --------------------------------------------------------------------

float angleBetweenPV_PV(PVector centerPV, PVector movingPV) {

  // calc angle : the core of the sketch 

  PVector d = new PVector();

  // calc angle

  // delta 
  d.x = movingPV.x - centerPV.x;
  d.y = movingPV.y - centerPV.y;
  // angle 
  float angle1 = atan2(d.y, d.x);

  if (angle1 < 0) {
    angle1 = map(angle1, -PI, 0, PI, TWO_PI);
  }

  return angle1;
} 

void triangleMy(float ang) {

  pushMatrix();

  translate(centerPoint.x, centerPoint.y);

  rotate(ang);

  // fill(255); // white shield 
  triangle(60, 0, 
    80, -30, 
    80, 30);

  popMatrix();
}

void ellipsePV(PVector pv) {
  fill(255, 0, 0); // red
  ellipse(pv.x, pv.y, 10, 10);
}

void crossAtPV(PVector pv) {
  stroke(255);
  line(pv.x, 0, pv.x, height);
  line(0, pv.y, width, pv.y);
}
// 
