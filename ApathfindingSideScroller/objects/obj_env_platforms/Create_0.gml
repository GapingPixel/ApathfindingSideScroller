/// @description Parent object for environment platforms
//scr_set_enemy_vars(1,1,1,1,1,1,false);
scr_env_set_vars(5,0);

//Physics
platformTarget = 0;
// Velocity
vx = 0;
vy = 0;

// Used for sub-pixel movement
cx = 0;
cy = 0;

onGround = Grounded();
cLeft    = place_meeting(x - 1, y, parSolid);
cRight   = place_meeting(x + 1, y, parSolid);

//Use for moving, gravity, etc.
groundAccel = 1.00;
groundFric  = 6.00;
airAccel    = 0.75;
airFric     = 0.5;
vxMax       = 1;
vyMax       = 15;
jumpHeight  = 15.00;
gravNorm    = 8;

//Use for moving platforms
x_speed = 0;
x_speed_excess = 0;
x_speed_final = 0;

y_speed = 0;
y_speed_excess = 0;
y_speed_final = 0;