//@description Initiate Flaming alarm
var anim = skeleton_animation_get();
{
if anim != "1_bounce" && anim != "4_bounce_mouthopen"

    if enemy_var_flaming = 1
    {
    skeleton_animation_set("2_openmouth");
    }
    else
    {
    skeleton_animation_set("0_flying");
    enemy_var_flaming = 1;
    }

alarm[1] = choose(120,180);
}

