/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();



var bone_rifle_point = ds_map_create();

skeleton_bone_state_get("rifle", bone_rifle_point);
enemy_var_gun_point_x = ds_map_find_value(bone_rifle_point,"worldX");
enemy_var_gun_point_y = ds_map_find_value(bone_rifle_point,"worldY");
skeleton_bone_state_set("rifle", bone_rifle_point);

ds_map_destroy(bone_rifle_point);