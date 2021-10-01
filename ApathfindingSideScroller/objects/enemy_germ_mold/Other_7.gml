/// @description Animation End
/*
if skeleton_animation_get() = "0_spawn"
{
    skeleton_animation_set("1_idle");
    image_speed = 0.5;
	enemy_behavior = enemy_IDLE;
}


if skeleton_animation_get() = "2_bite"
{
    skeleton_animation_set("1_idle");
    image_speed = 0.5
	vx = 0;
	enemy_behavior = enemy_IDLE;
}

if skeleton_animation_get() = "3_turn"
{
    image_xscale *= -1;
    skeleton_animation_set("1_idle");
    image_speed = 0.5;
	enemy_behavior = enemy_IDLE;
}

if skeleton_animation_get() = "99_KO"
{
    //part_particles_create(global.parsys,x,y+60,part_var_enemy_slime_globs,50)
    instance_destroy();
}


