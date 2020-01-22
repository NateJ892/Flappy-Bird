/***************************************
* This Class Houses All Pipe Functions *
***************************************/

class Pipe
{
  float x, top, bottom, w = 20;                                                          //Positioning Vars
  
  Pipe()
  {
    x = width + 50;                                                                      //Offset Of 50 To The Right Most Screen
    top = random(100, height/2);                                                         //Random Top Pipe
    bottom = random(100, height/2);                                                      //Random Bottom Pipe
  }
  
  boolean checkCollision(Bird TEMP)
  {
    //TOP PIPE
    float testX = TEMP.position.x, testY = TEMP.position.y;                              //Set Bird Position
    
    if (testX < x) testX = x;                                                            //left Most Check
    else if (testX > x+w) testX = x+w;                                                   //Right Most Check
    
    if (testY < 0) testY = 0;                                                            //Top Check
    else if (testY > top) testY = top;                                                   //Bottom Check
    
    float distX = TEMP.position.x-testX, distY = TEMP.position.y-testY;                  //Distance Variables Set
    float distance = sqrt(pow(distX, 2) + pow(distY, 2));                                //Get The Distance Between 2 Points
    
    if (distance+5 < TEMP.r) return true;                                                //Kill Bird Response
    
    //BOTTOM PIPE (Same As Top Pipe Check)
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
    
    return false;                                                                      //If No Collision Detected Return false to Colloision Check Call
  }
  
  void updatePipe()                                                                    //Update Pipes
  {
    x -= 2;                                                                            //Move Left
    
    stroke(255);                                                                      //White Outline
    fill(0, 255, 0);                                                                  //Body Color Green
    
    rect(x, 0, w, top);                                                               //Draw Top
    rect(x, height - bottom, w, bottom);                                              //Draw Bottom
  }
}
