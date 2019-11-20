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
  
  void chase(Sprite other)
  {
    if(this.x < other.x -10)
    {
      x += abs(dx);
    }
    else if(this.x > other.x + 10)
    {
      x -= abs(dx);
    }
    
    if(this.y < other.y -10)
    {
      y += abs(dy);
    }
    else if(this.y > other.y + 10)
    {
      y -= abs(dy);
    }
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
  
  void move()
  {
    if(this.collidesWith(color(128, 0, 200)))
    {
      dx *= -1;
      dy *= -1;
    }
    super.move();
  }
  
  void drawSprite()
  {
    fill(myColor);
    ellipse(x, y, radius, radius);
  }
}
