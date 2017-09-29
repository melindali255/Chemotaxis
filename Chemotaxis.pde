//declare bacteria variables here   
Bacteria[] dots;
int mouseColor = color(121, 193, 240);
boolean gameOver = false;

void setup()   
{     
  size(500, 500);
  background(255);
  //initialize bacteria variables here
  dots = new Bacteria[20];
  for (int i = 0; i < dots.length; i++) {
    dots[i] = new Bacteria();
  }
}

void draw()   
{    
  background(255);

  //move and show the bacteria
  for (int i = 0; i < dots.length; i++) {
    dots[i].walk();
    dots[i].show();
  }

  //food
  fill(255, 98, 111);
  ellipse(250, 250, 50, 50);
  //mouse bacteria
  fill(mouseColor);
  ellipse(mouseX, mouseY, 50, 50);

  //check if bacteria collided
  for (int i = 0; i < dots.length; i++) {
    dots[i].checkCollision();
  }
}  

void mousePressed() {
  if (gameOver == true) {
    loop();
    setup();
  }
}

class Bacteria    
{     
  int myX;
  int myY;
  int myColor;
  Bacteria() {
    myX = (int)(Math.random()*500);
    findRandSide();
    //color of bacteria
    myColor = color(192, 148, 232);
  }
  void walk() {
    int xStep;
    int yStep;
    if (myX < 250) {
      xStep = (int)(Math.random()*3);
    } else 
    {
      xStep = (int)(Math.random()*3 - 3);
    }
    if (myY < 250) {
      yStep = (int)(Math.random()*3);
    } else 
    {
      yStep = (int)(Math.random()*3 - 3);
    }
    myX = myX + xStep;
    myY = myY + yStep;
    //keep in screen
    if (myX < 0)
      myX = 0;
    if (myX > 500) 
      myX = 500;
    if (myY < 0) 
      myY = 0;
    if (myY > 500) 
      myY = 500;
  }
  void show() {
    fill(myColor);
    stroke(2);
    ellipse(myX, myY, 20, 20);
  }
  void checkCollision() {
    //hit mouse circle
    if (get(myX, myY) == mouseColor) {
      findRandSide();
    }
    //hit food
    if (get(myX, myY) == color(255, 98, 111)) {
      noLoop();
      fill(0);
      textSize(50);
      textAlign(CENTER);
      text("Game Over", 250, 225);
      textSize(25);
      text("Click to restart", 250, 275);
      gameOver = true;
    }
  }
  void findRandSide() {
    //get bacteria to come from either side of the screen (top, right, bottom, left)
    double randSide = Math.random();
    if (randSide < 0.25) { 
      myX = (int)(Math.random() * 500);
      myY = (int)(Math.random() * 25 - 25);
    } else if (randSide < 0.5) {
      myX = (int)(Math.random() * 25 + 500);
      myY = (int)(Math.random() * 500);
    } else if (randSide < 0.75) {
      myX = (int)(Math.random() * 500);
      myY = (int)(Math.random() * 25 + 500);
    } else {
      myX = (int)(Math.random() * 25 - 25);
      myY = (int)(Math.random() * 500);
    }
  }
}
