/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var mouth = ds_map_create();

skeleton_bone_state_get("mouth", mouth);
enemy_var_mouth_x = ds_map_find_value(mouth,"worldX");
enemy_var_mouth_y = ds_map_find_value(mouth,"worldY");
skeleton_bone_state_set("mouth", mouth);

ds_map_destroy(mouth);