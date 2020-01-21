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
  background(0);
  
  if (frameCount % 80 == 0) pipes.add(new Pipe());
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
  }
  b.updateBird();

}
