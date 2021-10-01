/// @description Parent object for solid environments
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

//Liquid Values
lqd     = 0; //liquid
prvlqd  = 0; //prevLiquid
slqd    = 0; //ShallowLiquid
sprvlqd = 0; //prevShallowLiquid
splashdelay = 4;

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
