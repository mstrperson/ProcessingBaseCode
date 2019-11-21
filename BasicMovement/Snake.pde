// Snake does NOT extend Sprite, but instead encapsulates a bunch of sprites.
class Snake
{
  // SnakeJoint IS a Sprite.
  SnakeJoint head;
  
  // Snake needs to know where the Head starts and how many links it should have.
  // length must be at least 2, otherwise it's not a snake, it's just a Blob.
  Snake(int len, int x, int y, int r, color c)
  {
    head = new SnakeJoint(x, y, (int)(r*1.5), 2.0, 1.5, c);
    
    // build the linked list of SnakeJoints
    SnakeJoint temp = new SnakeJoint(x+2*r, y+2*r, r, head.dx, head.dy, c+color(15, 15, 15));
    head.next = temp;
    for(int i = 2; i < len; i++)
    {
      SnakeJoint temp2 = new SnakeJoint(x+2*r*i, y+2*r*i, r, head.dx, head.dy, c);
      temp.next = temp2;
      temp = temp2;
    }
  }
  
  // Move the head, then have each subsequent joint follow along.
  void move()
  {
    head.move();
    head.next.follow(head);
  }
  
  // Draw the Snake.  How does this work????
  void drawSnake()
  {
    head.drawSprite();
  }
}

// SnakeJoint extends Blob which in turn extends Sprite,
// so SnakeJoint is like a grand-child but still has all the
// properties and methods of Sprite.
class SnakeJoint extends Blob
{
  // SnakeJoint contains a SnakeJoint as a member.
  // This is a data structure called a "Linked List"
  SnakeJoint next;
  
  // It's just a Blob~ Nothing fancy to see here.
  SnakeJoint(int x, int y, int r, float dx, float dy, color c)
  {
    super(x, y, r, dx, dy, c);
  }
  
  // Follow the leader!~
  void follow(SnakeJoint theLeader)
  {
    this.chase(theLeader, this.radius*0.9);
    
    // if there is another SnakeJoint, make it follow this one.
    if(next != null)
      next.follow(this);
  }
  
  // Draw the Snake recursively.
  void drawSprite()
  {
    // Draw this Blob, because i'm just a blob afterall.
    super.drawSprite();
    
    // but then also draw the next one, if there is a next one.
    if(next != null)
      next.drawSprite();
  }
}
