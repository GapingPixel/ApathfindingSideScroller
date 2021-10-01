/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var bone_volley_point = ds_map_create();

skeleton_bone_state_get("mouthL", bone_volley_point);
enemy_var_mouth_L[0] = ds_map_find_value(bone_volley_point,"worldX");
enemy_var_mouth_L[1] = ds_map_find_value(bone_volley_point,"worldY");
skeleton_bone_state_set("mouthL", bone_volley_point);


skeleton_bone_state_get("mouthR", bone_volley_point);
enemy_var_mouth_R[1] = ds_map_find_value(bone_volley_point,"worldX");
enemy_var_mouth_R[1] = ds_map_find_value(bone_volley_point,"worldY");
skeleton_bone_state_set("mouthR", bone_volley_point);

ds_map_destroy(bone_volley_point);