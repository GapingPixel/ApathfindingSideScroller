/// @description Parent object for solid environments that are wall jump capable
event_inherited();
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

