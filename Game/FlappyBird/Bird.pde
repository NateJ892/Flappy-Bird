/***************************************
* This Class Houses All Bird Functions *
***************************************/
class Bird
{
  PVector position, velocity, accel;                  //Translation Effects
  float r = 16;                                       //Bird Size
  
  Bird()
  {
    position = new PVector(50, height/2);             //Set Home Bird Position
    velocity = new PVector(0, 0);                     //Reset Velocity
    accel = new PVector();                            //Speed
  }
  
  void addForceToBird(PVector X)
  {
    accel.add(X);                                     //Add Jump Force To Bird
  }
  
  void updateBird()
  {
    addForceToBird(gravity);                          //Add Gravity To Bird
    position.add(velocity);                           //Add Velocity To The Bird
    velocity.add(accel);                              //Acecl To Velocity
    velocity.limit(4);                                //Limited To An Upward Force Of 4 Pixels
    accel.mult(0);                                    //Reset Accel
    
    fill(255);                                        //White Bird
    circle(position.x, position.y, r);                //Draw Bird
  }
}
