/// @description
var anim = skeleton_animation_get();
///Effects
/*if !soundplay
{

/*audio_sound_pitch(snd_enemy_slimemold_spawn,random_range(1.5,1.9));
audio_play_sound(snd_enemy_slimemold_spawn,0,0)
soundplay = true;
}*/

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
	
	switch(enemy_behavior)
	{
		case enemy_WAIT:
		var range = 600;
		var plyr = instance_nearest(x,y,parPlyr)
		var detect = collision_circle(x,y,range,plyr,false,true)
		
		if detect
			enemy_behavior = enemy_SPAWN;
		
		break;
		
		case enemy_SPAWN:
			image_speed = 0.75;
		break;
		
		case enemy_TURN:
		//if anim = "1_spawn"
			//part_particles_create(global.parsys,x,y,part_var_enemy_slime_fall,5);
		break;
		
		case enemy_IDLE:
		//Turning
		if instance_exists(Camera)
		{
			if x >= Camera.x && image_xscale = 1
			{
			    if anim != "3_turn"
			    {
			        image_xscale *= -1;
			        scr_skeleton_animation_setAnim("3_turn");
					enemy_behavior = enemy_TURN;
			    }
			}
			if x <= Camera.x && image_xscale = -1
			{
			    if anim != "3_turn"
			    {
			        image_xscale *= -1;
			        scr_skeleton_animation_setAnim("3_turn");
					enemy_behavior = enemy_TURN;
			    }
			}
		}
		
		//Detect Player in Range for Shots
		//detect player to bite
		var plyr = parPlyr
			if instance_exists(plyr)
			{
				var shot_range = 600;
				#region Horizontal Shotrange
				if collision_rectangle(x,y,x+shot_range*image_xscale*-1,y+shot_range/5*image_yscale,plyr,false,true)
				{
					if alarm_get(1) < 0
						alarm[1] = choose(10,20,30);
				}
				#endregion
				
				#region Vertical shot range
				var vert_shot_range = point_direction(x,y,plyr.x,plyr.y)//Target Range
				var vert_shot_radius//The base length of the cone
				var vert_shot_dir;//Direction of cone depending on set up of tube enemy
				switch(image_yscale)
				{
					default://Ceiling
					vert_shot_dir = 270
					vert_shot_radius = 35
					break;
					
					case -1://On floor
					vert_shot_dir = 90;
					vert_shot_radius = 65;
					break;
				}
				if (vert_shot_range < (vert_shot_dir + vert_shot_radius)) 
				&&  (vert_shot_range > (vert_shot_dir - vert_shot_radius))
				{
					if alarm_get(2) < 0
						alarm[2] = choose(10,20,30);
				}
				#endregion
				
			}
		
		break;
		
		default:
		//Nothin'
		break;
	}
	break;
	
	case enemyState.FROZEN:
	if anim = "1_spawn"
		image_index = 10;
		
		scr_enemy_freeze_check();
	break;
	
	case enemyState.HITSTUN:
		image_speed = 0;
	break;
}
#endregion;

#region Animation End
if (image_index > image_number - 1)
{

switch(anim)
{
	case "1_spawn":
	    scr_skeleton_animation_setAnim("2_idle");
	    enemy_def_mult = 1;
		enemy_behavior = enemy_IDLE;
	break;

	case "4_shoot":
	    scr_skeleton_animation_setAnim("2_idle");
	    enemy_behavior = enemy_IDLE;
	break;

	case "5_shoot_down":
	    scr_skeleton_animation_setAnim("2_idle");
	    enemy_behavior = enemy_IDLE;
	break;

	case "3_turn":
	    scr_skeleton_animation_setAnim("2_idle");
		enemy_behavior = enemy_IDLE;
	break;


	case "99_KO":
	    instance_destroy();
	break;
	
}

}
#endregion

#region Death
//Kill off when ledge is destroyed
var hang = instance_place(x,y-1*image_yscale,parJumpThru)
var hang_solid = instance_place(x,y-1*image_yscale,parSolid)

if hang = noone || hang_solid = noone
{
    enemy_hp = -1;
}

if enemy_hp <= 0
{
        enemy_state = enemyState.NORMAL
		enemy_behavior = enemy_KO;
        image_speed = 0.75;
        image_blend = c_white;

    if skeleton_animation_get() != "99_KO"
    {
        //audio_sound_pitch(snd_boom,random_range(1.5,2));
        //audio_play_sound(snd_boom,0,0);
		timeline_running = false;
        scr_skeleton_animation_setAnim("99_KO");
        //part_particles_create(global.parsys,x,y,part_var_enemy_slime_boom,20);
        /*audio_sound_pitch(snd_enemy_slimemold_die,random_range(1.8,2));
        audio_play_sound(snd_enemy_slimemold_die,0,0);*/
    }
}
#endregion
