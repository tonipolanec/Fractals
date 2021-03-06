
float maxSide = 450;
int maxIteration = 0;
float duljinaStranice, duljinaSvihStranica, povrsinaOrigigi, povrsina;
int iteration, brojStranica;

color back = color(0);
color line = color(255);
color fallLine = back;

int oznake = -1;

void setup(){
  size(800,600);
  background(back);


}


void draw(){
  background(back);
  stroke(line);
  pushMatrix();
    translate(width*0.6,38);
    
    duljinaStranice = maxSide/(pow(3,maxIteration));
    brojStranica = (int)(3*pow(4,maxIteration));
    duljinaSvihStranica = brojStranica * duljinaStranice;
    
    povrsinaOrigigi = (pow(maxSide,2)*sqrt(3))/4;
    povrsina = (povrsinaOrigigi/5)*(8-3*(pow(0.4444444,maxIteration)));
    
    println("Duljina a = " + duljinaStranice);
      println("Broj stranica: " + brojStranica);
        println("Opseg: " + duljinaSvihStranica);
          println("Povrsina = " + povrsina);
            println("------------------------------------");
    
  
    pushMatrix();
      rotate(PI/3);
      side(0,0,0,maxSide,0);
    popMatrix();
    
    pushMatrix();
      rotate(-PI/3);
      translate(-maxSide,0);
      side(0,0,0,maxSide,0);  
    popMatrix();
    
    pushMatrix();
      translate(maxSide/2,((maxSide*sqrt(3))/2));
      rotate(PI);
      side(0,0,0,maxSide,0);
    popMatrix();
  
  popMatrix();
  
  ispisPodataka();
 
  
}


void side(int iter, float x1, float y1, float x2, float y2){
  if(iter <= maxIteration){
    float kx1, ky1, kx2, ky2, a, dx, va, vx, vy;   
    
    iteration = iter;
    
    ky1 = y1;  ky2 = y1;    //
    kx1 = (x2-x1) /3;       // Pronalaženje točaka iz kojih će krenuti trokut.
    kx2 = 2 * (x2-x1) /3;   //
    
    a = (x2-x1) /3;    // Duljina baze novog trokuta.
    dx = x2/2;     //  Pronalaženje točke u sredini baze. 
    
    va = (a*sqrt(3))/2; // Izračunavanje visine na bazu a.
    
    vx = dx;    //
    vy = -va;   // Izračunavanje koordinate točke na vrhu novog trokuta.
    
     
    strokeWeight(3);
    if(iter == maxIteration){
      line(x1,0,x2,0);
    }else{
      line(x1,0,kx1,0); // crtanje glavne linije.
      line(kx2,0,x2,0);
      
      stroke(fallLine);
        strokeWeight(5);
          line(kx1,0,kx2,0);
        strokeWeight(3);
      stroke(line);  

    }
    
    //-------1------
    pushMatrix();
      side(iter+1,0,0,a,0);
    popMatrix();
    
    //-------4------
    pushMatrix();
    translate(kx2,ky2);
      side(iter+1,0,0,a,0);
    popMatrix();
    
    //-------2------
    pushMatrix();
    translate(kx1,ky1);
    rotate(-PI/3);
      side(iter+1,0,0,a,0);
    popMatrix();
    
    //-------3------
    pushMatrix();
    translate(vx,vy);
    rotate(PI/3);
      side(iter+1,0,0,a,0);
    popMatrix();
    
       
  }

}

void ispisPodataka(){
  
  textSize(80);
    fill(200);
    text(iteration, width-100, 100);
  fill(line);
  
  textSize(30);
    text("N = " + brojStranica, 12, 35);
  textSize(25);
    text("a = " + duljinaStranice, 10, 80);
    text("O = " + duljinaSvihStranica, 10, 120);
    text("P = " + povrsina, 10, 160);
    
    if(oznake > 0)
      ispisOznaka();
    
}

void ispisOznaka(){
  
  textSize(40);
  if(iteration == 0){
    text("a", width*0.6 + 120, height/2 - 80);  
  }else if(iteration == 1){
      textSize(30);
    text("a/3", width*0.6 + 50, 100);  
    text("a/3", width*0.6 + 120, height/2 - 145);  
    text("a/3", width*0.6 + 190, height/2 - 50);  
    text("a/3", width*0.6 + 190, height/2 + 50);  

  }

}



void keyPressed() {
  if (key == 'p') {
    if(maxIteration != 7)
      maxIteration++;
  }else if(key == 'o'){
    if(maxIteration > 0)
      maxIteration--;
  }else if(key == 'a'){
    oznake *= -1;
  }
  
}
