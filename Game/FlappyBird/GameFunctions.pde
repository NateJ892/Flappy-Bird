class GameFunctions
{
  public void DrawAlive(int Score)
  {
    background(0);
    fill(255);
    text("Score: " + Score, 15, 15);
    
    fill(255, 0, 0);
    circle(20, yPosition, 20);
  
    //TODO: Draw Pipes
  }
  
  public void DrawDeath()
  {
    fill(255);                                                                                       //Text Color White
    textAlign(CENTER);                                                                               //Text Anchor To Center
    textSize(32);                                                                                    //Text Size
    text("You Died!", width/2, height/2);                                                            //Display Death Messege
    textSize(16);                                                                                    //Half Size Of Header
    text("Final Score: " + playerScore + "\n Click Anywhere To Restart", width/2, (height/2)+20);    //Present Player With Score And Options
  }
} 
