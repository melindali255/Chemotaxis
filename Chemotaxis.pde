//declare bacteria variables here   
Bacteria[] dots;
int mouseColor = color(121, 193, 240);
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
  //food
  fill(255, 98, 111);
  ellipse(250, 250, 50, 50);
  //move and show the bacteria
  for (int i = 0; i < dots.length; i++) {
    dots[i].walk();
    dots[i].show();
    dots[i].checkCollision();
  }
  //mouse bacteria
  fill(mouseColor);
  ellipse(mouseX, mouseY, 25, 25);
}  
class Bacteria    
{     
  int myX;
  int myY;
  int myColor;
  Bacteria() {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*25);
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
    ellipse(myX, myY, 20, 20);
  }
  void checkCollision() {
    if (get(myX, myY) == color(mouseColor)) {
      myX = (int)(Math.random() * 500);
      myY = (int)(Math.random()*40 + 400);
      System.out.println("hit");
    }
  }
}
