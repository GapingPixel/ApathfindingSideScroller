/// @description Animation Transitions

if skeleton_animation_get() = "0_spawn"
    {
        skeleton_animation_set("1_fly");
        image_speed = 0.5
    }

if skeleton_animation_get() = "2_tip"
    {
        skeleton_animation_set("3_fall");
		image_speed = 1;
    }

