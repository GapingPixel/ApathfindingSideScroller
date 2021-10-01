/// @description Update Points
event_inherited();


var bone_volley_point = ds_map_create();

skeleton_bone_state_get("gunL", bone_volley_point);
enemy_var_volley_x[0] = ds_map_find_value(bone_volley_point,"worldX");
enemy_var_volley_y[0] = ds_map_find_value(bone_volley_point,"worldY");
skeleton_bone_state_set("gunL", bone_volley_point);


skeleton_bone_state_get("gunR", bone_volley_point);
enemy_var_volley_x[1] = ds_map_find_value(bone_volley_point,"worldX");
enemy_var_volley_y[1] = ds_map_find_value(bone_volley_point,"worldY");
skeleton_bone_state_set("gunR", bone_volley_point);

ds_map_destroy(bone_volley_point);



var jet_point_L = ds_map_create();
skeleton_bone_state_get("rocketpack_exhaust_L", jet_point_L);
enemy_var_jet_exhaust_L[0] = ds_map_find_value(jet_point_L,"worldX");
enemy_var_jet_exhaust_L[1] = ds_map_find_value(jet_point_L,"worldY");
skeleton_bone_state_set("rocketpack_exhaust_L", jet_point_L);
ds_map_destroy(jet_point_L);

var jet_point_R = ds_map_create();
skeleton_bone_state_get("rocketpack_exhaust_R", jet_point_R);
enemy_var_jet_exhaust_R[0] = ds_map_find_value(jet_point_R,"worldX");
enemy_var_jet_exhaust_R[1] = ds_map_find_value(jet_point_R,"worldY");
skeleton_bone_state_set("rocketpack_exhaust_R", jet_point_R);
ds_map_destroy(jet_point_R);
