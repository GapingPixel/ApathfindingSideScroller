//Restores extract_shot count when it is detroyed
particle_scr_main_bullet_destroy(part_var_plyrBullet_extractbullet,20);

if instance_exists(obj_plyr1)
    if obj_plyr1.extract_shot < 3
        obj_plyr1.extract_shot += 1;

