// x and y coordinates of my character
int x = 0;
int y = 0;
// how fast i'm moving in the x and y directions
int dx = 0;
int dy = 0;

Blob blob = new Blob(250, 300, 15, color(200, 180, 255));
Blob otherBlob = new Blob(400, 120, 15, color(28, 240, 80));

void setup()
{
  // make the screen 500x500 pixels
  size(500, 500);
  // make the game go a little faster
  frameRate(250);
  blob.dx = 1.25;
  blob.dy = 1.75;
}

void draw()
{
  // Fill the background WHITE
  background(#FFFFFF);
  
  // If I hit the LEFT arrow, go Left
  if(keyCode == LEFT)
  {
    dx = -1;
    dy = 0;
  }
  // if I hit the RIGHT arrow, go Right
  else if(keyCode == RIGHT)
  {
    dx = 1;
    dy = 0;
  }
  // if I hit the UP arrow, go Up
  if(keyCode == UP)
  {
    dy = -1;
    dx = 0;
  }
  // if I hit the DOWN arrow, go Down
  else if(keyCode == DOWN)
  {
    dy = 1;
    dx = 0;
  }
  // if I hit the Space Bar, Stop
  if(keyCode == ' ')
  {
    dx = 0;
    dy = 0;
  }
  
  // move x and y in the appropriate way
  x = x + dx;
  y = y + dy;
  
  // make sure we don't go out of bounds
  if(x < 0) x = 0;
  if(x > width) x = width;
  if(y < 0) y = 0;
  if(y > height) y = height;
  
  // draw the ellipse
  fill(128, 0, 200);
  ellipse(x, y, 15, 15);
  
  blob.move();
  blob.drawSprite();
  
  otherBlob.chase(blob);
  otherBlob.drawSprite();
}
