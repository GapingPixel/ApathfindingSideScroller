/// @description Insert description here
// You can write your code in this editor

if hazard_triggered == false
{
	var check_line = collision_line(x-128,y,x-128,y-(1000),Camera,false,true)
	
	if check_line
	{
		scr_play_sound(snd_common_ore_explosion,10,0.6,0.7)
		scr_play_sound(snd_common_ore_crumbling_long,10,0.6,0.7)
		y_speed = 2;
		alarm[0] = hazard_time
		hazard_triggered = true;
	}
}
