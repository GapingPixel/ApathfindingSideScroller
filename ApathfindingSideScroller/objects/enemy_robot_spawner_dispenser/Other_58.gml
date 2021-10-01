/// @description Insert description here
// You can write your code in this editor
scr_anim_update_hurt_point_bone("ROOT")

var tongue = ds_map_create();

skeleton_bone_state_get("hole", tongue);
launcher_hole_x = ds_map_find_value(tongue,"worldX");
launcher_hole_y = ds_map_find_value(tongue,"worldY");
skeleton_bone_state_set("hole", tongue);

ds_map_destroy(tongue);