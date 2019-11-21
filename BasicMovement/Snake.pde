class Snake
{
  SnakeJoint head;
  
  Snake(int len, int x, int y, int r, color c)
  {
    head = new SnakeJoint(x, y,(int)(r*1.5), c);
    head.dx = 2;
    head.dy = 1.5;
    
    SnakeJoint temp = new SnakeJoint(x+2*r, y+2*r, r, c+color(15, 15, 15));
    temp.dx = head.dx;
    temp.dy = head.dy;
    head.next = temp;
    for(int i = 2; i < len; i++)
    {
      SnakeJoint temp2 = new SnakeJoint(x+2*r*i, y+2*r*i, r, c);
      temp2.dx = head.dx;
      temp2.dy = head.dy;
      temp.next = temp2;
      temp = temp2;
    }
  }
  
  void move()
  {
    head.move();
    head.next.follow(head);
  }
  
  void drawSnake()
  {
    head.drawSprite();
  }
}

class SnakeJoint extends Blob
{
  SnakeJoint next;
  
  SnakeJoint(int x, int y, int r, color c)
  {
    super(x, y, r, c);
  }
  
  void follow(SnakeJoint theLeader)
  {
    this.chase(theLeader);
    if(next != null)
      next.follow(this);
  }
  
  void drawSprite()
  {
    super.drawSprite();
    if(next != null)
      next.drawSprite();
  }
}
