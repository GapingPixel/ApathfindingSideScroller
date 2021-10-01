/// @description Set variables
event_inherited();

scr_set_enemy_vars(12,1,1.5,0.5,0.5,1.5,true,true,true);


//Alarm
//alarm[1] = 60;
gravNorm = 1.5;
vyMax = 30;

enemy_var_target_range = 400;



enemy_behavior = enemy_IDLE;

//Animation mixing
image_speed = 0.75;
skeleton_animation_set("0_idle");
/*skeleton_animation_mix("0_idle","1_attack_buildup",0.001);
skeleton_animation_mix("1_attack_buildup","2_attack", 0.001);
skeleton_animation_mix("2_attack","0_idle", 0.001);*/

//Tier
switch(image_blend)
{
	case c_red: skeleton_skin_set("tier2"); break;
	default: skeleton_skin_set("tier1"); break;
}

image_blend = c_white;


