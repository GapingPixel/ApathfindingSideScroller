/// @description Set Enemy Vars
event_inherited();
scr_set_enemy_vars(20,1,2,1,5,0.15,true,false,true);
spawn_limit = 2;
spawn_count = 0;
//Animation
image_speed = 0.25;
skeleton_animation_set("0_idle");
vyMax = 15;

/*skeleton_animation_mix("blob_idle","blob_shoot",0.05);
skeleton_animation_mix("blob_shoot","blob_idle",0.05);*/


//Shoot blob
alarm[1] = 35;
dir = 1;//Directory depending on camera pos
dir_lock = false;//For creation code, disable trajectory from changing


