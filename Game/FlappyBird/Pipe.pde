class Pipe
{
  private int X, upperPipe, lowerPipe;
  private int lowerYOffset = 40;
  
  Pipe()
  {
    X = width;
    upperPipe = (int)random(1, height-lowerYOffset);
    lowerPipe = upperPipe+lowerYOffset;
  }
  
  void update()
  {
    strokeWeight(3);
    stroke(255);
    
    line (X, upperPipe, X, lowerPipe);
    X -= 1;
    strokeWeight(1);
  }
}
