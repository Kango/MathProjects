

// 
String result = "";

void setup() {
  //
  size(1300, 800);
  background(0);
}

void draw() {
  //
  background(0);
  text("hit any key from 0 to 9", 12, 17);

  text(result, 33, 33);
}

void keyReleased() {
  multiplicationTable ( int(key-48) );
}

void multiplicationTable ( int num ) {

  result = num + " **************\n";

  for (int i = 1; i <= 10; i++)
    result += i + " * " + num + " = " + i*num +"\n"; // use nf
} // function 
