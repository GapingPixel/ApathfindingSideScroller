/// @description Collecting HP
function plyr_collect_HP(argument0, argument1) {
	/*
	arg0 = plyr
	arg1 = amount
	*/
	global.hp[argument0] += argument1

	if global.hp[argument0] > global.hp_max[argument0]
	     global.hp[argument0] = global.hp_max[argument0]

	audio_play_sound(snd_common_collectable_hp_get,0,0);


	part_particles_create(global.parsys,x,y,part_var_collectables_heal_twinkle,50);
	part_particles_create(global.parsys,x,y,part_var_collectables_heal_ring,5);


	instance_destroy();



}
