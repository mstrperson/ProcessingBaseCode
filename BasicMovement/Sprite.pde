abstract class Sprite
{
  int x, y;
  
  float dx, dy;
  
  Sprite(int x, int y)
  {
    this.x = x;
    this.y = y;
    
    this.dx = 0;
    this.dy = 0;
  }
  
  boolean collidesWith(color c)
  {
    return get(x,y)==c;
  }
  
  void move()
  {
    x += dx;
    y += dy;
    
    // make sure we don't go out of bounds
    if(x < 0)
    { 
      x = 0;
      dx *= -1;
    }
    if(x > width) 
    {
      x = width;
      dx *= -1;
    }
    if(y < 0) 
    {
      y = 0;
      dy *= -1;
    }
    if(y > height)
    {
      y = height;
      dy *= -1;
    }
  }
  
  abstract void drawSprite();
}

class Blob extends Sprite
{
  int radius;
  color myColor;
  Blob(int x, int y, int r, color c)
  {
    super(x, y);
    dx = 1;
    dy = 1.5;
    myColor = c;
    radius = r;
  }
  
  void drawSprite()
  {
    fill(myColor);
    ellipse(x, y, radius, radius);
  }
}
