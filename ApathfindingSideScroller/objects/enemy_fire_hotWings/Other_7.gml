/// @description Animation End
if enemy_hp > 0
{
if skeleton_animation_get() = "2_openmouth"
{
    skeleton_animation_set("3_flying_mouthopen")
	enemy_var_flaming = 2;
}

if skeleton_animation_get() = "1_bounce"
    skeleton_animation_set("0_flying")
    
if skeleton_animation_get() = "4_bounce_mouthopen"
    skeleton_animation_set("3_flying_mouthopen")  
}

