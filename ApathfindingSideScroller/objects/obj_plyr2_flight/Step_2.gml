
repeat(abs(vy))
	{
		if !(place_meeting(x, y+sign(vy), solid_inv_wall))
		y += sign(vy);
		else
		vy = 0;
	}
	
repeat(abs(vx))	
	{
		if !(place_meeting(x + sign(vx), y, solid_inv_wall))
		x += sign(vx);
		else
		vx = 0;
	}
 
//Death
if global.hp[1] <= 0
{
var_dead = 1
image_alpha = 0
}

//Damage from Hot Things
if var_temp > 250
{
    var_temp = 0
    plyr_damage(1,2)
}

//Freeze
if var_temp < -250
{
    var_temp = 0
    plyr_freeze(1);
}