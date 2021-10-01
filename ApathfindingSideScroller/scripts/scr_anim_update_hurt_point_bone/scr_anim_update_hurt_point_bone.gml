/// @description Update hurt point based on enemy's bone point
/// @param bone string
function scr_anim_update_hurt_point_bone(argument0) {

	var bone = argument0;

	var hurt = ds_map_create();

	skeleton_bone_state_get(bone, hurt);
	hurt_x = ds_map_find_value(hurt,"worldX");
	hurt_y = ds_map_find_value(hurt,"worldY");
	skeleton_bone_state_set(bone, hurt);

	ds_map_destroy(hurt);


}
