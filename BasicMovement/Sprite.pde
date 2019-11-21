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
    float speed = sqrt(dx*dx + dy*dy);
    int delX = other.x - this.x;
    int delY = other.y - this.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) x += (delX / mag) * speed;
    if(delY != 0) y += (delY / mag) * speed;
  }
  
  void followMouse()
  {
    float speed = sqrt(dx*dx + dy*dy);
    int delX = mouseX - this.x;
    int delY = mouseY - this.y;
    float mag = sqrt(delX*delX + delY*delY);
    
    if(delX != 0) x += (delX / mag) * speed;
    if(delY != 0) y += (delY / mag) * speed;
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
