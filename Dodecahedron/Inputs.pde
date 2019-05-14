
//

void keyPressed() {
  //
  switch(key) {
  case '0':
    showPink=
      !showPink;
    break; 

  case '1':
    showOrange=
      !showOrange;
    break; 

  case '2':
    showBlue=
      !showBlue;
    break; 

  case '3':
    showGreen=
      !showGreen;
    break; 

  case ' ':
    // space bar toggles showAsStandard
    showAsStandard=
      !showAsStandard;
    break;
  }//switch
}//func 
