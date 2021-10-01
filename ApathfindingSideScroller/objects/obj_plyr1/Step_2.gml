/// @description End Entity Step
event_inherited();

//Dash Cancel
if var_dashing = 1 && 
((facing = 1 && left_inp) 
|| (facing = -1 && right_inp))
{
    alarm[0] = 1;
}

//Death
if global.hp[0] <= 0
{
var_dead = 1
image_alpha = 0
}

//Damage from Hot Things
if var_temp > 250
{
    var_temp = 0
    //plyr_damage(0,2);
}

//Damage from Hot Things
if var_temp < -250
{
    var_temp = 0;
    //plyr_freeze(0);
}

