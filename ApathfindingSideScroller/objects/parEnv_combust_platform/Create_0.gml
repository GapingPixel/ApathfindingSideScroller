event_inherited();
scr_env_set_vars(10,0);
particle_scr_objects_grass();

//alarm[1] = 10;
part_type_scale(part_var_env_combust_spark_ignite,0.5*image_yscale,0.5*image_yscale);
part_type_size(part_var_env_combust_spark_flame,image_yscale*0.05,image_yscale*0.25,0,0);
part_type_life(part_var_env_combust_spark_point,round(15*image_yscale),0);

