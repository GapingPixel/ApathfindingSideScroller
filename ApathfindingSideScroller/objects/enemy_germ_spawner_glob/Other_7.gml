/// @description Animation
/*
if skeleton_animation_get() = "blob_shoot"
{
    skeleton_animation_set("blob_idle");
    if spawn_count < spawn_limit
    alarm[1] = 50;
    
    image_speed = 0.25;
   
}

/*if skeleton_animation_get() = "blob_idle"
{
    if !instance_exists(enemy_slime_mold)
    {
        if spawn_count >= spawn_limit
            alarm[1] = 50;
        spawn_count = 0;
    }
}

