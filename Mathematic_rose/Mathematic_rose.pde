
//Mathematical rose
//Idea source: https://en.wikipedia.org/wiki/Rose_(mathematics)
// Toni Polanec


float d, n;
boolean decimal = false;

void setup() {
  size(800, 1000, P2D);
  background(51);
}


void draw() {
  background(51);

  textSize(18);


  if (!decimal) {
    n = floor(map(mouseX, 0, width, 1, 8));
    d = floor(map(mouseY, 0, height, 1, 10));
  } else {
    n = map(mouseX, 0, width, 1, 8);
    d = map(mouseY, 0, height, 1, 10);

    n *= 10;
    d *= 10;
    n = floor(n);
    d = floor(d);
    n /= 10;
    d /= 10;
  }


  text("d = " + d, 10, 20);
  text("n = " + n, 10, 40);

  float k = n / d;
  text("k = " + k, 10, 60);
  
  
  text("Press d for decimal numbers", 100, 20);

  float minN = width/7;
  float minD = height/9;

  stroke(20, 100);
  strokeWeight(1);
  for (float i=0; i<width; i+=minN) {
    line(i, 0, i, height);
  }
  for (float i=0; i<height; i+=minD) {
    line(0, i, width, i);
  }

  translate(width/2, height/2);

  stroke(255);
  strokeWeight(2);
  beginShape(LINES);
  for (float i = 0; i < TWO_PI*20; i+= 0.001) {
    float x = 320*cos(k*i)*cos(i);
    float y = 320*cos(k*i)*sin(i);
    vertex(x, y);
  }
  endShape(CLOSE);
}


void keyPressed() {

  if (key == 'd') {
    decimal = !decimal;
  }
}
