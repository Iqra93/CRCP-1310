float x;
float y;
float l;
float w;
float boxEnd;

float x2;
float y2;
float l2;
float w2;
float boxEnd2;
float dist;


float ballY;
float fall;
float fly;
float groundY;
float groundX;
float nextX;
float nextY;

float rand;
boolean check;

void setup(){
  size(500,500);
  background (255);
  x = 0;
  y = 400;
  l = 300;
  w = 300;
  boxEnd = x + l;
  
  dist = 50;
  x2 = boxEnd + dist;
  y2 = 350;
  l2 = 50;
  w2 = 300;
  boxEnd2 = x2 + l2;
  
  
  ballY = 375;
  fall = 2;
  fly = 1.5;
  
  check = false;
}

void draw() {
  background (255); //prevents trail of moving objects
  
    groundY = 525;
    groundX = 500;
    
    
  fill(255,0,0);
  rect(x, y, l, w);
  x-= 1;
  boxEnd = x + l;
  if(boxEnd <= 0){
    x = 600;
    l = random(100, 300);
    y = random(200, 400);
  }
  

  
  
  
  fill(0, 255,0);
  rect(x2, y2, l2, w2);
  x2-= 1;
  boxEnd2 = x2 + l2;
  if(boxEnd2 <= 0) {
    dist = random(50 , 300);
    l2 = random(100, 300);
    y2 = random(200, 400);
    x2 = boxEnd + dist;
    
  }
  
  if (check == false){
    rand = random (0, 10);
  }
  if (rand == 3){
    check = true;
    //draw rect that floats
    //if rect is off screen, change check to false
  }
  
  
  fill(0,0,255);
  ellipse(250,ballY,50,50);
  
  if( x <= 250 && boxEnd >= 225){
    groundX = x;
    groundY = y;
    nextX = x2;
    nextY = y2;
  }
   
  if( x2 <= 250 && boxEnd2 >= 225){
    groundX = x2;
    groundY = y2;
    nextX = x;
    nextY = y;
  }
    
  if(keyPressed == true && hitSideBox() == false){
    if(key == 'w')
      ballY -= fly;
      fly -= .01;
      fall = 2;
  }
  
  
  if(keyPressed != true){
     if(ballY + 25 >= groundY  && hitSideBox() == false) {
       ballY = groundY -25;
     } else if(ballY + 25 < groundY){
        ballY+= fall;
        fall += .1;
        fly = 1.5;
     }
   }
   
   if (ballY >= 500) {
      x = 0;
      y = 400;
      l = 300;
      w = 300;
      boxEnd = x + l;
  
      dist = 50;
      x2 = boxEnd + dist;
      y2 = 350;
      l2 = 50;
      w2 = 300;
      boxEnd2 = x2 + l2;
  
  
      ballY = 375;
      fall = 2;
      fly = 1.5;
   }
   
  
  
}

boolean hitSideBox(){
  boolean hit = false;
  if(ballY - 25 >= nextY && 250 >= nextX){ //ballY < y && ballX >= groundX
    hit = true;
    if (ballY <= 500) { 
      fall = 8;
      ballY += fall;
    }
  }
  if(ballY - 25 > groundY && 250 >= groundX ){ //ballY < y && ballX >= groundX
    hit = true;
    if (ballY <= 500) { 
      fall = 8;
      ballY += fall;
    }
  }
  return hit; 
}