class Pipe
{
  float x, top, bottom, w = 40;
  
  Pipe()
  {
    x = width + 50;
    top = random(100, height/2);
    bottom = random(100, height/2);
  }
  
  boolean checkCollision(Bird TEMP)
  {
    return false;
  }
  
  void updatePipe()
  {
    x -= 2;
    
    stroke(255);
    fill(255);
    
    rect(x, 0, w, top);
    rect(x, height - bottom, w, bottom);
  }
}
