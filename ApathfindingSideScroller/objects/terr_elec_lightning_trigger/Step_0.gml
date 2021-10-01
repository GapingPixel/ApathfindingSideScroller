/// @description Insert description here
// You can write your code in this editor
var lightning_spot_target = instance_nearest(x,y,objEntity);


if (instance_exists(lightning_spot_target)) && (instance_exists(lightning_spot_trap_id)) {//if target and child exists
    if (place_meeting(x, y, lightning_spot_target) && lightning_spot_trap_id.hazard_shot_ready == true) {                      //and target steps on trap
		lightning_spot_trap_id.hazard_triggered = true;                           //child is triggered
    } 
} 