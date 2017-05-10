class Character {
  float ballY;
  float fall;
  float fly;
  boolean hit;



  Character() {
    ballY = 375;
    fall = 2;
    fly = 1.5;
    hit = false;
  }

  void drawCharacter() {
    fill(52, 226, 255);
    ellipse(250, ballY, 50, 50);
  }
  void fly(float groundY) {
    if (keyPressed == true && hit == false) {
      if (key == 'w') 
        ballY -= fly;
      fly -= .01;
      fall = 2;
    }
    if (keyPressed != true && hit == false) {
      if (ballY + 25 >= groundY) {
        ballY = groundY -25;
      } else  if (ballY + 25 < groundY) {
        ballY+= fall;
        fall += .1;
        fly = 1.5;
      }
    }
  }

  void hitSideBox(float nextX, float nextY, float groundX, float groundY) {
    if (ballY - 25 >= nextY && 250 >= nextX) { //ballY < y && ballX >= groundX
      hit = true;
      if (ballY <= 500) { 
        fall = 8;
        ballY += fall;
      }
    }
    if (ballY - 25 > groundY && 250 >= groundX ) { //ballY < y && ballX >= groundX
      hit = true;
      if (ballY <= 500) { 
        fall = 8;
        ballY += fall;
      }
    }
  }
}