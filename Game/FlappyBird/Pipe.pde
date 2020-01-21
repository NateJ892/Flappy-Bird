class Pipe
{
  float x, top, bottom, w = 20;
  
  Pipe()
  {
    x = width + 50;
    top = random(100, height/2);
    bottom = random(100, height/2);
  }
  
  boolean checkCollision(Bird TEMP)
  {
    //TOP PIPE
    float testX = TEMP.position.x, testY = TEMP.position.y;
    
    if (testX < x) testX = x;
    else if (testX > x+w) testX = x+w;
    
    if (testY < 0) testY = 0;
    else if (testY > top) testY = top;
    
    float distX = TEMP.position.x-testX, distY = TEMP.position.y-testY;
    float distance = sqrt(pow(distX, 2) + pow(distY, 2));
    
    if (distance+5 < TEMP.r) return true;
    
    //BOTTOM PIPE
    testX = TEMP.position.x;
    testY = TEMP.position.y;
    
    if (testX < x) testX = x;
    else if (testX > x+w) testX = x+w;
    
    if(testY < height - bottom) testY = height-bottom;
    else if (testY > (height-bottom)+bottom) testY = (height-bottom)+bottom;
    
    distX = TEMP.position.x-testX;
    distY = TEMP.position.y-testY;
    
    distance = sqrt(pow(distX, 2) + pow(distY, 2));
    if (distance+5 < TEMP.r) return true;
    
    return false;
  }
  
  void updatePipe()
  {
    x -= 2;
    
    stroke(255);
    fill(0, 255, 0);
    
    rect(x, 0, w, top);
    rect(x, height - bottom, w, bottom);
  }
}
