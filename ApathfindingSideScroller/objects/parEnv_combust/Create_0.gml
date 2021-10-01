event_inherited();
scr_env_set_vars(5,0);
particle_scr_objects_grass();
//Bool that determines if combustable material is brittle or not to destroy bullets or not
//I.E. Dandelion
env_material_brittle = true;
part_type_scale(part_var_env_combust_spark_ignite,0.5*image_yscale,0.5*image_yscale);
part_type_size(part_var_env_combust_spark_flame,0.1,0.5,-0.1,0);
part_type_life(part_var_env_combust_spark_point,round(15+image_yscale),round(30+image_yscale));
//alarm[1] = 10;

