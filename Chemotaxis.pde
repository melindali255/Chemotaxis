//declare bacteria variables here   
Bacteria dot1;
Bacteria dot2;
void setup()   
{     
  size(500, 500);
  background(255);
  //initialize bacteria variables here
  dot1 = new Bacteria(100, 200);
  dot2 = new Bacteria(400, 400);
}   
void draw()   
{    
  background(255);
  //move and show the bacteria
  dot1.show();
  dot1.walk();
  dot2.show();
  dot2.walk();
}  
class Bacteria    
{     
  int myX;
  int myY;
  Bacteria(int x, int y) {
    myX = x;
    myY = y;
  }
  void walk() {
    int xStep = 0;
    int yStep = 0;
    if (mouseX < myX) {
      xStep = (int)(Math.random()*3 - 3);
    } else 
    {
      xStep = (int)(Math.random()*3 + 3);
    }
    if (mouseY < myY) {
      yStep = (int)(Math.random()*3 - 3);
    } else 
    {
      yStep = (int)(Math.random()*3 + 3);
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
    fill(192, 148, 232);
    noStroke();
    ellipse(myX, myY, 50, 50);
  }
}    
