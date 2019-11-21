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
