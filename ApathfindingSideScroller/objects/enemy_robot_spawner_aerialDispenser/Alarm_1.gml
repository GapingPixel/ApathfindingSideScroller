/// @description Shoot Robot Alarm
var dice_roll = irandom(1);
image_speed = 0.5
switch(dice_roll)
{
	case 0://Poop Minion
		skeleton_animation_set("1_shoot_minion");
		enemy_behavior = enemy_ATTACK_1;
		action_timeline_set(minibossTL_doublevendor_minion,0,0,0);
	break;
	
	
	case 1://Poop Dropper
		skeleton_animation_set("1_shoot_dropper");
		enemy_behavior = enemy_ATTACK_2;
		action_timeline_set(minibossTL_doublevendor_dropper,0,0,0);
	break;	
}