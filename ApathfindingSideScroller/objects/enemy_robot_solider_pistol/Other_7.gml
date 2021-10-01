/// @description Animation End
/*var anim = skeleton_animation_get();

switch(anim)
{
	case "4_land":
	case "2_turn":
    switch(enemy_behavior)
	{
	case enemy_RUN:
	skeleton_animation_set("1_run");
	break;
	case enemy_IDLE:
	case enemy_WAIT:
	skeleton_animation_set("0_idle");
	break;
	}
	break;
	
	case "5_shoot_aim":
	skeleton_animation_set("5_shoot_hold");
	alarm[4] = 30;
	break;
	
	case "5_shoot_fire":
	enemy_var_soldier_shots--;
	
	if enemy_var_soldier_shots > 0
	{
	skeleton_animation_set("5_shoot_hold");
	alarm[4] = 5;
	}
	else
	{
		skeleton_animation_set("0_idle");
		enemy_behavior = enemy_IDLE;
		enemy_var_soldier_shots = choose(3,4);//Reload
		enemy_var_soldier_shot_cooldown = 120;//Cooldown period
		alarm[5] = 15;
	}
	break;
	
	case "6_ev_halt":
    skeleton_animation_set("6_ev_point");
	break;
	
	case "6_ev_point":
	skeleton_animation_set("0_idle");
	enemy_behavior = enemy_IDLE;
	alarm[5] = 15;
	break;
	
}


