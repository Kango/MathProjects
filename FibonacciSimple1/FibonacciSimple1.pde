


// test for Fibonacci
// this version: with keyPressed to move on 
// http : // forum.processing.org/two/discussion/13282/qscript-fibonacci#latest
// http : // www.openprocessing.org/sketch/135053
// ---------------------------------------------

int fib;
int fibprev; 

float x, y;

int n1  = 1;

int[] quadrantOrder = new int [] {
  1, 4, 3, 2
};

final float quarterCircle = 0; // 1.0 * TWO_PI/4.0; 

int next, count, n2=1; 

/// -------------------------------------------

public void setup() {
  size(1200, 750);

  x = width  * 0.5;
  y = height * 0.6;

  background(0);

  fib = fibonacci(n1);
  fibprev = fib;
}

void draw() {

  // text box: 
  fill(0);
  rect(0, 0, 299, 24);
  fill(255); 
  text("Press any key often. Iteration is " 
    + n1
    + " ("
    + fib
    + ").", 14, 14);
  // end of text box
} // func 

// ----------------------------------------

void keyPressed() {
  n1++;
  if (n1<22) {

    fibprev = fib;
    fib = fibonacci(n1);

    drawArc(quadrantOrder[(n1)%4]);
    println("Iteration is " 
      + n1
      + " (with Fibonacci value "
      + fib
      + ").");
  }
}

int fibonacci(int nbrTerms) {
  next=0; 
  int n1 = 1; 
  n2 = 1 ; 
  count = 2;

  while (nbrTerms > 2) { 
    next = n1 + n2;
    count = count + 1;  
    n1 = n2; 
    n2 = next;  
    nbrTerms = nbrTerms - 1;
  }
  return next;
}

void drawArc(int quadrant) {

  //draws an arc in specific quadrant
  // with current Fibonacci value 

  final int q1 = 2; 


  fill((int)(fib%140) + 100);
  noStroke();

  int textSize = (int)(fib * 0.3);
  int textValue = (int)fib /10;

  println ("quadrant "+quadrant); 

  switch(quadrant) {
  case 1:
    fill(255, 2, 2); // upper right corner 
    y += (fib - fibprev)/q1;
    arc(x, y, fib, fib, 
      PI+HALF_PI+quarterCircle, TWO_PI+quarterCircle, 
      PIE);
    fill(255);
    // text(textValue, x+(fib*0.05), y-(fib*0.07));   
    break;
  case 2:
    fill(2, 255, 2); // upper LEFT corner 
    x += (fib - fibprev)/q1;
    arc(x, y, fib, fib, 
      PI+quarterCircle, PI+HALF_PI+quarterCircle, 
      PIE);
    fill(255);
    // text(textValue, x-((textSize*0.7)*(digits(textValue))), y-(fib*0.05));
    break;
  case 3:
    fill(2, 0, 255); // LOWER LEFT corner
    y -= (fib - fibprev)/q1;
    arc(x, y, fib, fib, 
      PI-HALF_PI+quarterCircle, PI+quarterCircle, PIE); 
    fill(255);
    // text(textValue, x-((textSize*0.7)*(digits(textValue))), y+((textSize*0.9)));
    break;
  case 4:
    fill(255, 0, 255); // LOWER right corner
    x -= (fib - fibprev)/q1;
    arc(x, y, fib, fib, 
      0+quarterCircle, PI-HALF_PI+quarterCircle, PIE);
    fill(255);
    // text(textValue, x+(fib*0.05), y+((textSize)));
    break;
  } // switch 
  //
} // func 
// end of sketch
