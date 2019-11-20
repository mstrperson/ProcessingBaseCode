int x = 0;
int y = 0;
int dx = 0;
int dy = 0;


void setup()
{
  size(500, 500);
  frameRate(250);
}

void draw()
{
  background(#FFFFFF);
  
  if(keyCode == LEFT)
  {
    dx = -1;
    dy = 0;
  }
  else if(keyCode == RIGHT)
  {
    dx = 1;
    dy = 0;
  }
  
  if(keyCode == UP)
  {
    dy = -1;
    dx = 0;
  }
  else if(keyCode == DOWN)
  {
    dy = 1;
    dx = 0;
  }
  
  if(keyCode == ' ')
  {
    dx = 0;
    dy = 0;
  }
  
  x = x + dx;
  y = y + dy;
  
  if(x < 0) x = 0;
  if(x > width) x = width;
  if(y < 0) y = 0;
  if(y > height) y = height;
  
  
  
  fill(128, 0, 200);
  ellipse(x, y, 15, 15);
}
