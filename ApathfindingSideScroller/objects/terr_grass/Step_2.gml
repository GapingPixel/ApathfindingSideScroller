
if env_heat_value >= 1
{
scr_env_damage(0.05,1,false);
part_particles_create(global.parsys, 
x + random_range(-sprite_width/2,sprite_width/2), 
y + random_range(-(sprite_height/2),0), 
part_var_env_combust_flame,round(5*image_yscale));
    if object_state = objectState.normal
    {
        object_state = objectState.onFire
		part_particles_create(global.parsys,x,y-sprite_height/2,part_var_env_combust_spark_point,round(20*image_yscale));
		part_particles_create(global.parsys,x,y-sprite_height/2,part_var_env_combust_spark_ignite,5);
        
        scr_play_sound(snd_common_fire_sizzle,0,0.9,1.1);
        alarm[1] = 10;
		alarm[2] = 90;//Begin burning away
    }
}

var skew_scale = (16 / (image_yscale * 2));
skew = Approach(skew, set, 0.5); //0.5

//if (xskew == xset)
//    xset *= -0.5;
    
if (parent) {
    x = parent.x + dx;
    y = parent.y + dy; 
}

set += 0.5;
set = min(set, skewmax);

if (--delay <=0) {
    skewmax = random_range(-skew_scale, skew_scale);
    delay = 4;
}

