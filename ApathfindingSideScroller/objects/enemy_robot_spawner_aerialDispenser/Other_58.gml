/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var funnel = ds_map_create();

skeleton_bone_state_get("Funnel", funnel);
miniboss_var_robot_vendor_minion_funnel_x = ds_map_find_value(funnel,"worldX");
miniboss_var_robot_vendor_minion_funnel_y = ds_map_find_value(funnel,"worldY");
skeleton_bone_state_set("Funnel", funnel);

ds_map_destroy(funnel);

var dropperfunnel = ds_map_create();

skeleton_bone_state_get("Main2", dropperfunnel);
miniboss_var_robot_vendor_dropper_funnel_x = ds_map_find_value(dropperfunnel,"worldX");
miniboss_var_robot_vendor_dropper_funnel_y = ds_map_find_value(dropperfunnel,"worldY");
skeleton_bone_state_set("Main2", dropperfunnel);

ds_map_destroy(dropperfunnel);