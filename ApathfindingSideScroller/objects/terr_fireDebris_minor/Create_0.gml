event_inherited();
scr_env_set_vars(1,4);
part_type_size(part_var_enemy_hit_fire,0.2,0.5,0,0);
env_heat_value = 10;
//audio_play_sound(snd_env_firelit,0,0);
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
vxMax       = 5;
vyMax       = 20;
jumpHeight  = 15.00;
gravNorm    = 1.5;

grav_decay = 20;//for falling

