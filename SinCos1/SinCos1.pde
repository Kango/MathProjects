

int angle=0;

int radius = 100;

void setup() {
  size (770, 770);
}

void draw() {
  background (0);

  // get x and y 
  float x = cos(radians(angle)) * radius;
  float y = sin(radians(angle)) * radius;

  // headline
  fill(234, 2, 2);
  stroke(234, 2, 2);    
  text("Demonstration of sin and cos", 
    width/2 - textWidth("Demonstration of sin and cos")/2, 
    height / 2 -radius - 30);
  strokeWeight(1);
  line (width/2 - textWidth("Demonstration of sin and cos")/2, 
    height / 2 -radius - 27, 
    width/2 + textWidth("Demonstration of sin and cos")/2-8, 
    height / 2 -radius - 27);

  // line from center to current angle
  strokeWeight(1);
  line (width/2, height / 2, 
    width/2 + x, height/2 + y);

  // show middle point / center 
  stroke(255, 2, 2);
  strokeWeight(5);
  point (width/2, height / 2);

  // show current angle by adding x and y to center 
  stroke(2, 244, 222);
  point (width/2 + x, height/2 + y);

  // show x part 
  stroke(2, 244, 2);
  fill(2, 244, 2);
  line (
    width/2, height / 2+ radius + 10, 
    width/2 + x, height / 2 + radius + 10);
  text("x = "+x, width/2, height / 2 + radius + 30);

  // show y part 
  stroke(30, 120, 222);
  fill(30, 120, 222);
  line (
    width/2 + radius + 10, height / 2, 
    width/2 + radius + 10, height / 2 + y );
  text("y = "+y, width/2 + radius + 30, height / 2 + 0);

  // show angle part 
  fill(234);
  println(angle);
  text ("angle = "+ angle, width/2-27, height / 2 - 10 ); 

  // show formula 
  fill(234);
  text(  "float x = cos(radians(angle)) * radius;", width/2-227, height - 140 ); 
  text(  "float y = sin(radians(angle)) * radius;", width/2-227, height  - 120 ); 

  // ----------------
  // manage the angle 
  angle++;
  if (angle>360)
  { 
    angle=0;
  }
}