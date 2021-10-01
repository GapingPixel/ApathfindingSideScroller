/// @description Movement
var anim = skeleton_animation_get();
image_xscale = facing;
var plyr = instance_nearest(x,y,parPlyr);
var line_of_sight = collision_rectangle(x,y - 100,x+350*facing,y + 100,plyr,false,true)
switch(enemy_state)
{
	case enemyState.NORMAL:
	switch(enemy_behavior)
	{
		case enemy_FLY:
		if place_meeting(x+facing,y,parSolid)
		{
	        if enemy_var_flaming <= 1
	        {
	            if anim != "1_bounce"
	                skeleton_animation_set("1_bounce")
	        }
	        else
	        {
	            if anim != "4_bounce_mouthopen"
	                skeleton_animation_set("4_bounce_mouthopen")
	        }
	         facing *= -1;
		}
	
		if enemy_var_flaming > 1
	    {
	        #region Particles
			var part_flame_trail = part_type_create();
			part_type_sprite(part_flame_trail,spr_effect_fire_flame,1,0,1);
			part_type_size(part_flame_trail,1,1.3,-0.05,0.10);
			part_type_scale(part_flame_trail,1,1);
			part_type_color3(part_flame_trail,16711680,8454143,33023);
			part_type_alpha2(part_flame_trail,0.50,1);
			part_type_direction(part_flame_trail,0,359,0,15);
			part_type_orientation(part_flame_trail,0,0,0,15,1);
			part_type_blend(part_flame_trail,1);
			part_type_life(part_flame_trail,20,0);
			#endregion
			part_particles_create(global.parsys_below,x,y,part_flame_trail,3)
	        /*scr_bullet_dmg_env(0.1,1,false)
	        scr_bullet_dmg_env_solids(0,1,false)
	        scr_bullet_dmg_env_platforms(0,1,false)*/
	    }
	    //Moving
	    if anim != "2_openmouth"
	        vx = vxMax * facing * enemy_var_flaming
	    else
	        vx = 0;
		}
		
		//Detect player to enter Flame mode
		if instance_exists(plyr)
		if line_of_sight
		{
			if alarm_get(1) < 0
				alarm[1] = 30;
		}
		
		break;
	break;
	
	case enemyState.FROZEN:
	vx = 0
	vy = 0
	scr_enemy_freeze_check();
	break;
	
	case enemyState.SHOCKED:
	particle_scr_enemy_statusCreate_shock_bang(1);
	break;
}


///Death
if enemy_hp <= 0
{
	vx = 0;
	vy = 0;
    if alarm_get(11) < 0
    {
        alarm[11] = 20;
        skeleton_animation_set("98_stun");
        //audio_sound_pitch(snd_h_ko,random_range(0.9,1.1));
        scr_play_sound(snd_common_explosion_popcorn_2,0,0.9,1.1);
    }
}

