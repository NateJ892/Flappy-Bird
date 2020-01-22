/**************************************
* Nathan Johnson                      *
* 21/01/2020                          *
* Mr. Kuhn                            *
* ICS201                              *
* This Program Recreates Flappy Bird  *
**************************************/

Bird b;                                                                        //Creates Bird
int Score = -7;                                                                 //Holds the current Score Of Player
ArrayList<Pipe> pipes = new ArrayList();                                       //Dynamic Array Of Pipes
boolean alive = true;                                                          //Var To Hold If Bird Is Alive
PVector gravity = new PVector(0, 0.5);                                         //Constant Pull Of Gravity For Bird
PFont Large, Small;                                                            //Font Workaround for processing issue #1972 (Blurry P2D Text)
void setup()
{
  fullScreen(P2D);                                                             //Switch To Integrated Graphics Rendering For Faster FrameRate (Default CPU)
  ((PGraphicsOpenGL)g).textureSampling(3);                                     //Render Everything 3 Times Over
  b = new Bird();                                                              //Create Bird
  pipes.add(new Pipe());                                                       //Create First Pipe
  Large = createFont("Corbel", 64);                                            //Font Workaround
  Small = createFont("Corbel", 32);                                            //Font Workaround
}

void draw()
{
  push();                                                                      //Push All Processing Globals To Stack (Reset Offset WorkAround)
  if (alive)                                                                   //If Bird Alive
  {
    background(0);                                                             //Clear Screen
  
    if (frameCount % 80 == 0)                                                  //Every 80 Frames
    {
      pipes.add(new Pipe());                                                   //Create New Pipe
      Score++;                                                                 //Increment Score
    }
    if (b.position.y < 0 || b.position.y > height) alive = false;              //If Out Of Bounds, Kill Bird
    
    if (keyPressed)                                                            //When Any Key Is Pressed Jump Bird
    {
      PVector up = new PVector(0, -5);                                         //Create Jump Velocity
      b.addForceToBird(up);                                                    //Add Jump Velocity To Bird (Function In Bird Class)
    }
  
    for (int i = 0; i < pipes.size(); i++)                                     //For Every Active Pipe
    {
      Pipe TempPipe = pipes.get(i);                                            //Get The Current Pipe
      TempPipe.updatePipe();                                                   //Update The Pipe Via The Temp Pointer
      
      if (TempPipe.checkCollision(b)) alive = false;                           //Also Check Collison For Each Pipe (Pipe Class Function)
    }
    
    textSize(16);                                                              //Default Size (Dosen't Need Font Workaround because size 16 is Default)
    fill(255);                                                                 //White Text
    text("Score: " + Score + "\nFrameRate: " + round(frameRate), 10, 15);      //Show Stats Top Left Corner
    b.updateBird();                                                            //Update & Draw Bird At The End Of Frame (Function In Bird Class)
  }
  else                                                                         //If Dead (Alive Check Fails)
  {
    background(0);                                                             //Clear Screen
    textAlign(CENTER);                                                         //Center Text Anchor
    fill(255);                                                                 //White Text
    textFont(Large);                                                           //Font Workaround (Scaled Text)
    text("You Died!", width/2, (height/2)-40);                                 //Death Messege
    textFont(Small);                                                           //Stats Text Font
    text("Score: " + Score + "\nPress Enter To Respawn", width/2, height/2);   //Show Stats
    
    if (keyPressed)                                                            //On Key Press
    {
      if (key == ENTER)                                                        //If Key Is Equal To Enter Key
      {
        alive = true;                                                          //Life Respawned
        Score = 0;                                                             //Score Reset
        pipes.clear();                                                         //Clear Entire Pipe Array To Free Ram/Java Garbage Collection
        b.position = new PVector(50, height/2);                                //Reset Bird Position
      }
    }
  }
  pop();                                                                      //Pull Processing Global Variables From Stack (Reset Offset WorkAround)
}
