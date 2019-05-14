
float x=0;
float xpos, ypos; 
PVector previous;

float ratio=1; // Frequence ratio / Frequenzverhältnis   
float delta=0;  // Phasenverschiebung 

void setup() {
  size (900, 900);
  background(111); 
  previous=new PVector(-1, -1);
  stroke(0);
  noSmooth();
}

void draw () {

  if (x <= 360) {
    //  
    xpos= height/3 * calculateSin(x, 0) + width / 2;
    ypos= height/2 - height/3 * calculateSin(x * abs(ratio), delta) ;

    if (previous.x!=-1)
      line (xpos, ypos, 
        previous.x, previous.y);
    else point (xpos, ypos);

    previous.set(xpos, ypos);
    // point (xpos, ypos);

    x++;
  } else {
    println ("Done");
  }

  text ("use Cursor key", 23, 23);
}

float calculateSin(float x, float d) {
  return 
    sin(radians ( x+d ));
}
//
void keyPressed() {

  // Has a valid key been pressed?   
  boolean validkey = true; 

  switch(keyCode) {
  case LEFT:
    ratio-=1; 
    break;
  case RIGHT:
    ratio+=1; 
    break;

  case UP:
    delta+=45; 
    break;
  case DOWN:
    ratio-=45; 
    break;

  default:
    validkey=false; 
    break;
  }

  // Has a valid key been pressed? 
  if (validkey) {
    // Yes
    // reset 
    x=0;
    background(111); 
    previous=new PVector(-1, -1);

    println("ratio: "
      +ratio
      +"; delta "
      +delta);
  }
  //
}
//
