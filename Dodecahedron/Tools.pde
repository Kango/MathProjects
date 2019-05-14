
void avoidClipping() {
  // avoid clipping : 
  // https : //
  // forum.processing.org/two/discussion/4128/quick-q-how-close-is-too-close-why-when-do-3d-objects-disappear
  perspective(PI/3.0, (float) width/height, 1, 1000000);
}//func
