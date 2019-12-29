float x;
float y;

float newx;
float newy;

int apf = 250;


void setup() {
  size(800, 800);
  background(0);

}


void draw() {
  
  for (int i=0; i<apf; i++) {
    stroke(0,255,0);
    strokeWeight(2);
    

    float px = map(x, -2.1820, 2.6558, 0, width);
    float py = map(y, 0, 9.9983, height, 0);
    point(px, py);     

    float r = random(1);
    
    if (r<0.01) {
      // 1%
      newx = 0;
      newy = 0.16*y;
    } else if (r<0.86) {
      // 85%
      newx = 0.85 * x + 0.04 * y;
      newy = -0.04 * x + 0.85 * y + 1.6;
    } else if (r<0.93) {
      // 7%
      newx = 0.2 * x - 0.26 * y;
      newy = 0.23 * x + 0.22 * y + 1.6;
    } else {
      // 7%
      newx = -0.15 * x + 0.28 * y;
      newy = 0.26 * x + 0.24 * y + 0.44;
    }

    x = newx;
    y = newy;
  }
}
