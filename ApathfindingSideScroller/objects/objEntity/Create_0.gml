/// @description Entities that have Physics
ini = false;

facing = image_xscale;//facing of object

jumped = false;
landed = false;

platformTarget = 0;
wallTarget     = 0;

//Delta Time Value; mainly for certain animations
dt = 0;

// Velocity values; x for horizontal, y for vertical
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
airFric     = 0.4;
vxMax       = 1;
vyMax       = 1;
jumpHeight  = 15.00;
gravNorm    = 1;
gravDirection = 270;


//Liquid Values
lqd     = 0; //liquid
prvlqd  = 0; //prevLiquid
slqd    = 0; //ShallowLiquid
sprvlqd = 0; //prevShallowLiquid
splashdelay = 4;

//Shadow values
shadow_y = 10000; //For calculation of draw distance
//For Drawing Shadow 
/*shadow_off_x = 0; //Offset values
shadow_off_y = 0;
shadow_scale_x = 1; //Scaling values
shadow_scale_y = 1;*/


//Squash and Strecth Effect
stretch_y = 1;
stretch_x = 1;

//New Code
walljump_state = 0;