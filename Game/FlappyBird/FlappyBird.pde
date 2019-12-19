PVector PlayerPosition;
Pipe[] pipes = new Pipe[6];

void setup()
{
  size(1000, 800);
  PlayerPosition = new PVector(40, width/2);
  int Spawn = width;
  for (int i = 0; i < pipes.length-1; i++)
  {
    pipes[i] = new Pipe();
    pipes[i].init(Spawn, width/2, 1);
    Spawn += 340;
  }
}

void draw()
{
  background(0);
  fill(255);
  
  for (int i = 0; i < pipes.length-1; i++)  //Updates Pipes
  {
    pipes[i].update();
  }
}

void keyReleased()
{
  if (keyCode == ' ')
  {
    //TODO: Jump Mechanic
  }
}
