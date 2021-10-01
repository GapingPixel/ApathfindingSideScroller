/// @description AI and Animation End
CastShadow();
var anim = skeleton_animation_get();
var bite_range = 400;

#region AI
switch(enemy_state)
{
	case enemyState.NORMAL:
		Gravity();
		switch(enemy_behavior)
		{
			case enemy_SPAWN:
			case enemy_TURN:
				//Spawn
				if anim = "0_spawn"
				{
				    //part_particles_create(global.parsys,x,y+60,part_var_enemy_slime_globs,10)
				}
			
				//Globs while turning
				if anim = "3_turn" && image_index > 9
				{
				    //part_particles_create(global.parsys,x,y+60,part_var_enemy_slime_globs,10)
				}
			break;
			
			case enemy_IDLE:

			//Turning
			var plyr = instance_nearest(x,y,parPlyr)
			if instance_exists(parPlyr)
			{
				if x >= plyr.x && image_xscale = 1
				{
				    if anim != "3_turn"
				    {
				       scr_skeleton_animation_setAnim("3_turn");
				        //audio_sound_pitch(snd_enemy_slime_slimeglob_turn,1);
				        //audio_play_sound(snd_enemy_slime_slimeglob_turn,0,0);
						enemy_behavior = enemy_TURN;
				    }
				}
				if x <= plyr.x && image_xscale = -1
				{
				    if anim != "3_turn"
				    {
				       scr_skeleton_animation_setAnim("3_turn");
				        //audio_sound_pitch(snd_enemy_slime_slimeglob_turn,1);
				        //audio_play_sound(snd_enemy_slime_slimeglob_turn,0,0);
						enemy_behavior = enemy_TURN;
				    }
				}
			}
				
			var solid_bonk = instance_place(x,y-1,parSolid)
		    if solid_bonk != noone && onGround
		    {
		        x += 16*image_xscale
		    }
			
			//detect player to bite
			if instance_exists(parPlyr)
			{
				if collision_rectangle(x,y-50,x+bite_range*image_xscale,y+bite_range/4,parPlyr,false,true)
				{
					if alarm_get(1) < 0
						alarm[1] = 10;
				}
			}
			
			break;
			
			
			case enemy_ATTACK_1:
				if image_index > 13
				vx = vxMax * image_xscale;
			break;
		}
	
	break;
	
	
	case enemyState.FROZEN:
	if anim = "0_spawn"
	{
		image_index = 10;
	}
	scr_enemy_freeze_check();
	break;
	
}
#endregion

#region Animation End
if (image_index > image_number - 1)
{

switch(anim)
{
	case  "0_spawn":
   scr_skeleton_animation_setAnim("1_idle");
    image_speed = 0.5;
	enemy_behavior = enemy_IDLE;
	break;


	case "2_bite":
   scr_skeleton_animation_setAnim("1_idle");
    image_speed = 0.5
	vx = 0;
	enemy_behavior = enemy_IDLE;
	break;

	case "3_turn":
    image_xscale *= -1;
   scr_skeleton_animation_setAnim("1_idle");
    image_speed = 0.5;
	enemy_behavior = enemy_IDLE;
	break;

	case "99_KO":
	
    particle_scr_eff_enemy_germ_boom(30,random_range(0.75,1))
    instance_destroy();
	break;
}

}
#endregion

#region Death
if enemy_hp <= 0
{
    enemy_state = enemyState.NORMAL
	enemy_behavior = enemy_KO;
    image_speed = 0.5;
    image_blend = c_white;
	vx = 0;
    if anim != "99_KO"
    {
        
		scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
		particle_scr_eff_boom(0.5);
        
       scr_skeleton_animation_setAnim("99_KO");
        scr_play_sound(snd_enemy_slime_cry_4,0,0.9,1.2);
    }
}
#endregion
