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
  
  public void update()
  {
    X -= updateSpeed;
    stroke(255);
    strokeWeight(4);
    line (X, 0, X, opening[0]);
    strokeWeight(1);
  }
  
  public void checkCollision(int playerLocation)  //TODO
  {
    
  }
}
