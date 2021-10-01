/// @description Animation end
var anim = skeleton_animation_get();

switch(anim)
{

case "3_shoot":
    skeleton_animation_set("0_idle");
	enemy_behavior = enemy_IDLE;
    alarm[1] = 40;
break;

case "2_land":
    skeleton_animation_set("0_idle");
    alarm[1] = 30;
break;

case "1_turn":
    skeleton_animation_set("1_walk");
break;

}