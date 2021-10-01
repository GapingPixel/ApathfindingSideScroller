/// @description Movement
image_xscale = facing
var anim = skeleton_animation_get();
var plyr = instance_nearest(x,y,parPlyr);
var chase_range = 250;
var plyr_distance = collision_rectangle(x,y-chase_range,x+chase_range*facing,y+chase_range,plyr,false,true);

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	Gravity();
	if !onGround
	{
	    if anim != "2_fall"
	    {
	        scr_skeleton_animation_setAnim("2_fall");
	    }
	    image_speed = 0.75;
		
		
		if place_meeting(x+facing,y,parSolid)//Hop off wall a bit
		{
		    facing *= -1
		    vy -= jumpHeight/2
		    vx -= 6 * facing

		}
		
		vx = vxMax*facing;//Move only when we are off the ground
		
	}
	else
	{
	    if anim = "2_fall" && anim != "1_jump"
	        scr_skeleton_animation_setAnim("3_land");
			
		//Turning
		if instance_exists(plyr)
		{
			if x >= plyr.x && facing = 1
		    {
		        if anim != "4_turn"
		        {
					scr_skeleton_animation_setAnim("4_turn");
					 facing *= -1
		        }
		    }
		    if x <= plyr.x && facing = -1
		    {
		        if anim != "4_turn"
		        {
					scr_skeleton_animation_setAnim("4_turn");
					facing *= -1;
		        }
		    }
		}
		
		vx = 0;
	}
	
	
	
	switch(enemy_behavior)
	{
		case enemy_IDLE://Stand idle and wait for player
		
		if instance_exists(plyr)
		{
			if plyr_distance
				enemy_behavior = enemy_PURSUE;
		}
		
		
		break;
		
		case enemy_PURSUE://Start jumping
		
		
		if instance_exists(plyr)
		{
			if !plyr_distance
				enemy_behavior = enemy_IDLE;
		}
		
		//Jump Alarm
		if onGround && alarm_get(1) < 0
			alarm[1] = choose(30,60,90)
		break;
	}
	break;
	
	case enemyState.FROZEN:
	vx = 0;
	vy = 0;
	scr_enemy_freeze_check();
	break;
	
	case enemyState.SHOCKED:
	vx = 0;
	vy = 0;
	if anim = "98_stun"
		scr_skeleton_animation_setAnim("98_stun");
	break;
}
#endregion


#region Animation End
if (image_index > image_number - 1)
{

switch(anim)
{
	case "1_jump":
    vy -= jumpHeight * random_range(0.9,1.1);
    scr_play_sound(snd_enemy_elem_fire_kitty_jump,0,0.9,1)
   
	#region Particles
	var part_var_kitty_jump = part_type_create();
	part_type_shape(part_var_kitty_jump,pt_shape_line);
	part_type_size(part_var_kitty_jump,1,1,-0.05,0);
	part_type_scale(part_var_kitty_jump,1,0.75);
	part_type_color3(part_var_kitty_jump,255,8421631,255);
	part_type_alpha2(part_var_kitty_jump,1,0);
	part_type_speed(part_var_kitty_jump,5,12,0,0);
	part_type_direction(part_var_kitty_jump,0,180,0,0);
	part_type_orientation(part_var_kitty_jump,0,0,0,0,1);
	part_type_blend(part_var_kitty_jump,1);
	part_type_life(part_var_kitty_jump,15,30);
	#endregion
    part_particles_create(global.parsys,x,y+(sprite_height/2),part_var_kitty_jump,155);
    scr_skeleton_animation_setAnim("0_fall");
    
    //Poop explosion in the bottom
	instance_create_depth(x,y+(sprite_height/2),depth,enemy_bullet_fire_kittyExplosion);
    break;

	//Land to idle
	case "3_land":
    image_speed = 0.5;
    scr_skeleton_animation_setAnim("0_idle");
    alarm[1] = choose(35,25,15);

	break;

	//Turn to idle
	case "4_turn":
    image_speed = 0.5;
    scr_skeleton_animation_setAnim("0_idle");
	break;
	
}

}
#endregion

#region Death
if enemy_hp <= 0
{
   if alarm_get(11) < 0
    {
        alarm[11] = 10;
        scr_skeleton_animation_setAnim("98_stun");
        scr_play_sound(snd_common_explosion_popcorn_1,0,1.1,1.2)
        scr_play_sound(snd_enemy_elem_fire_kitty_kill,0,0.9,1);
    }
}
#endregion

