/**********************************************************************
* Nathan Johnson                                                      *
* 7/1/2020                                                            *
* ICS SOMTHING                                                        *
* This Program Re-creates The Flappy Bird Game                        *
* Program Heavily Used Pseudo Code Throught Development For Debuging  *
**********************************************************************/

private static final float Gravity = 0.25, jumpForce = 1;                     //Constant Gravity On Bird Per Frame
private static final int gravityTicker = 4, scoreTicker = 20;
private float Velocity = 0;
private int yPosition, playerScore = 0;                                       //Velocity = Bird Up/Down, yPosition stores bird y
private boolean isAlive = true;                                               //Bird is Alive Boolean used for death screen

void setup()
{
  size(1000, 800);                                                            //1000 x 800 Canvas Size
  yPosition = height/2;                                                       //Spawn Bird At Half Screen Height
}

void draw()
{
  background(0);                                                              //Background Black
  fill(255, 0, 0);                                                            //"Bird" filled Red
  
  if (isAlive)                                                                //Checks Bird Life
  {
    if (yPosition <= 0 || yPosition >= height) isAlive = false;               //If Bird Is Out Of Bounds, Kills Bird
    else                                                                      //If NOT Out Of Bounds, Continue
    {
      if ((frameCount % gravityTicker) == 0) Velocity -= Gravity;             //Add Constant Of Gravity To Every 4 Frames
      if ((frameCount % scoreTicker) == 0) playerScore += 1;                  //Add To Score Every nth frame
      
      if (Velocity < 0) yPosition += 1;                                       //If Velocity Is Less-than Or Equal To Zero, Go Down 1 Pixel
      else if (Velocity > 0) yPosition -= 1;                                  //If Velocity Is Greater-Than Zero Go Up 
      
      
    }
    
    DrawAliveScene();
    println(Velocity);
  }
  else DrawDeathScene();
}

void keyPressed()                                                             //Jump Handler
{
  if (keyCode == ' ') Velocity += jumpForce;                                  //Jump On Space Inturupt
}

private void DrawAliveScene()
{
  background(0);
  fill(255, 0, 0);
  
  circle(20, yPosition, 20);
  
  //TODO: Draw Pipes
}

private void DrawDeathScene()
{
  fill(255);                                                                //Text Color White
  textMode(CENTER);                                                         //Text Anchor To Center
  textSize(32);                                                             //Text Size
  text("You Died!", width/2, height/2);                                     //Display Death Messege
  textSize(16);                                                             //Half Size Of Header
  text("Final Score: " + playerScore, width/2, (height/2)+20);              //Present Player With Score
}
