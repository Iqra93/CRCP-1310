Character myChar; 

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

float groundY;
float groundX;
float nextX;
float nextY;

float rand;
boolean check;

PImage img;

void setup() {
  size(500, 500);
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

  myChar = new Character();


  check = false;
}

void draw() {
  img = loadImage("ocean.jpeg");
  background (img); //prevents trail of moving objects

  textSize(16);
  text("Press 'w' key to make bubble fly \n If bubble falls it will pop", 10, 20);
  fill(0);


  groundY = 525;
  groundX = 500;


  fill(124, 91, 7);
  rect(x, y, l, w);
  x-= 1;
  boxEnd = x + l;
  if (boxEnd <= 0) {
    x = 600;
    l = random(100, 300);
    y = random(200, 400);
  }


  fill(0, 255, 0);
  rect(x2, y2, l2, w2);
  x2-= 1;
  boxEnd2 = x2 + l2;
  if (boxEnd2 <= 0) {
    dist = random(50, 300);
    l2 = random(100, 300);
    y2 = random(200, 400);
    x2 = boxEnd + dist;
  }

  if (check == false) {
    rand = random (0, 10);
  }
  if (rand == 3) {
    check = true;
   
  }


  if ( x <= 250 && boxEnd >= 225) {
    groundX = x;
    groundY = y;
    nextX = x2;
    nextY = y2;
  }

  if ( x2 <= 250 && boxEnd2 >= 225) {
    groundX = x2;
    groundY = y2;
    nextX = x;
    nextY = y;
  }

  //myChar[1].fly();
  myChar.drawCharacter();
  myChar.fly(groundY);
  myChar.hitSideBox(nextX, nextY, groundX, groundY);

  if (myChar.ballY >= height)
    reset();
}

void reset() {
  myChar.ballY = 375;
  myChar.hit = false;
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
}