class Bird
{
  PVector position, velocity, accel;
  float r = 16;
  
  Bird()
  {
    position = new PVector(50, height/2);
    velocity = new PVector(0, 0);
    accel = new PVector();
  }
  
  void addForceToBird(PVector X)
  {
    accel.add(X);
  }
  
  void updateBird()
  {
    addForceToBird(gravity);
    position.add(velocity);
    velocity.add(accel);
    velocity.limit(4);
    accel.mult(0);
    
    fill(255);
    circle(position.x, position.y, r);
  }
}
