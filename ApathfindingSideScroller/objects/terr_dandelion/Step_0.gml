/// @description Insert description here
// You can write your code in this editor
var anim = skeleton_animation_get();
if env_dur <= 0
{
	if anim != "1_destroyed"
	{
	part_particles_create(global.parsys,dand_pos_x,dand_pos_y,part_var_terrain_dandelions,50);

	if object_state = objectState.onFire
	{
	scr_play_sound(snd_common_fire_sizzle,0,0.9,1.1);
	part_particles_create(global.parsys,dand_pos_x,dand_pos_y,part_var_env_combust_embers,35);
	part_particles_create(global.parsys,dand_pos_x,dand_pos_y,part_var_env_combust_smoke,25);
	}
	scr_env_drop_goods();

	skeleton_animation_set("1_destroyed");
	}
}
