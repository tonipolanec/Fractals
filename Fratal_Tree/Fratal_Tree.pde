float leng = 300;
float angle = PI/8;
float shrink = 0.7;

void setup() {
  size(1200, 800);
}


void draw() {
  background(25);
  textSize(32);
  text("Fractal Tree", 10,40);
  textSize(24);
  text("Angle:  " + round(angle * 57.27) + "°", 10, 75);
  if(shrink > 0.7){
    fill(190,40,40);
  }
  text("Shrinking rate: " + shrink, 10, 105);
  fill(255);
  textSize(18);
  text("Use 'o' and 'p' for different angles.", 10, height - 18 -25);
  text("Use 'q' and 'w' for different shrinking rates. (>0.7 = lag)", 10, height -18);
  
  stroke(255); // random boje
  //stroke(255);
  translate(width/2, height);
  branch(leng*0.67);
}





void branch(float len) {  

  line(0, 0, 0, -len);
  translate(0, -len);
  if (len > 2) {
    pushMatrix();
    rotate(angle);
    //stroke(random(255),random(255),random(255));
    branch(len*shrink);
    popMatrix();
    pushMatrix();
    rotate(-angle);
    //stroke(random(255),random(255),random(255));
    branch(len*shrink);
    popMatrix();
  }
}

void keyPressed() {
  if (key == 'o') {
    angle = angle + PI/32;
  } else if (key == 'p') {
    angle = angle - PI/32;
  }else if(key == 'q'){
    shrink -= 0.02;
  }else if(key == 'w'){
    shrink += 0.02;
  }
}
