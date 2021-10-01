/// @description Player Bullet Parent
ini = false; //initialize boolean for handling instances




#region Bullet Data
bullet_type = 6; //Damage Type; 6 for default damage
bullet_dmg = 1; //Damage Total

bullet_controller = 0; //Bullet's Player Parent; mainly for controlling flamethrower/charge shots

bullet_data[0] = 1; //Bullet Velocity

bullet_data[1] = 0; //Bullet Point Direction 
bullet_data[2] = 0; //Bullet Homing Trigger

bullet_data[3] = 0; //Bullet Gravity

bullet_data[4] = 1; //Bullet Boomerang Multiplier

bullet_data[5] = 5; //Bullet Bounce Count
bullet_data[6] = 10; //Bullet Bounce Frame Count

bullet_data[7] = 0; //Bullet Stick Checker

bullet_Super = false; //Boolean to determine if it builds super or is the Super shot

object_state = objectState.normal;//Bullet Status
#endregion
