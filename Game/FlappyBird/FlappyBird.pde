/**************************************
* Nathan Johnson                      *
* 21/01/2020                          *
* Mr. Kuhn                            *
* ICS201                              *
* This Program Recreates Flappy Bird  *
**************************************/

Bird b;
int Score = 0;
ArrayList<Pipe> pipes = new ArrayList();
boolean jumping = false, alive = true;
PVector gravity = new PVector(0, 0.5);

void setup()
{
  size(1000, 800);
  b = new Bird();
  pipes.add(new Pipe());
}

void draw()
{
  push();
  if (alive)
  {
    background(0);
  
    if (frameCount % 80 == 0)
    {
      pipes.add(new Pipe());
      Score += 1;
    }
    if (b.position.y < 0 || b.position.y > height) alive = false;
    
    if (keyPressed)
    {
      PVector up = new PVector(0, -5);
      b.addForceToBird(up);
    }
  
    for (int i = 0; i < pipes.size(); i++)
    {
      Pipe TempPipe = pipes.get(i);
      TempPipe.updatePipe();
      
      if (TempPipe.checkCollision(b)) alive = false;
    }
    
    textSize(16);
    fill(255);
    text("Score: " + Score, 10, 15);
    b.updateBird();
  }
  else 
  {
    textAlign(CENTER);
    textSize(64);
    fill(255);
    text("You Died!", width/2, (height/2)-40);
    textSize(32);
    text("Score: " + Score + "\nPress Space To Respawn", width/2, height/2);
    
    if (keyPressed)
    {
      if (key == ENTER)
      {
        alive = true;
        Score = 0;
        pipes.clear();
        b.position = new PVector(50, height/2);
      }
    }
  }
  pop();
}
