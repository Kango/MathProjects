


void setup() {
  size(800, 800);
} // func

void draw() {
  background(0);

  noStroke(); 
  spiral();
} // func


void spiral() {
  float x, y;          // pos

  for (int i=0; i<860; i++) {
    fill(i, 2, 2);
    float r = i / 6; 
    x=width/2  + r * cos(radians(i));
    y=height/2 + r * sin(radians(i));
    ellipse(x, y, 2, 2);
  } // for
}
//
