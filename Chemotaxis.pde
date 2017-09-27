//declare bacteria variables here   
Bacteria dot1;
Bacteria dot2;
Bacteria dot3;
void setup()   
{     
  size(500, 500);
  background(255);
  //initialize bacteria variables here
  dot1 = new Bacteria(0, 0);
  dot2 = new Bacteria(400, 400);
  dot3 = new Bacteria (250, 500);
}   
void draw()   
{    
  background(255);
  //food
  fill(255, 98, 111);
  ellipse(250, 250, 50, 50);
  //move and show the bacteria
  dot1.show();
  dot1.walk();
  dot2.show();
  dot2.walk();
  dot3.show();
  dot3.walk();
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
    System.out.println("xStep" + xStep);
    System.out.println("yStep" + yStep);
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
    ellipse(myX, myY, 50, 50);
  }
}    
