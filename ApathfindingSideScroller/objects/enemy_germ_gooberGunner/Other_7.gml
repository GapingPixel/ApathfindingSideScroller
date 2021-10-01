/// @description Animation End
/*
var anim = skeleton_animation_get();

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
	case enemy_AIM:
	skeleton_animation_set("0_idle");
	break;
	}
	break;
	
	case "0_idle_aim_fwrd_fire":
		skeleton_animation_set("0_idle_aim_fwrd");
	break;
	
	case "0_idle_aim_diagup_fire":
		skeleton_animation_set("0_idle_aim_diagup");
	break;
	
	case "0_idle_aim_diagdown_fire":
		skeleton_animation_set("0_idle_aim_diagdown");
	break;
	
	case "0_idle_aim_down_fire":
		skeleton_animation_set("0_idle_aim_down");
	break;
	
	case "0_idle_aim_up_fire":
		skeleton_animation_set("0_idle_aim_up");
	break;
	
	case "5_throw":
		skeleton_animation_set("0_idle");
	break;
	
	
}


