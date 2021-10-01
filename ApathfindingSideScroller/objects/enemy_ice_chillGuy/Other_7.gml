/// @description Animation end
var anim = skeleton_animation_get();

switch(anim)
{

case "5_shoot":
    skeleton_animation_set("0_idle");
	enemy_behavior = enemy_IDLE;
	enemy_var_attack_cooldown = choose(60,120);
    alarm[1] = 15;
	image_speed = 0.5;
break;

case "4_land":
    skeleton_animation_set("0_idle");
    alarm[1] = 90;
break;

case "2_turn":
    skeleton_animation_set("0_idle");
	enemy_behavior = enemy_IDLE;
	alarm[1] = 1;
break;

}