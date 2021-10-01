/// @description Dandelion Position
var dand_pos = ds_map_create();

skeleton_bone_state_get("dand", dand_pos);
dand_pos_x = ds_map_find_value(dand_pos,"worldX");
dand_pos_y = ds_map_find_value(dand_pos,"worldY");
skeleton_bone_state_set("dand", dand_pos);

ds_map_destroy(dand_pos);