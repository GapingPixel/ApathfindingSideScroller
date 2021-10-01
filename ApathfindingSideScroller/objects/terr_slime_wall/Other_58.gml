/// @description Insert description here
// You can write your code in this editor
var stretchBone = 1;
var envDur_max = 30;

if (env_dur > 0)
{
stretchBone = envDur_max / env_dur;
}

if (stretchBone > 4)
{
	stretchBone = 4;
}


var bone_map = ds_map_create();
skeleton_bone_state_get("stretch", bone_map);
ds_map_replace(bone_map,"xscale", stretchBone);
skeleton_bone_state_set("stretch", bone_map);
ds_map_destroy(bone_map);