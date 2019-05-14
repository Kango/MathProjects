


double x, y, zr, zi, zr2, zi2, cr, ci, n;
double zmx1, zmx2, zmy1, zmy2, f;
double di, dj, fn1, fn2, fn3;
double re, gr, bl;
double xt, yt, i, j;

void setup() {
  size(500, 500);
  prepare();
}

void draw() {
  if (i <= width)
  i++;
  x =  (i +  di)/ zmx1 - zmx2;
  for ( j = 0; j <= height; j++) {
    y = zmy2 - (j + dj) / zmy1;
    zr = 0;
    zi = 0;
    zr2 = 0; 
    zi2 = 0; 
    cr = x;   
    ci = y;  
    n = 1;
    while (n < 200 && (zr2 + zi2) < 4) {
      zi2 = zi * zi;
      zr2 = zr * zr;
      zi = 2 * zi * zr + ci;
      zr = zr2 - zi2 + cr;
      n++;
    }  
    re = (n * fn1) % 255;
    gr = (n * fn2) % 255;
    bl = (n * fn3) % 255;
    stroke((float)re, (float)gr, (float)bl); 
    point((float)i, (float)j);
  }
}

void prepare() {
  di = 0;
  dj = 0;
  f = 5; // was 10 
  fn1 = random(20); 
  fn2 = random(20); 
  fn3 = random(20);
  zmx1 = int(width / 4);
  zmx2 = 2;
  zmy1 = int(height / 4);
  zmy2 = 2;
} 

void mousePressed() {
  background(255);

  xt = mouseX;
  yt = mouseY;
  di = di + xt - float(width / 2); // replaced int with float here
  dj = dj + yt - float(height / 2); // replaced int with float here
  zmx1 = zmx1 * f;
  zmx2 = zmx2 * (1 / f);
  zmy1 = zmy1 * f;
  zmy2 = zmy2 * (1 / f);
  di = di * f;
  dj = dj * f;
  i = 0;
  j = 0;
}