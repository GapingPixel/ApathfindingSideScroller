/// @description Animation end
/*var anim = skeleton_animation_get();

switch(anim)
{

case "5_shoot_startup":
    skeleton_animation_set("6_shoot_firing");
	enemy_behavior = enemy_ATTACK_1;
    alarm[3] = 40;
break;

case "4_land":
    skeleton_animation_set("0_idle");
    alarm[1] = 90;
break;

case "2_turn":
    skeleton_animation_set("0_idle");
	enemy_behavior = enemy_IDLE;
	alarm[1] = 5;
break;

}