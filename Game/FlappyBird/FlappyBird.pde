PVector PlayerPosition;
Pipe[] pipes = new Pipe[6];

void setup()
{
  size(1000, 800);
  PlayerPosition = new PVector(40, width/2);
  
  int Spawn = width;
  for (int i = 0; i < pipes.length; i++)  //Generate Inital Pipes TODO: Create Random Routine
  {
    pipes[i] = new Pipe();
    pipes[i].init(Spawn, (int)random(height/2), (int)random(height/2, height));
    Spawn += 340;
  }
}

void draw()
{
  background(0);
  fill(255);
  
  for (int i = 0; i < pipes.length; i++)  //Updates Pipes
  {
    pipes[i].update((int)PlayerPosition.y);
  }
}

void keyReleased()
{
  if (keyCode == ' ')
  {
    //TODO: Jump Mechanic
  }
}
