class Pipe
{
  private int X;
  private int[] opening = new int[2];
  private int updateSpeed = 2;
  
  public void init(int xPosition, int upperY, int lowerY)
  {
    X = xPosition;
    opening[0] = upperY;
    opening[1] = lowerY;
  }
  
  public void update(int PlayerHeight)
  {
    checkCollision(PlayerHeight);
    X -= updateSpeed;
    stroke(255);
    strokeWeight(4);
    line (X, 0, X, opening[0]);
    line(X, height, X, height-opening[1]);
    strokeWeight(1);
  }
  
  public void checkCollision(int playerLocation)
  {
    //Check Collision Line/Rect
  }
}
