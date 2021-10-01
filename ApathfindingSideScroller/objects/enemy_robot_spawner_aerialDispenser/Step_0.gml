/// @description Handle Death

#region Animation End
if (image_index > image_number - 1)
{
var anim = skeleton_animation_get();

switch(anim)
{
	case "1_shoot_dropper":
	case "1_shoot_minion":
		skeleton_animation_set("0_idle");
		alarm[1] = choose(120,180);
		image_speed = 1;
		enemy_behavior = enemy_IDLE;
	break;
}

}
#endregion


//Destroy invisible wall
if enemy_hp < 0 and enemy_behavior != enemy_KO
{

	skeleton_animation_set("99_KO");

	alarm[9] = 5;
	alarm[10] = 180;
	
	enemy_behavior = enemy_KO;
	
}